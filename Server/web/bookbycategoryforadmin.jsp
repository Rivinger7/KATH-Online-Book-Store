<%-- 
    Document   : bookbycategoryforadmin
    Created on : Mar 16, 2024, 9:55:05 PM
    Author     : satori
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>KATH Order Admin</title>
        <!-- plugins:css -->
        <link rel="stylesheet" href="assets/vendors/mdi/css/materialdesignicons.min.css">
        <link rel="stylesheet" href="assets/vendors/css/vendor.bundle.base.css">
        <!-- endinject -->
        <!-- Plugin css for this page -->
        <!-- End plugin css for this page -->
        <!-- inject:css -->
        <!-- endinject -->
        <!-- Layout styles -->
        <link rel="stylesheet" href="assets/css/style.css">
        <!-- End layout styles -->
        <link rel="shortcut icon" href="assets/images/favicon.ico" />
    </head>
    <body>
        <div class="container-scroller">
            <%@ include file="./detailsforadminpage.jsp" %>
            <div class="main-panel">
                <div class="content-wrapper">
                    <div class="page-header">
                        <h3 class="page-title"> Order </h3>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="homepageforadmin.jsp">Homepage</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Order</li>
                            </ol>
                        </nav>
                    </div>
                    <div class="row">
                        <div class="grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body">
                                    <div class="text-end d-block">
                                    <form action='./BookController' method='get'>
                                        <div class='d-flex'>
                                        <input name='inputsearch' type="text" placeholder="Type here to search!" class='form-control '>
                                        <input name='categoryId' value='${categoryid}' type='hidden'>
                                        <input name='action' value='search' type='hidden'>
                                        <input type='submit' value='Search'class="btn btn-gradient-warning">
                                        </div>
                                    </form><br>
                                    
                                    <form action='./BookController' method='get'>
                                        <input name='action' value='insertbook' type='hidden'>
                                        <input type='submit' value='Add Book' class="btn btn-gradient-light">
                                    </form>
                                    </div>
                                    
                                        <c:if test="${BookMessage != null}" >
                                            <div style="color: red; text-align: center">
                                                <p>${BookMessage}</p>
                                            </div>
                                        </c:if>
                                    
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Book ID</th>
                                                <th>Book Title</th>
                                                <th>Quantity</th>
                                                <th>Rate</th>
                                                <th>Sold</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${sessionScope.bookList}" var="o">
                                                <tr>
                                                    <td>${o.bookID}</td>
                                                    <td>${o.bookTitle}</td>
                                                    <td>${o.quantity}</td>
                                                    <td>${o.rate}</td>
                                                    <td>${o.sold}</td>
                                                    <td>
                                                        <form action='./BookController' method='GET'>
                                                            <input name='bookid' value='${o.bookID}' type='hidden'>
                                                            <input name='action' value='editbook' type='hidden'>
                                                            <input type='submit' value='Edit' class='btn btn-gradient-primary'>
                                                        </form>
                                                    </td>
                                                    <td>
                                                        <form action='./BookController' method='GET'>
                                                            <input name='bookid' value='${o.bookID}' type='hidden'>
                                                            <input name='categoryid' value='${o.categoryID}' type='hidden'>
                                                            <input name='action' value='deleteBook' type='hidden'>
                                                            <input type='submit' value='Delete' class='btn btn-gradient-danger'>
                                                        </form>
                                                    </td>
                                                </tr>
                                                
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- content-wrapper ends -->
            </div>
            <!-- main-panel ends -->
        </div>
        <!-- page-body-wrapper ends -->
    </div>
    <!-- container-scroller -->
    <!-- plugins:js -->
    <script src="assets/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="assets/js/off-canvas.js"></script>
    <script src="assets/js/hoverable-collapse.js"></script>
    <script src="assets/js/misc.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page -->
    <!-- End custom js for this page -->
</body>
</html>

