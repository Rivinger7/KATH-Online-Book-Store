/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Admin.Controller;

import Admin.DAO.Implement.OrderDAOImp;
import Admin.DAO.Implement.UserDAOImp;
import Model.UserDTO;
import Utility.Hash;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author satori
 */
public class AccountEdit extends HttpServlet {

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

        UserDAOImp userDAO = new UserDAOImp();
        UserDTO user;
        OrderDAOImp orderDAO = new OrderDAOImp();
        boolean isDelete = false;
        String action = request.getParameter("action");
        if (action != null) {
            switch (action) {
                case "delete":
                    try {
                        int uid = Integer.parseInt(request.getParameter("uid"));
                        user = userDAO.getById(uid);
                        orderDAO.deleteOrderByUserID(uid);
                        userDAO.deleteUser(user);
                        isDelete = true;
                        break;
                    } catch (NumberFormatException ex) {
                        ex.printStackTrace();
                    }

                case "create":
                    user = new UserDTO();
                    request.setAttribute("user", user);
                    request.setAttribute("nextaction", "insert");
                    request.getRequestDispatcher("./accounteditforadmin.jsp").forward(request, response);
                    break;

                case "insert":
                    String firstname = request.getParameter("firstname");
                    String lastname = request.getParameter("lastname");
                    String username = request.getParameter("username");
                    String password = request.getParameter("password");
                    String passwordconfirm = request.getParameter("passwordconfirm");
                    String email = request.getParameter("email");
                    String role = request.getParameter("role");
                    if (!password.equals(passwordconfirm)) {
                        String registerErrorMessage = "Password Confirmed is not same your Password";
                        request.setAttribute("insertErrorMessage", registerErrorMessage);
                        request.getRequestDispatcher("accounteditforadmin.jsp").forward(request, response);
                        break;
                    }
                    if (username.equals("") || firstname.equals("") || lastname.equals("") || password.equals("") || passwordconfirm.equals("")) {
                        String registerErrorMessage = "Please fill all missing fields!";
                        request.setAttribute("insertErrorMessage", registerErrorMessage);
                        request.getRequestDispatcher("accounteditforadmin.jsp").forward(request, response);
                        break;
                    }
                    user = userDAO.getByUserName(username);
                    boolean isUsernameExist = username != null;
                    boolean isEmailExist = email != null;
                    if(!isUsernameExist){
                        String errorMessage = "Username already exists";
                        request.setAttribute("insertErrorMessage", errorMessage);
                        request.getRequestDispatcher("accounteditforadmin.jsp").forward(request, response);
                        break;
                    }
                    
                    else if(!isEmailExist){
                        String errorMessage = "Email already exists";
                        request.setAttribute("insertErrorMessage", errorMessage);
                        request.getRequestDispatcher("accounteditforadmin.jsp").forward(request, response);
                        break;
                    }
                    user = new UserDTO();
                    user.setUsername(username);
                    user.setPasswordHashed(Hash.SHA256(password));
                    user.setFirstName(firstname);
                    user.setLastName(lastname);
                    user.setEmail(email);
                    user.setRole(role);
                    userDAO.insertAdmin(user);
                    request.setAttribute("insertsuccess", "Insert Admin successfully!");
                    response.sendRedirect("/server/AccountController?admin=true");
                    break;
            }
            if (isDelete == true) {
                response.sendRedirect("./AdminHomepage");
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
        protected void doGet
        (HttpServletRequest request, HttpServletResponse response)
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
        protected void doPost
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            processRequest(request, response);
        }

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        @Override
        public String getServletInfo
        
            () {
        return "Short description";
        }// </editor-fold>

    }
