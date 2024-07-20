<%-- 
    Document   : ordereditforadmin
    Created on : Mar 16, 2024, 6:05:52 AM
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
                        <h3 class="page-title"> Order edit</h3>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="homepageforadmin.jsp">Homepage</a></li>
                                <li class="breadcrumb-item"><a href="orderforadmin.jsp">Order</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Order edit</li>
                            </ol>
                        </nav>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 grid-margin">
                            <div class="card">
                                <div class="card-body">
                                    <div class="row icons-list d-flex justify-content-around border-0">
                                        <c:if test="${insertErrorMessage != null}">
                                            <div style="color: red; display:contents;">
                                                ${insertErrorMessage}
                                            </div>
                                        </c:if>
                                        <form action="OrderEdit" method="POST" style="border: 1; margin: auto;" class="form-inline mx-auto">
                                            <div class="mx-auto">
                                            <span>ID: </span><input name="id" value="${order.orderID}" readonly style="border: none; outline: none;"><br>
                                            <span>Created Date: </span><input name="date" value="${order.date}" readonly style="border: none; outline: none;"><br>
                                            <span>User ID: </span><input name="userid" value="${order.userID}" readonly style="border: none; outline: none;"><br>
                                            <span>Quantity: </span><input name="unitquantity" value="${order.unitQuantity}" readonly style="border: none; outline: none;"><br>
                                            <span>Payment: </span><input name="payment" value="${order.payment}" readonly style="border: none; outline: none;"><br>
                                            <span>Address: </span><input name="shippingaddress" value="${order.shippingAddress}" readonly style="border: none; outline: none;"><br>
                                            <span>Total Price: </span><input name="totalprice" value="${order.totalPrice}" readonly style="border: none; outline: none;"><br>
                                            <span>Status: </span><select name="status" class="py-2 btn btn-gradient-light"> <option value="Pending">Pending</option> <option value="Rejected">Rejected</option> <option value="Accepted">Accepted</option> <option value="Shipping">Shipping</option></select><br>
                                            <input name="action" value="changestatus" type="hidden"><br>
                                            </div>
                                            <input type="submit" value="Change" class="py-2 btn btn-gradient-success">
                                        </form>
                                    </div>
                                </div>
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