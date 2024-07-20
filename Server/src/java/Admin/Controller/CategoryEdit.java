/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Admin.Controller;

import Admin.DAO.BookDAO;
import Admin.DAO.CategoryDAO;
import Admin.DAO.Implement.BookDAOImp;
import Admin.DAO.Implement.CategoryDAOImp;
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
public class CategoryEdit extends HttpServlet {

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
        CategoryDAO categoryDAO = new CategoryDAOImp();
        String categoryName;

        if (action != null) {
            switch (action) {
                case "insert":
                    categoryName = request.getParameter("newcategoryname");
                    
                    if (categoryName == null || categoryName.isEmpty()) {
                        request.setAttribute("errorCategoryMessage", "Please fill Category name");
                        request.getRequestDispatcher("categoryforadmin.jsp").forward(request, response);
                        return;
                    }
                    List<CategoryDTO> categoryList = categoryDAO.getAllCategory();
                    for (CategoryDTO c : categoryList) {
                        if (c.getCategoryName().equalsIgnoreCase(categoryName)) {
                            request.setAttribute("errorCategoryMessage", "This category has been existed!");
                            request.getRequestDispatcher("categoryforadmin.jsp").forward(request, response);
                            return;
                        }
                    }

                    categoryDAO.insertCategory(categoryName);
                    HttpSession session = request.getSession(false);
                    session.setAttribute("categoryList", categoryList);
                    response.sendRedirect("./Category");
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
