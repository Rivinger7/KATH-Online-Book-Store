/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.Implement.OrderBookDAOImp;
import DAO.Implement.OrderDAOImp;
import DAO.Implement.UserDAOImp;
import DAO.OrderBookDAO;
import DAO.OrderDAO;
import DAO.UserDAO;
import Model.GoogleDTO;
import Model.OrderBookDTO;
import Model.OrderDTO;
import Model.UserDTO;
import Utility.GoogleSupport;
import Utility.Hash;
import static Utility.RandomStringGenerator.generateRandomString;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
//import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class GoogleLoginController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String url = null;
        try {
            String code = request.getParameter("code");
            String accessToken = GoogleSupport.getToken(code);
            GoogleDTO googleUser = GoogleSupport.getUserInfo(accessToken);
//            PrintWriter out = response.getWriter();
//            out.print(googleUser);

            UserDAO userDAO = new UserDAOImp();
            UserDTO oldUser = userDAO.getByEmail(googleUser.getEmail());
            boolean isExisted = oldUser != null;
            if (isExisted) {
                // Login 2nd which means login only not register the account
                if (Hash.SHA256(googleUser.getEmail()).equals(oldUser.getUsername())) {
                    oldUser.setAvatarPath(googleUser.getPicture());
                    HttpSession session = request.getSession();
                    session.setAttribute("usersession", oldUser);
                    session.setAttribute("isGoogleUser", true);
//                    Cookie usernameCookie = new Cookie("usernameCookie", oldUser.getUsername());
//                    Cookie passwordCookie = new Cookie("passwordCookie", password);
//                    usernameCookie.setMaxAge(60 * 60 * 24 * 365);

//                    response.addCookie(usernameCookie);
//                    response.addCookie(passwordCookie);
// This is so f**** amazing, it makes me f*** love learning algorithm
                    // Load from Database to Profile (Order History) | Start
                    OrderDAO orderDAO = new OrderDAOImp();
                    OrderBookDAO orderBookDAO = new OrderBookDAOImp();
                    List<OrderDTO> orderList = orderDAO.getOrderListByUserID(oldUser.getId());

                    Map<Integer, List<OrderBookDTO>> orderBooksMap = new HashMap<>();

                    for (OrderDTO orderMap : orderList) {
                        List<OrderBookDTO> orderBooks = orderBookDAO.getAll(orderMap.getOrderID());
                        orderBooksMap.put(orderMap.getOrderID(), orderBooks);
                    }

//                for (OrderDTO order : orderList) {
//                    orderBookList = orderBookDAO.getAll(order.getOrderID());
//                }
                    session.setAttribute("orderList", orderList);
                    session.setAttribute("orderBookList", orderBooksMap);

                    // Load from Database to Profile (Order History) | End
                    url = "./homepage";
                } else { //  Username is not equals to the google account's email
                    String errorMessage = "Username or Email already exists";
                    request.setAttribute("errorMessage", errorMessage);
                    url = "account.jsp";
                }
            } else {
                UserDTO user = new UserDTO();

                user.setUsername(Hash.SHA256(googleUser.getEmail()));
                user.setPasswordHashed(Hash.SHA256(generateRandomString(10)));
                user.setFirstName(googleUser.getFamily_name() != null ? googleUser.getFamily_name() : "");
                user.setLastName(googleUser.getGiven_name());
                user.setEmail(googleUser.getEmail());
                user.setAvatarPath(googleUser.getPicture());
                user.setRole("Customer");

                userDAO.register(user);
                user.setId((userDAO.getByEmail(googleUser.getEmail())).getId());
                HttpSession session = request.getSession();
                session.setAttribute("usersession", user);
                url = "./homepage";
            }
        } finally {
//            RequestDispatcher rd = request.getRequestDispatcher(url);
//            rd.forward(request, response);
            response.sendRedirect(url);
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
