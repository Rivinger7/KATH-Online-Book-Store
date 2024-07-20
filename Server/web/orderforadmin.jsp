<%-- 
    Document   : orderAdmin
    Created on : Mar 11, 2024, 11:26:54 AM
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
                        <div class="col-lg-6 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body">

                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Order ID</th>
                                                <th>Created Date</th>
                                                <th>Status</th>
                                                <th>Behavior</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${sessionScope.orderPendingList}" var="o">
                                                <tr>
                                                    <td>${o.orderID}</td>
                                                    <td>${o.date}</td>
                                                    <td><label class="badge badge-danger">${o.status}</label></td>
                                                    <td>
                                                        <form action="./OrderEdit" method="POST">
                                                            <input name="id" value="${o.orderID}" type="hidden">
                                                            <input name = "action" value = "detail" type = "hidden">
                                                            <input type="submit" value="Detail" class="py-2 btn btn-gradient-primary">
                                                        </form>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>


                                </div>
                            </div>
                        </div>
                        
                        <div class="col-lg-6 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body">

                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Order ID</th>
                                                <th>Created Date</th>
                                                <th>Status</th>
                                                <th>Behavior</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${sessionScope.orderShippingList}" var="o">
                                                <tr>
                                                    <td>${o.orderID}</td>
                                                    <td>${o.date}</td>
                                                    <td><label class="badge badge-warning">${o.status}</label></td>
                                                    <td>
                                                        <form action="./OrderEdit" method="POST">
                                                            <input name="id" value="${o.orderID}" type="hidden">
                                                            <input name = "action" value = "detail" type = "hidden">
                                                            <input type="submit" value="Detail" class="py-2 btn btn-gradient-primary">
                                                        </form>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>


                                </div>
                            </div>
                        </div>
                        
                        <div class="col-lg-6 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body">

                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Order ID</th>
                                                <th>Created Date</th>
                                                <th>Status</th>
                                                <th>Behavior</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${sessionScope.orderAcceptedList}" var="o">
                                                <tr>
                                                    <td>${o.orderID}</td>
                                                    <td>${o.date}</td>
                                                    <td><label class="badge badge-success">${o.status}</label></td>
                                                    <td>
                                                        <form action="./OrderEdit" method="POST">
                                                            <input name="id" value="${o.orderID}" type="hidden">
                                                            <input name = "action" value = "detail" type = "hidden">
                                                            <input type="submit" value="Detail" class="py-2 btn btn-gradient-primary">
                                                        </form>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>


                                </div>
                            </div>
                        </div>
                        
                        <div class="col-lg-6 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body">

                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Order ID</th>
                                                <th>Created Date</th>
                                                <th>Status</th>
                                                <th>Behavior</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${sessionScope.orderRejectedList}" var="o">
                                                <tr>
                                                    <td>${o.orderID}</td>
                                                    <td>${o.date}</td>
                                                    <td><label class="badge badge-secondary">${o.status}</label></td>
                                                    <td>
                                                        <form action="./OrderEdit" method="POST">
                                                            <input name="id" value="${o.orderID}" type="hidden">
                                                            <input name = "action" value = "detail" type = "hidden">
                                                            <input type="submit" value="Detail" class="py-2 btn btn-gradient-primary">
                                                        </form>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>


                                </div>
                            </div>
                        </div>
                        
<!--                        <div class="col-lg-12 stretch-card">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Top buyers</h4>
                                    <table class="table table-bordered text-center">
                                        <thead>
                                            <tr class="table-warning">
                                                <th> # No.</th>
                                                <th> User name </th>
                                                <th> Amount </th>
                                                <th> Total </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td> 1 </td>
                                                <td> Herman Beck </td>
                                                <td> 12 </td>
                                                <td> 35 $ </td>
                                            </tr>
                                            <tr>
                                                <td> 2 </td>
                                                <td> Messsy Adam </td>
                                                <td> 32 </td>
                                                <td> 20 $ </td>
                                            </tr>
                                            <tr>
                                                <td> 3 </td>
                                                <td> John Richards </td>
                                                <td> 45 </td>
                                                <td> 19 $ </td>
                                            </tr>
                                            <tr>
                                                <td> 4 </td>
                                                <td> Peter Meggik </td>
                                                <td> 12 </td>
                                                <td> 10 $ </td>
                                            </tr>
                                            <tr>
                                                <td> 5 </td>
                                                <td> Edward </td>
                                                <td> 15 </td>
                                                <td> 3 $ </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>-->

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
