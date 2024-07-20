/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.Implement.UserDAOImp;
import DAO.UserDAO;
import Model.UserDTO;
import Utility.Hash;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admins
 */
public class RegisterController extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String passwordConfirmed = request.getParameter("passwordConfirmed");

            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("email");
            String phoneNumber = request.getParameter("phoneNumber");

            if (!password.equals(passwordConfirmed)) {
                String errorMessage = "Password Confirmed is not same your Password";
                request.setAttribute("errorMessage", errorMessage);
                String registerErrorMessage = "Password Confirmed is not same your Password";
                request.setAttribute("registerErrorMessage", registerErrorMessage);
                url = "account.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else {
                UserDAO userDAO = new UserDAOImp();
                UserDTO userEmail = userDAO.getByEmail(email);
                boolean isUserEmailExisted = userEmail != null;

                if (!isUserEmailExisted) {
                    UserDTO user = new UserDTO();

                    
                    user.setUsername(username);
                    user.setPasswordHashed(Hash.SHA256(password));
                    user.setFirstName(firstName);
                    user.setLastName(lastName);
                    user.setEmail(email);
                    user.setPhoneNumber(phoneNumber);
                    user.setRole("Customer");

                    userDAO.register(user);
                    user.setId((userDAO.getByEmail(email)).getId());
                    HttpSession session = request.getSession();
                    session.setAttribute("usersession", user);
                    url = "./homepage";
                    response.sendRedirect(url);
                } else {
                    String errorMessage = "Username or Email already exists";
                    request.setAttribute("errorMessage", errorMessage);
                    String registerErrorMessage = "Username or Email already exists";
                    request.setAttribute("registerErrorMessage", registerErrorMessage);

                    request.setAttribute("username", username);
                    request.setAttribute("email", email);
                    request.setAttribute("firstName", firstName);
                    request.setAttribute("lastName", lastName);
                    request.setAttribute("phoneNumber", phoneNumber);

                    url = "account.jsp";
                    RequestDispatcher rd = request.getRequestDispatcher(url);
                    rd.forward(request, response);
                }
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
