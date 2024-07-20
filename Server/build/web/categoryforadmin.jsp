<%-- 
    Document   : categoryforadmin
    Created on : Mar 16, 2024, 12:23:56 PM
    Author     : satori
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
                        <h3 class="page-title"> Category </h3>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="homepageforadmin.jsp">Homepage</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Category</li>
                            </ol>
                        </nav>
                    </div>
                    
                    <c:if test="${errorCategoryMessage != null}">
                        <div style="color:red;">
                            ${errorCategoryMessage}
                        </div>
                    </c:if>
                    
<!--                    <form action="./CategoryEdit" method="POST" class="text-center">
                        <input name="newcategoryname" type="text" class="form-control bg-white border-0 d-flex" class="form-control"><br>
                        <input name="action" value="insert" type="hidden">
                        <input type="submit" value="Add" class="card-body btn btn-gradient-secondary text-center">
                    </form><br>-->
                        
                    <div class="row">
                        <c:forEach items="${sessionScope.categoryList}" var="o">
                            <div class="col-lg-4 grid-margin stretch-card">
                                <div class="card ">
                                    <a class="card-body btn btn-gradient-info" href='./BookController?categoryid=${o.categoryID}'>
                                        ${o.categoryName}
                                    </a>
                                </div>
                            </div>
                        </c:forEach>
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
