/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Admin.Controller;

import Admin.DAO.BookDAO;
import Admin.DAO.Implement.BookDAOImp;
import Admin.Model.BookDTO;
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
public class BookEdit extends HttpServlet {

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
        
        String title = request.getParameter("title");
        float price = Float.parseFloat(request.getParameter("price"));
        int year = Integer.parseInt(request.getParameter("year"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String description = request.getParameter("description");
        int cateID = Integer.parseInt(request.getParameter("cateID"));
        int auhID = Integer.parseInt(request.getParameter("auhID"));
        int publID = Integer.parseInt(request.getParameter("publID"));
        float rate = Float.parseFloat(request.getParameter("rate"));
        int ratecount = Integer.parseInt(request.getParameter("ratecount"));
        int sold = Integer.parseInt(request.getParameter("sold"));
        String image = request.getParameter("image");

        String action = request.getParameter("action");
        if (action != null && action.equals("updateBook")) {
            int bookId = Integer.parseInt(request.getParameter("id"));
            BookDAO bookDAO = new BookDAOImp();
            bookDAO.updateBook(bookId, price, title, year, quantity, description);
            response.sendRedirect("bookbycategoryforadmin.jsp");
        } else if (action != null && action.equals("insert")) {
            BookDTO book = new BookDTO();
            book.setBookTitle(title);
            book.setBookPrice(price);
            book.setYearPublic(year);
            book.setAuthorID(auhID);
            book.setDescription(description);
            book.setRate(rate);
            book.setRateCount(ratecount);
            book.setSold(sold);
            book.setImage(image);
            book.setPublisherID(publID);
            book.setCategoryID(cateID);
            BookDAO bookDAO = new BookDAOImp();
            bookDAO.insertBookToCategory(book);
            response.sendRedirect("bookbycategoryforadmin.jsp");
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
