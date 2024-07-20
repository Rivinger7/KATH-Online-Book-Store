/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.BookDAO;
import DAO.Implement.BookDAOImp;
import DAO.Implement.OrderBookDAOImp;
import DAO.Implement.OrderDAOImp;
import DAO.OrderBookDAO;
import DAO.OrderDAO;
import Model.OrderBookDTO;
import Model.OrderDTO;
import Model.ShoppingCartDTO;
import Model.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admins
 */
public class CheckoutController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            HttpSession session = request.getSession();
            UserDTO user = (UserDTO) session.getAttribute("usersession");
            
            String action = request.getParameter("action");
            if (action != null) {
                switch (action) {
                    case "orderConfirmation":

                        String address = request.getParameter("address");
                        String city = request.getParameter("city");
                        String district = request.getParameter("district");
                        String ward = request.getParameter("ward");

                        if (user == null) {
                            response.sendRedirect("account.jsp");
                            return;
                        }

                        BookDAO bookDAO = new BookDAOImp();

                        double tottalPrice = (double) session.getAttribute("totalCartPrice");
//                        String shippingAddress = user.getAddress() + ", " + user.getWard() + ", "
//                                + user.getDistrict() + ", " + user.getCity();
                        String shippingAddress = address + ", " + "Ward" + ward + ", "
                                + district + ", " + city;
//                        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                        Date today = new Date();

                        OrderDAO orderDAO = new OrderDAOImp();
                        OrderDTO order = new OrderDTO();
                        List<ShoppingCartDTO> cartList = (List<ShoppingCartDTO>) session.getAttribute("cartBook");

                        order.setUserID(user.getId());
                        order.setUnitQuantity(cartList.size());
                        order.setTotalPrice(tottalPrice);
//                        order.setStatus("Pending");
//                        order.setPayment("COD");
                        order.setShippingAddress(shippingAddress);
                        order.setDate(today);

                        if (orderDAO.createOrder(order)) {
                            OrderBookDAO orderBookDAO = new OrderBookDAOImp();
                            int orderID = order.getOrderID();

                            for (ShoppingCartDTO item : cartList) {

                                OrderBookDTO orderBook = new OrderBookDTO();
                                orderBook.setOrderID(orderID);
                                orderBook.setBookID(item.getBookID());
                                orderBook.setTitle(item.getTitle());
                                orderBook.setAmount(item.getAmount());
                                orderBook.setImage(item.getImage());
                                orderBook.setPrice(item.getPrice());

                                orderBookDAO.insertToOrder(orderBook);

                                // Update Book Quantity
                                bookDAO.updateQuantityByBookID(item.getBookID(), item.getAmount());
                            }

                            System.out.println("Order succesfully!");

                            // This is so f**** amazing, it makes me f*** love learning algorithm
                            // Load from Database to Profile (Order History) | Start
                            List<OrderDTO> orderList = orderDAO.getOrderListByUserID(user.getId());

                            Map<Integer, List<OrderBookDTO>> orderBooksMap = new HashMap<>();

                            for (OrderDTO orderMap : orderList) {
                                List<OrderBookDTO> orderBooks = orderBookDAO.getAll(orderMap.getOrderID());
                                orderBooksMap.put(orderMap.getOrderID(), orderBooks);
                            }

//                for (OrderDTO order : orderList) {
//                    orderBookList = orderBookDAO.getAll(order.getOrderID());
//                }
                            session.setAttribute("orderBookList", orderBooksMap);
                            session.setAttribute("orderList", orderList);
                            // Load from Database to Profile (Order History) | End

                            session.removeAttribute("cartBook");
                            session.removeAttribute("cartList");
                            session.removeAttribute("totalCartPrice");

                            response.sendRedirect("./homepage");
                        } else {
//                            response.sendRedirect("");
                            out.print("Order failed!");
                        }

                        break;
                    case "cancel":
                        response.sendRedirect("./homepage");
                        break;
                }
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
