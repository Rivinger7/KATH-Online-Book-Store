/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.BookDAO;
import DAO.Implement.BookDAOImp;
import Model.CategoryDTO;
import Model.ShoppingCartDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admins
 */
public class ShoppingCartController extends HttpServlet {

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

            String quantityString = request.getParameter("quantity");
            
            String increasing = request.getParameter("increasing");
            String decreasing = request.getParameter("decreasing");
            String bookIDString = request.getParameter("bookID");
            String isDeleted = request.getParameter("isDeleted");

            HttpSession session = request.getSession();
            BookDAO bookDAO = new BookDAOImp();
            List<ShoppingCartDTO> cartListSession = (List<ShoppingCartDTO>) session.getAttribute("cartList");
            List<ShoppingCartDTO> cartBook = null;
            List<ShoppingCartDTO> cartList = null;
            if (cartListSession != null) {
                cartList = new ArrayList<>(cartListSession);
            }
            if (bookIDString != null) {
                int bookID = Integer.parseInt(bookIDString);

                if (increasing != null && decreasing == null) {
                    for (ShoppingCartDTO book : cartList) {
                        if (book.getBookID() == bookID) {
                            book.setAmount(book.getAmount() + 1);
                            cartListSession = cartList;
                            session.setAttribute("cartList", cartListSession);
                        }
                    }
                } else if (decreasing != null && increasing == null) {
//                    for (ShoppingCartDTO book : cartList) {
//                        if (book.getBookID() == bookID) {
//                            book.setAmount(book.getAmount() - 1);
//                            if (book.getAmount() == 0) {
//                                cartList.remove(book);
//                            }
//                            session.setAttribute("cartList", cartList);
//                        }
//                    }
                    Iterator<ShoppingCartDTO> iterator = cartList.iterator();
                    while (iterator.hasNext()) {
                        ShoppingCartDTO book = iterator.next();
                        if (book.getBookID() == bookID) {
                            int newAmount = book.getAmount() - 1;
                            if (newAmount > 0) {
                                book.setAmount(newAmount);
                                cartListSession = cartList;
                            } else if (newAmount == 0) {
                                iterator.remove();
                                cartListSession = cartList;
                                System.out.println("removed at ShoppingCartController");
                            }
                            session.setAttribute("cartList", cartListSession);
                            break;
                        }
                    }
                } else if (quantityString != null) {
                    int quantity = Integer.parseInt(quantityString);
                    
                    if (quantity < 0) {
                        quantity = 0;
                    }

                    if (quantity > 0) {
                        for (ShoppingCartDTO book : cartList) {
                            if (book.getBookID() == bookID) {
                                book.setAmount(quantity);
                                cartListSession = cartList;
                                session.setAttribute("cartList", cartListSession);
                            }
                        }
                    } else {
                        Iterator<ShoppingCartDTO> iterator = cartList.iterator();
                        while (iterator.hasNext()) {
                            ShoppingCartDTO book = iterator.next();
                            if (book.getBookID() == bookID) {
                                iterator.remove();
                                cartListSession = cartList;
                                System.out.println("removed at ShoppingCartController");
                                session.setAttribute("cartList", cartListSession);
                                break;
                            }
                        }
                    }
                }

                if (isDeleted != null) {
                    Iterator<ShoppingCartDTO> iterator = cartList.iterator();
                    while (iterator.hasNext()) {
                        ShoppingCartDTO book = iterator.next();
                        if (book.getBookID() == bookID) {
                            iterator.remove();
                            cartListSession = cartList;
                            System.out.println("removed");
                            session.setAttribute("cartList", cartListSession);
                            break;
                        }
                    }
                }
            }

            if (cartListSession != null) {
                cartBook = bookDAO.getCartBook(cartListSession);
                double totalPrice = bookDAO.getTotalCartPrice(cartList);

                session.setAttribute("cartBook", cartBook);
                session.setAttribute("cartList", cartListSession);
                session.setAttribute("totalCartPrice", totalPrice);
            }

            List<CategoryDTO> categoryList = bookDAO.getAllCategory();
            request.setAttribute("categoryList", categoryList);
//            String buyingNow = request.getParameter("buyingNow");
//            response.sendRedirect("shoppingcart.jsp");
            request.getRequestDispatcher("shoppingcart.jsp").forward(request, response);
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
