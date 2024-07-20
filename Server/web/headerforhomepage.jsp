<%-- 
    Document   : navheader
    Created on : Mar 10, 2024, 3:02:43 PM
    Author     : Admins
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <!-- Icon Font Stylesheet -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <!-- <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet"> -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Stylesheet for HTML -->
        <link rel="stylesheet" href="css/homepage.css" />

        <!-- Customized Bootstrap Stylesheet -->
        <link rel="stylesheet" href="css/bootstrap.min.css" />
        <link rel="icon" href="images/header_image/logo.jpg" type="images/icon">


    </head>
    <div class="container-fluid fixed-top bg-white pb-4">
        <div class="container px-0">
            <nav class="navbar navbar-light bg-white navbar-expand-xl">
                <a href="./homepage" class="navbar-brand w-30 col-md-2"><img src="images/header_image/KATH_label.png"
                                                                             alt=""></a>
                <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarCollapse">
                    <span class="fa fa-bars text-primary"></span>
                </button>
                <div class="collapse navbar-collapse bg-white col-md-10 d-flex" id="navbarCollapse">
                    <div class="navbar-nav mx-auto col-md-7 w-50 justify-content-space-between">
                        <a href="homepage.jsp" class="nav-item nav-link">Home</a>
                        <a href="#" class="nav-item nav-link">About</a>
                        <div class="nav-item dropdown">
                            <a href="./shop" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Book
                                Categories</a>
                            <div class="dropdown-menu m-0 bg-secondary rounded-0">
                                <a href="shop.jsp" class="dropdown-item">Manga</a>
                                <a href="shop.jsp" class="dropdown-item">Child</a>
                                <a href="shop.jsp" class="dropdown-item">Novel</a>
                                <a href="shop.jsp" class="dropdown-item">History</a>
                                <a href="shop.jsp" class="dropdown-item">Textbook</a>
                                <a href="shop.jsp" class="dropdown-item">Daily</a>
                            </div>
                        </div>
                        <a href="detailpage.html" class="nav-item nav-link">Detail</a>
                        <a href="#" class="nav-item nav-link">Feedback</a>
                        <a href="contact.html" class="nav-item nav-link">Contact</a>
                    </div>
                    <div class="d-flex m-3 me-0 col-md-3 js-signin-modal-trigger">
                        <a class="my-auto mx-auto" href="shoppingcart.html">
                            <i class="fas fa-shopping-cart fa-2x"></i>
                        </a>
                        <a class="my-auto mx-auto text-center" href="${redirectUrl}">
                            <i class="fas fa-user fa-2x"></i>
                            <c:if test="${sessionScope.usersession != null}">
                                <div class="font-weight-bold mb-negative-1">
                                    ${sessionScope.usersession.firstName} ${sessionScope.usersession.lastName} ${sessionScope.usersession.id}
                                </div>
                            </c:if>
                        </a>
                        <c:if test="${sessionScope.usersession != null}">
                            <a class="my-auto mx-auto" href="./logout">
                                <i class="fas fa-sign-out-alt fa-2x text-danger"></i>
                            </a>
                        </c:if>
                    </div>
                </div>
            </nav>
            <div id="input-box w-60">
                <form class="input-book-form w-50 text-center mx-auto" action="shop.html" method="get">
                    <span>
                        <input type="text" name="search_book_input" id="book-input-box"
                               placeholder="What book do you need today?">
                        <button type="submit" id="submit-button"> <i class="fas fa-search"></i></button>
                    </span>

                </form>
            </div>
        </div>
    </div>
</html>
