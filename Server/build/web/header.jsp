<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>

        <!-- Customized Bootstrap Stylesheet -->
        <!--<link rel="stylesheet" href="css/bootstrap.min.css" />-->

        <style>
            .mb-negative-1 {
                margin-bottom: -1rem !important;
            }
        </style>

    </head>
    <body>

        <div class="container-fluid fixed-top">
            <div class="container px-0">
                <nav id="logo_config" class="navbar navbar-light bg-white navbar-expand-xl">
                    <a href="./" class="navbar-brand w-30 col-md-2"><img class="img-fluid" src="images/header_image/KATH_label.png"
                                                                         alt=""></a>
                    <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarCollapse">
                        <span class="fa fa-bars text-primary"></span>
                    </button>
                    <div class="collapse navbar-collapse bg-white col-md-10" id="navbarCollapse">
                        <div class="navbar-nav mx-auto col-md-7">
                            <a href="./homepage" class="nav-item nav-link">Home</a>
                            <a href="#" class="nav-item nav-link">About</a>
                            <div class="nav-item dropdown">
                                <a href="./shop" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                                    Book Categories
                                </a>
                                <div class="dropdown-menu m-0 bg-secondary rounded-0">
                                    <c:forEach items="${categoryList}" var="o">
                                        <a href="category?categoryName=${o.categoryName}&categoryID=${o.categoryID}" class="dropdown-item">
                                            ${o.categoryName}
                                        </a>
                                    </c:forEach>
                                    <!--                                    <a href="shop.jsp" class="dropdown-item">Manga</a>
                                                                        <a href="shop.jsp" class="dropdown-item">Child</a>
                                                                        <a href="shop.jsp" class="dropdown-item">Novel</a>
                                                                        <a href="shop.jsp" class="dropdown-item">History</a>
                                                                        <a href="shop.jsp" class="dropdown-item">Textbook</a>
                                                                        <a href="shop.jsp" class="dropdown-item">Daily</a>-->
                                </div>
                            </div>
                            <!--<a href="#" class="nav-item nav-link">Detail</a>-->
                            <!--<a href="#" class="nav-item nav-link">Feedback</a>-->
                            <a href="contact.html" class="nav-item nav-link">Contact</a>
                        </div>
                        <div class="d-flex m-3 me-0 col-md-3 js-signin-modal-trigger">
                            <a class="my-auto mx-auto" href="./shopping_cart">
                                <i class="fas fa-shopping-cart fa-2x"></i>
                                <c:if test="${not empty sessionScope.cartList and sessionScope.cartList.size() > 0}">
                                    <span class="badge badge-primary" style="background-color: red; color: white; padding: 4px 8px; border-radius: 4px;">
                                        ${sessionScope.cartList.size()}
                                    </span>
                                </c:if>
                            </a>
                            <a class="my-auto mx-auto text-center" href="${redirectUrl}">
                                <i class="fas fa-user fa-2x"></i>
                                <c:if test="${sessionScope.usersession != null}">
                                    <div class="font-weight-bold mb-negative-1">
                                        ${sessionScope.usersession.firstName} ${sessionScope.usersession.lastName}
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
                <!--                <div id="input-box">
                                    <form class="input-book-form" action="#" method="get">
                                        <input type="text" name="search_book_input" id="book-input-box"
                                               placeholder="  What book do you need today?">
                                        <input type="submit" value="Search" id="submit-button">
                                    </form>
                                </div> -->
            </div>

        </div>
    </body>
</html>