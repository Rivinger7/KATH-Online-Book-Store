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
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
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
public class NewPasswordController extends HttpServlet {

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
            UserDAO userDAO = new UserDAOImp();

            String newPassword = request.getParameter("newPassword");
            String passwordConfirmed = request.getParameter("passwordConfirmed");
            String email = (String) session.getAttribute("email");
//            System.out.println("email: " + email);
//            System.out.println("new password: " + newPassword);

            RequestDispatcher rd = null;
            if (newPassword.equals(passwordConfirmed)) {

                boolean isReseted = userDAO.resetPassword(email, Hash.SHA256(newPassword));
//                System.out.println("check: " + isReseted);
                if (isReseted) {
                    request.setAttribute("status", "Password reset successfully");
                    rd = request.getRequestDispatcher("account.jsp");
//                    System.out.println("succesfully");
                } else {
                    request.setAttribute("status", "Password reset failed");
                    rd = request.getRequestDispatcher("account.jsp");
//                    System.out.println("failed");
                }
                rd.forward(request, response);
            } else {
                request.setAttribute("status", "Password reset failed: Password Confirmed is not same your new Password");
                rd = request.getRequestDispatcher("account.jsp");
                rd.forward(request, response);
            }
        } catch (IOException | ServletException ex) {
            System.err.println(ex.getMessage());
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
