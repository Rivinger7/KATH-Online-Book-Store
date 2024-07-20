/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.BookDAO;
import DAO.Implement.BookDAOImp;
import DAO.Implement.ReviewDAOImp;
import DAO.ReviewDAO;
import Model.AuthorDTO;
import Model.BookDTO;
import Model.CategoryDTO;
import Model.PublisherDTO;
import Model.ReviewDTO;
import Model.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collections;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admins
 */
public class BookDetailController extends HttpServlet {

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
            String bookID = request.getParameter("bookID");
            String rating = request.getParameter("rating");
            String comment = request.getParameter("comment");
            String newBookID = request.getParameter("valueBookID");
            String postingComment = request.getParameter("action");

            if (bookID == null) {
                bookID = newBookID;
            }

            BookDAO bookDAO = new BookDAOImp();
            ReviewDAO reviewDAO = new ReviewDAOImp();
            HttpSession session = request.getSession();
            UserDTO user = (UserDTO) session.getAttribute("usersession");

            if (comment != null) {
                reviewDAO.insert(Integer.parseInt(bookID), user.getId(), comment, user.getAvatarPath(), user.getFirstName() + " " + user.getLastName());
                response.sendRedirect(request.getHeader("referer"));
                return;
            }

            if (rating != null) {
                bookDAO.updateRatingByBookID(Double.parseDouble(rating), Integer.parseInt(bookID));
                request.setAttribute("rating", Double.parseDouble(rating));
            }

            BookDTO book = bookDAO.getBookByID(Integer.parseInt(bookID));
            CategoryDTO category = bookDAO.getCategoryByBookID(Integer.parseInt(bookID));
            PublisherDTO publisher = bookDAO.getPublisherByBookID(Integer.parseInt(bookID));
            AuthorDTO author = bookDAO.getAuthorByBookID(Integer.parseInt(bookID));
//            List<BookDTO> bookList = bookDAO.getBookListByCategoryID(category.getCategoryID());
            List<BookDTO> relatedBookList = bookDAO.getRelatedBook(Integer.parseInt(bookID), category.getCategoryID());
            List<CategoryDTO> categoryList = bookDAO.getAllCategory();
            List<ReviewDTO> commentList = reviewDAO.getCommentListByBookID(Integer.parseInt(bookID));

            request.setAttribute("ratingBook", book.getRate());
            request.setAttribute("book", book);
            request.setAttribute("category", category);
            request.setAttribute("publisher", publisher);
            request.setAttribute("author", author);
            Collections.shuffle(relatedBookList);
            request.setAttribute("relatedBooks", relatedBookList);
            request.setAttribute("commentList", commentList);
            request.setAttribute("categoryList", categoryList);
            request.getRequestDispatcher("detailpage.jsp").forward(request, response);
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
