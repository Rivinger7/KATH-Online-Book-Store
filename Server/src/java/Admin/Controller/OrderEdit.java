/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Admin.Controller;

import Admin.DAO.Implement.OrderDAOImp;
import Admin.DAO.OrderDAO;
import Admin.Model.OrderDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author satori
 */
public class OrderEdit extends HttpServlet {

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

        String action = request.getParameter("action");

        Integer id = null;
        OrderDAO orderDAO = new OrderDAOImp();
        OrderDTO order = null;

        if (action != null) {
            switch (action) {
                case "detail":
                    try {
                        id = Integer.parseInt(request.getParameter("id"));
                    } catch (NumberFormatException ex) {
                        log("This Order ID can not convert to number");
                    }
                    order = orderDAO.getOrderByOrderID(id);
                    request.setAttribute("order", order);
                    request.getRequestDispatcher("ordereditforadmin.jsp").forward(request, response);
                    break;

                case "changestatus":
                    try {
                        id = Integer.parseInt(request.getParameter("id"));
                    } catch (NumberFormatException ex) {
                        log("This Order ID can not convert to number");
                    }
                    String status = request.getParameter("status");
                    orderDAO.changeStatusOrder(id, status);
                    request.getRequestDispatcher("./Order").forward(request, response);

                    break;
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
