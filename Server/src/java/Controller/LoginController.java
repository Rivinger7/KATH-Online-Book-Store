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
import Model.OrderBookDTO;
import Model.OrderDTO;
import Model.UserDTO;
import Utility.Hash;
import java.io.IOException;
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

/**
 *
 * @author Admins
 */
public class LoginController extends HttpServlet {

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

        String url = null;
        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String rememberMe = request.getParameter("rememberMe");
//            System.out.println("remember me: " + rememberMe);

            HttpSession session = request.getSession();
            HttpSession sesessionRememberMe = request.getSession();

            UserDAO userDAO = new UserDAOImp();
            UserDTO user = userDAO.login(username);

            if (user != null && user.getPasswordHashed().equals(Hash.SHA256(password))) {
//                Cookie usernameCookie = new Cookie("usernameCookie", username);
//                Cookie passwordCookie = new Cookie("passwordCookie", password);
//                usernameCookie.setMaxAge(60 * 60 * 24 * 365);

                if (rememberMe != null) {
//                    passwordCookie.setMaxAge(60 * 60 * 24 * 365);
                    sesessionRememberMe.setAttribute("usernameRememberMe", username);
//                    System.out.println(sesessionRememberMe.getAttribute("usernameRememberMe"));
                    sesessionRememberMe.setAttribute("passwordRememberMe", password);
                    sesessionRememberMe.setMaxInactiveInterval(60 * 60 * 24 * 31);

                } else {
                    sesessionRememberMe.removeAttribute("usernameRememberMe");
//                    System.out.println(sesessionRememberMe.getAttribute("usernameRememberMe"));
                    sesessionRememberMe.removeAttribute("passwordRememberMe");
//                    session.removeAttribute("usernameCookie");
//                    session.removeAttribute("passwordCookie");
//                    passwordCookie.setMaxAge(0);
                }
//                response.addCookie(usernameCookie);
//                response.addCookie(passwordCookie);

                session.setAttribute("usersession", user);
                session.setAttribute("isGoogleUser", false);

                if (user.getRole().equals("Customer")) {
                    session.setAttribute("usersession", user);
                    session.setMaxInactiveInterval(60 * 10);
                } else if (user.getRole().equals("Admin")) {
                    session.setAttribute("adminsession", user);
                    session.setMaxInactiveInterval(60 * 5);
                }

//                // This is so f**** amazing, it makes me f*** love learning algorithm
//                // Load from Database to Profile (Order History) | Start
//                OrderDAO orderDAO = new OrderDAOImp();
//                OrderBookDAO orderBookDAO = new OrderBookDAOImp();
//                List<OrderDTO> orderList = orderDAO.getOrderListByUserID(user.getId());
//
//                Map<Integer, List<OrderBookDTO>> orderBooksMap = new HashMap<>();
//
//                for (OrderDTO orderMap : orderList) {
//                    List<OrderBookDTO> orderBooks = orderBookDAO.getAll(orderMap.getOrderID());
//                    orderBooksMap.put(orderMap.getOrderID(), orderBooks);
//                }
//
////                for (OrderDTO order : orderList) {
////                    orderBookList = orderBookDAO.getAll(order.getOrderID());
////                }
//                session.setAttribute("orderList", orderList);
//                session.setAttribute("orderBookList", orderBooksMap);
//
//                // Load from Database to Profile (Order History) | End
                session.setMaxInactiveInterval(60 * 60 * 12);

                if (user.getRole().equals("Customer")) {
                    url = "./homepage";
                } else {
                    url = "./AdminHomepage";
                }

                response.sendRedirect(url);
            } else {
                String errorMessage = "Username or password is incorrect";
                request.setAttribute("errorMessage", errorMessage);
                String loginErrorMessage = "Username or password is incorrect";
                request.setAttribute("loginErrorMessage", loginErrorMessage);
                url = "account.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            }
        } finally {
//            RequestDispatcher rd = request.getRequestDispatcher(url);
//            rd.forward(request, response);
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
