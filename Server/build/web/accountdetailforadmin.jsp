<%-- 
    Document   : adminaccountedit
    Created on : Mar 12, 2024, 8:45:40 PM
    Author     : satori
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>KATH Account Management Admin</title>
        <!-- plugins:css -->
        <link rel="stylesheet" href="assets/vendors/mdi/css/materialdesignicons.min.css">
        <link rel="stylesheet" href="assets/vendors/css/vendor.bundle.base.css">
        <!-- endinject -->
        <!-- Plugin css for this page -->
        <!-- End Plugin css for this page -->
        <!-- inject:css -->
        <!-- endinject -->
        <!-- Layout styles -->
        <link rel="stylesheet" href="assets/css/style.css">
        <!-- End layout styles -->
        <link rel="shortcut icon" href="assets/images/favicon.ico" />
    </head>
    <body>
        <div class=" container-scroller">
            <%@ include file="./detailsforadminpage.jsp" %>
            <div class="main-panel">
                <div class="content-wrapper">
                    <div class="page-header">
                        <h3 class="page-title"> Account management </h3>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="homepageforadmin.jsp">Homepage</a></li>
                                <li class="breadcrumb-item"><a href="accountmanageforadmin.jsp">Account management</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Edit</li>
                            </ol>
                        </nav>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 grid-margin">
                            <div class="card">
                                <div class="card-body">
                                    <div class="row icons-list d-flex justify-content-around border-0">
                                        
                                        <c:if test="${insertsuccess != null}">
                                            <div style="color: red; display:contents;">
                                                ${insertsuccess}
                                            </div>
                                        </c:if>
                                        
                                        <table border="1" class="table table-bordered text-center">
                                            <tr class="table-dark">
                                                <th>ID</th> 
                                                <th>Username</th>
                                                <th>First Name</th>
                                                <th>Last Name</th>                                                         
                                                <th>Role</th>
                                                <th>Behavior</th>
                                            </tr>
                                            <c:forEach var="user" items="${userList}">
                                                <tr>
                                                    <td>${user.id}</td>
                                                    <td>${user.username}</td>
                                                    <td>${user.firstName}</td>
                                                    <td>${user.lastName}</td>
                                                    <td>${user.role}</td>
                                                    <c:if test="${user.username ne 'admin' and sessionScope.adminsession.username ne user.username}">
                                                    <td>
                                                        <form action="AccountEdit" method="GET">
                                                            <input name="action" value="delete" type="hidden">
                                                            <input name="uid" value="${user.id}" type="hidden">
                                                            <input type="submit" value="Delete" class="py-2 btn btn-gradient-primary">
                                                        </form>
                                                    </td>
                                                    </c:if>
                                                </tr>
                                            </c:forEach>
                                        </table>
                                    </div>
                                </div>
                                <c:if test="${param.admin=='true'}">
                                <form action="AccountEdit" method="POST" class="d-flex justify-content-center mb-2">
                                                            <input name="action" value="create" type="hidden">
                                                            <input type="submit" value="Create" class="py-2 btn btn-gradient-warning">
                                </form>
                                </c:if>
                            </div> 
                        </div>
                    </div>
                </div>
            </div>
        </div>
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
