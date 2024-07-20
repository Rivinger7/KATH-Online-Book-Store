/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Admin.Controller;

import Admin.DAO.BookDAO;
import Admin.DAO.Implement.BookDAOImp;
import Admin.Model.BookDTO;
import Admin.Model.CategoryDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author satori
 */
public class BookController extends HttpServlet {

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

        String action = request.getParameter("action");
        String bookIdString = request.getParameter("bookid");
        CategoryDTO category = null;
        Integer bookId = null;
        BookDAO bookDAO = new BookDAOImp();
        Integer bookid = null;
        BookDTO book = new BookDTO();

        String categoryRedirect = request.getParameter("categoryid");
        if (categoryRedirect != null) {
            Integer categoryId = null;
            try {
                categoryId = Integer.parseInt(categoryRedirect);
            } catch (NumberFormatException ex) {
                System.out.println("Cannot convert id to number!");
                ex.printStackTrace();
            }
            List<BookDTO> bookList = bookDAO.getBookByCategory(categoryId);
            HttpSession session = request.getSession(false);
            session.setAttribute("bookList", bookList);
            request.getRequestDispatcher("bookbycategoryforadmin.jsp").forward(request, response);
        }

        if (action != null) {
            HttpSession session = request.getSession(false);
            switch (action) {
                case "search":
                    String inputsearch = request.getParameter("inputsearch");
                    List<BookDTO> bookList = bookDAO.searchBook(inputsearch);
                    session.setAttribute("bookList", bookList);
                    response.sendRedirect("bookbycategoryforadmin.jsp");

                    break;

                case "deleteBook":
                    try {
                        bookid = Integer.parseInt(request.getParameter("bookid"));
                        bookDAO.deleteBook(bookid);
                        request.setAttribute("BookMessage", "Delete successfully!");
                        session.setAttribute("bookList", bookDAO.getBookByCategory(Integer.parseInt(request.getParameter("categoryiddelete"))));
                        request.getRequestDispatcher("bookbycategoryforadmin.jsp").forward(request, response);
                        
                    } catch (NumberFormatException ex) {
                        System.out.println("Cannot convert id to number!");
                        ex.printStackTrace();
                    }
                    break;
                    
                case "editbook":
                    try{
                        bookid = Integer.parseInt(request.getParameter("bookid"));
                    }catch(NumberFormatException ex){
                        System.out.println("Cannot convert id to number!");
                        ex.printStackTrace();
                    }
                    book = bookDAO.getBookByID(bookid);
                    request.setAttribute("book", book);
                    request.setAttribute("nextaction", "updateBook");
                    request.getRequestDispatcher("./bookeditforadmin.jsp").forward(request, response);
                    break;
                    
                case "insertbook":
                    book = new BookDTO();
                    request.setAttribute("bookinsert", book);
                    request.setAttribute("nextaction", "insert");
                    request.getRequestDispatcher("./bookeditforadmin.jsp").forward(request, response);
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