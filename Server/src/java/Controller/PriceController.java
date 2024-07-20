/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.BookDAO;
import DAO.Implement.BookDAOImp;
import Model.BookDTO;
import Model.CategoryDTO;
import Model.PublisherDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admins
 */
public class PriceController extends HttpServlet {

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
            try {
                String bookPrice = request.getParameter("bookPrice");
                String page = request.getParameter("page");

                if (page == null) {
                    page = "1";
                }

                BookDAO bookDAO = new BookDAOImp();
                int total = bookDAO.countTotalBookByPrice(Double.parseDouble(bookPrice));
                int endPage = total / 9;
                if (total % 9 != 0) {
                    ++endPage;
                }
                List<BookDTO> bookList = bookDAO.pagingBookListByPrice(Integer.parseInt(page), Double.parseDouble(bookPrice));
                List<CategoryDTO> categoryList = bookDAO.getAllCategory();
                List<PublisherDTO> publisherList = bookDAO.getAllPublisher();

                request.setAttribute("endPage", endPage);
                request.setAttribute("bookList", bookList);
                request.setAttribute("categoryList", categoryList);
                request.setAttribute("publisherList", publisherList);
//                request.setAttribute("publisherName", publisherName);

                request.getRequestDispatcher("shop.jsp").forward(request, response);
            } catch (IOException | NumberFormatException | ServletException ex) {
                System.err.println(ex.getMessage());
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
