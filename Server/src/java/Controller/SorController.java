/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admins
 */
public class SorController extends HttpServlet {

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
            String currentURI = request.getRequestURI();
            String contextPath = request.getContextPath();

            if (currentURI.equals(contextPath + "/shop")) {
                
            } else if (currentURI.equals(contextPath + "/category?categoryName=Science&categoryID=1")) {

            } else if (currentURI.equals(contextPath + "/category?categoryName=Mystery&categoryID=2")) {

            } else if (currentURI.equals(contextPath + "/category?categoryName=Light%20Novel&categoryID=3")) {

            } else if (currentURI.equals(contextPath + "/category?categoryName=Romance&categoryID=4")) {

            } else if (currentURI.equals(contextPath + "/category?categoryName=Fantasy&categoryID=5")) {

            } else if (currentURI.equals(contextPath + "/price?bookPrice=6")) {

            } else if (currentURI.equals(contextPath + "/price?bookPrice=7")) {

            } else if (currentURI.equals(contextPath + "/price?bookPrice=13")) {

            } else if (currentURI.equals(contextPath + "/price?bookPrice=21")) {

            } else if (currentURI.equals(contextPath + "/publisher?publisherName=Alpha%20Books&publisherID=1")) {

            } else if (currentURI.equals(contextPath + "/publisher?publisherName=Mega%20World&publisherID=2")) {

            } else if (currentURI.equals(contextPath + "/publisher?publisherName=IPM&publisherID=3")) {

            } else if (currentURI.equals(contextPath + "/publisher?publisherName=Sakura%20Light%20Novel&publisherID=4")) {

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
