/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.BookDAO;
import DAO.Implement.BookDAOImp;
import DAO.Implement.OrderBookDAOImp;
import DAO.Implement.OrderDAOImp;
import DAO.OrderBookDAO;
import DAO.OrderDAO;
import Model.BookDTO;
import Model.CategoryDTO;
import Model.OrderBookDTO;
import Model.OrderDTO;
import Model.UserDTO;
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
public class HomepageController extends HttpServlet {

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

        String science = "Science";
        String mystery = "Mystery";
        String lightNovel = "Light Novel";
        String romance = "Romance";
        String fantasy = "Fantasy";
        try {
            /* TODO output your page here. You may use following sample code. */
            HttpSession session = request.getSession();
            UserDTO user = (UserDTO) session.getAttribute("usersession");
//            Cookie cookieArray[] = request.getCookies();
//
//            if (cookieArray != null) {
//                for (Cookie cookie : cookieArray) {
//                    if (cookie.getName().equals("usernameCookie")) {
//                        session.setAttribute("usernameCookie", cookie.getValue());
////                        System.out.println(cookie.getValue());
//                    }
//                    if (cookie.getName().equals("passwordCookie")) {
//                        session.setAttribute("passwordCookie", cookie.getValue());
////                        System.out.println(cookie.getValue());
//                    }
//                }
//            }

            BookDAO bookDAO = new BookDAOImp();
            List<BookDTO> bookList = bookDAO.getAllBook();
            List<CategoryDTO> categoryList = bookDAO.getAllCategory();
            
            List<BookDTO> bestSellerScienceList = bookDAO.getBestSeller(science);
            List<BookDTO> bestSellerMysteryList = bookDAO.getBestSeller(mystery);
            List<BookDTO> bestSellerLightNovelList = bookDAO.getBestSeller(lightNovel);
            List<BookDTO> bestSellerRomanceList = bookDAO.getBestSeller(romance);
            List<BookDTO> bestSellerFantasyList = bookDAO.getBestSeller(fantasy);
            
            List<BookDTO> newBookScienceList = bookDAO.getNewBook(science);
            List<BookDTO> newBookMysteryList = bookDAO.getNewBook(mystery);
            List<BookDTO> newBookLightNovelList = bookDAO.getNewBook(lightNovel);
            List<BookDTO> newBookRomanceList = bookDAO.getNewBook(romance);
            List<BookDTO> newBookFantasyList = bookDAO.getNewBook(fantasy);
            
            request.setAttribute("categoryList", categoryList);
            request.setAttribute("bookList", bookList);
            request.setAttribute("bestSellerScienceList", bestSellerScienceList);
            request.setAttribute("bestSellerMysteryList", bestSellerMysteryList);
            request.setAttribute("bestSellerLightNovelList", bestSellerLightNovelList);
            request.setAttribute("bestSellerRomanceList", bestSellerRomanceList);
            request.setAttribute("bestSellerFantasyList", bestSellerFantasyList);
            request.setAttribute("newBookScienceList", newBookScienceList);
            request.setAttribute("newBookMysteryList", newBookMysteryList);
            request.setAttribute("newBookLightNovelList", newBookLightNovelList);
            request.setAttribute("newBookRomanceList", newBookRomanceList);
            request.setAttribute("newBookFantasyList", newBookFantasyList);

            if (user != null) {
                switch (user.getRole()) {
                    case "Customer":
                        String redirectUrl = "./profile";
                        session.setAttribute("redirectUrl", redirectUrl);
                        break;
                    case "Admin":
                        break;
                }
            } else {
                String redirectUrl = "account.jsp";
                session.setAttribute("redirectUrl", redirectUrl);
            }
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher("homepage.jsp");
            rd.forward(request, response);
//            response.sendRedirect("homepage.jsp");
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
