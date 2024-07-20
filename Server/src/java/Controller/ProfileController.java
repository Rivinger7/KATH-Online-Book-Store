package Controller;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import DAO.Implement.OrderBookDAOImp;
import DAO.Implement.OrderDAOImp;
import DAO.Implement.UserDAOImp;
import DAO.OrderBookDAO;
import DAO.OrderDAO;
import DAO.UserDAO;
import Model.OrderBookDTO;
import Model.OrderDTO;
import Model.UserDTO;
import Utility.Hash;
import Utility.MyTools;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Admins
 */
@MultipartConfig(maxFileSize = 1024 * 1024 * 3, maxRequestSize = 1024 * 1024 * 10)
public class ProfileController extends HttpServlet {

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
//        request.setCharacterEncoding("UTF-8");



        String url = null;
        boolean isDeleted = false;
        final String UPLOAD_AVATAR_DIRECTORY_WEB = "G:\\prj301\\kath\\Server\\web\\images\\user_image";
        final String UPLOAD_AVATAR_DIRECTORY = "images/user_image";

        try {
            HttpSession session = request.getSession();
            UserDTO user = (UserDTO) session.getAttribute("usersession");
            
            if(user == null) {
                response.sendRedirect("./homepage");
                return;
            }
            
            UserDAO userDAO = new UserDAOImp();

            // This is so f**** amazing, it makes me f*** love learning algorithm
            // Load from Database to Profile (Order History) | Start
            OrderDAO orderDAO = new OrderDAOImp();
            OrderBookDAO orderBookDAO = new OrderBookDAOImp();
            List<OrderDTO> orderList = orderDAO.getOrderListByUserID(user.getId());

            Map<Integer, List<OrderBookDTO>> orderBooksMap = new HashMap<>();

            for (OrderDTO orderMap : orderList) {
                List<OrderBookDTO> orderBooks = orderBookDAO.getAll(orderMap.getOrderID());
                orderBooksMap.put(orderMap.getOrderID(), orderBooks);
            }

//                for (OrderDTO order : orderList) {
//                    orderBookList = orderBookDAO.getAll(order.getOrderID());
//                }
            session.setAttribute("orderList", orderList);
            session.setAttribute("orderBookList", orderBooksMap);

            // Load from Database to Profile (Order History) | End
            session.setMaxInactiveInterval(60 * 60 * 12);

            String action = request.getParameter("action");
            if (action != null) {
                switch (action) {
                    case "updateProfile":
                        // Update Contact Detail
                        String firstName = request.getParameter("firstName");
                        String lastName = request.getParameter("lastName");
                        String phoneNumber = request.getParameter("phoneNumber");
                        System.out.println(phoneNumber + " at ProfileController");
                        String email = request.getParameter("email");
                        Date birthday = MyTools.parseDate(request.
                                getParameter("birthday"), "yyyy-MM-dd");
                        System.out.println("Birthday at ProfileController: " + MyTools.toString(birthday, "yyyy-MM-dd"));
                        System.out.println(birthday);
                        String gender = request.getParameter("gender");

                        user.setFirstName(firstName);
                        user.setLastName(lastName);
                        if (phoneNumber == null) {
                            user.setPhoneNumber(null);
                        } else {
                            user.setPhoneNumber(phoneNumber);
                        }
                        user.setEmail(email);
                        user.setBirthday(birthday);
                        if (gender.equals("Unknown")) {
                            user.setGender(null);
                        } else {
                            user.setGender(gender);
                        }

                        userDAO.updateProfile(user);
                        session.setAttribute("usersession", user);
                        break;

                    case "uploadAvatar":
                        // Upload image file
                        Part part = request.getPart("avatar");
                        if (part != null && part.getSize() > 0) {
                            String realPath = request.getServletContext().getRealPath(UPLOAD_AVATAR_DIRECTORY);
                            String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();

                            if (!Files.exists(Paths.get(realPath))) {
                                Files.createDirectory(Paths.get(realPath));
                            }
                            part.write(realPath + "/" + fileName);

                            user.setAvatarPath(UPLOAD_AVATAR_DIRECTORY + "/" + fileName);
                            session.setAttribute("usersession", user);
                            userDAO.uploadImage(user);
                        }
                        break;

                    case "deleteAccount":
                        userDAO.deleteUser(user);
                        session.removeAttribute("usersession");
                        isDeleted = true;
                        System.out.println("User is deleted!");
                        break;

                    case "changePassword":
                        String oldPassword = request.getParameter("oldPassword");
                        String newPassword = request.getParameter("newPassword");
                        String passwordConfirmed = request.getParameter("passwordConfirmed");

                        if (!Hash.SHA256(oldPassword).equals(user.getPasswordHashed())) {
                            String errorMessage = "Password is incorrect";
                            request.setAttribute("errorProfileMessage", errorMessage);
                            url = "profile.jsp";
                            RequestDispatcher rd = request.getRequestDispatcher(url);
                            rd.forward(request, response);
                            return;
                        }
                        if (Hash.SHA256(newPassword).equals(Hash.SHA256(oldPassword))) {
                            String errorMessage = "New password must be different from the old password";
                            request.setAttribute("errorProfileMessage", errorMessage);
                            url = "profile.jsp";
                            RequestDispatcher rd = request.getRequestDispatcher(url);
                            rd.forward(request, response);
                            return;
                        }
                        if (!newPassword.equals(passwordConfirmed)) {
                            String errorMessage = "Password Confirmed is not same your Password";
                            request.setAttribute("errorProfileMessage", errorMessage);
                            url = "profile.jsp";
                            RequestDispatcher rd = request.getRequestDispatcher(url);
                            rd.forward(request, response);
                            return;
                        }

                        System.out.println(passwordConfirmed + " " + newPassword
                                + " at ProfileController");
                        user.setPasswordHashed(Hash.SHA256(newPassword));
                        userDAO.changePassword(user);
                        session.setAttribute("usersession", user);
                        String successfulMessage = "Password was successfully changed ";
                        request.setAttribute("successfulMessage", successfulMessage);
                        url = "profile.jsp";
                        RequestDispatcher rd = request.getRequestDispatcher(url);
                        rd.forward(request, response);
                        return;
                    case "updateShippingAddress":
                        String address = request.getParameter("address");
                        String city = request.getParameter("city");
                        String district = request.getParameter("district");
                        String ward = request.getParameter("ward");

//                        System.out.println(district);
//                        System.out.println("Gò Vấp");
                        if (address.isEmpty()) {
                            address = null;
                        }
                        if (city.isEmpty()) {
                            city = null;
                        }
                        if (district.isEmpty()) {
                            district = null;
                        }
                        if (ward.isEmpty()) {
                            ward = null;
                        }
                        user.setAddress(address);
                        user.setCity(city);
                        user.setDistrict(district);
                        user.setWard(ward);

                        userDAO.updateShippingAddress(user);
//                        System.out.println("user: \n" + user);
                        session.setAttribute("usersession", user);
                }
            }

            if (!isDeleted) {
                url = "profile.jsp";
//                request.getRequestDispatcher(url).forward(request, response);
                response.sendRedirect(url);
//                response.sendRedirect(request.getHeader("referer"));
            } else {
                url = "./homepage";
                response.sendRedirect(url);
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
