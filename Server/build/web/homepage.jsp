<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Bookstore - KATH</title>

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
        <!-- <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons"> -->

    </head>

    <body>
        <!-- Header Start -->
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
                            <a href="./homepage" class="nav-item nav-link">Home</a>
                            <a href="#" class="nav-item nav-link">About</a>
                            <div class="nav-item dropdown">
                                <a href="./shop" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Book
                                    Categories</a>
                                <div class="dropdown-menu m-0 bg-secondary rounded-0">
                                    <!--                                    <a href="shop.jsp" class="dropdown-item">Science</a>
                                                                        <a href="shop.jsp" class="dropdown-item">Mystery</a>
                                                                        <a href="shop.jsp" class="dropdown-item">Light Novel</a>
                                                                        <a href="shop.jsp" class="dropdown-item">Romance</a>
                                                                        <a href="shop.jsp" class="dropdown-item">Fantasy</a>-->
                                    <c:forEach items="${categoryList}" var="o">
                                        <a href="category?categoryName=${o.categoryName}&categoryID=${o.categoryID}" class="dropdown-item">
                                            ${o.categoryName}
                                        </a>
                                    </c:forEach>
                                </div>
                            </div>
                            <!--<a href="detailpage.html" class="nav-item nav-link">Detail</a>-->
                            <!--<a href="#" class="nav-item nav-link">Feedback</a>-->
                            <a href="#" id="scrollToBottom" class="nav-item nav-link">Contact</a>
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
                <div id="input-box w-60">
                    <form class="input-book-form w-50 text-center mx-auto" action="./search" method="GET">
                        <span>
                            <input type="text" name="searchBookInput" id="book-input-box"
                                   placeholder="What book do you need today?" value="${searching}">
                            <button type="submit" id="submit-button"> <i class="fas fa-search"></i></button>
                        </span>

                    </form>
                </div>
            </div>
        </div>


        <!-- Header End -->

        <!-- Hero Start -->
        <div class="container-fluid py-5 mb-5 mt-9 hero-header">
            <div class="container py-5">
                <div class="row g-5 align-items-center">
                    <div class="col-md-12 col-lg-7">
                        <h4 class="mb-3 text-secondary">Have you known?</h4>
                        <h1 class="mb-5 display-3 text-primary">Book Makes You Better Everyday</h1>
                    </div>
                    <div class="col-md-12 col-lg-5">
                        <div id="carouselId" class="carousel slide position-relative" data-bs-ride="carousel">
                            <div class="carousel-item active rounded position-relative">
                                <img src="images/hero_image/hero-4.jpg" class="img-fluid w-100 h-100 bg-secondary rounded"
                                     alt="First slide">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Hero End -->

        <!-- Category List Start -->
        <!--        <div class="container py-0 category-for-all rounded-2">
                    <div class="category-subtitle border-bottom">
                        <h1>Category List</h1>
                    </div>
                    <div class="container-fluid d-flex mt-3">
        <c:forEach items="${categoryList}" var="o">
            <div class="col-md-2 category-description">
                <a href="category?categoryName=${o.categoryName}&categoryID=${o.categoryID}" class="link-category">
                    <div class="category-image rounded-2">
                        <img src="images/category_image/manga.jpg" alt="Manga">
                    </div>
                    <div class="text-description text-center">${o.categoryName}</div>
                </a>
            </div>
        </c:forEach>

                        <div class="col-md-2 category-description">
                            <a href="#" class="link-category">
                                <div class="category-image rounded-2">
                                    <img src="images/category_image/child.jpg" alt="Child Book">
                                </div>
                                <div class="text-description text-center">Child</div>
                            </a>
                        </div>
        
                        <div class="col-md-2 category-description">
                            <a href="#" class="link-category">
                                <div class="category-image rounded-2">
                                    <img src="images/category_image/novel.jpg" alt="Novel">
                                </div>
                                <div class="text-description text-center">Novel</div>
                            </a>
                        </div>
        
                        <div class="col-md-2 category-description">
                            <a href="#" class="link-category">
                                <div class="category-image rounded-2">
                                    <img src="images/category_image/history.jpg" alt="Histoty Book">
                                </div>
                                <div class="text-description text-center">History</div>
                            </a>
                        </div>
        
                        <div class="col-md-2 category-description">
                            <a href="#" class="link-category">
                                <div class="category-image rounded-2">
                                    <img src="images/category_image/textbook.jpg" alt="Textbook">
                                </div>
                                <div class="text-description text-center">Textbook</div>
                            </a>
                        </div>
        
                        <div class="col-md-2 category-description">
                            <a href="#" class="link-category">
                                <div class="category-image rounded-2">
                                    <img src="images/category_image/daily.jpg" alt="Daily Book">
                                </div>
                                <div class="text-description text-center">Daily</div>
                            </a>
                        </div>
    </div>
</div>-->
        <!-- Category List End -->

        <!-- Bonus 4 Fun -->
        <div class="container ads_banner">
            <img src="images/banner_advertisement.jpg" alt="" style="width: 50%; 
                 height: 200px;
                 display: block; 
                 margin-left: auto; 
                 margin-right: auto;
                 margin-top: -3%;">
        </div>


        <!-- Feature Start -->
        <div class="container py-1 feature-box">
            <h1 class="text-center border-bottom mb-3">Recommend</h1>
            <div class="half-part-in-left">
                <div class="col-md-3 left-part">
                    <div>
                        <img src="images/feature_image/feature_small_1.jpg" alt="devil-eyes goat">
                        <p>Devil-Eyes Goat</p>
                    </div>
                    <div>
                        <img src="images/feature_image/feature_small_3.jpg" alt="a little life">
                        <p>A Little Life</p>
                    </div>
                    <div>
                        <img src="images/feature_image/feature_small_5.jpg" alt="meticulously blooming">
                        <p>Meticulously Blooming...</p>
                    </div>
                </div>

                <div class="col-md-3 right-part w-20">
                    <div>
                        <img src="images/feature_image/feature_small_2.jpg" alt="devil-eyes goat">
                        <p>Children in Black Ocean</p>
                    </div>
                    <div>
                        <img src="images/feature_image/feature_small_4.jpg" alt="a little life">
                        <p>7 Ways To Change Your Own Life</p>
                    </div>
                    <div>
                        <img src="images/feature_image/feature_small_6.jpg" alt="meticulously blooming">
                        <p>999 Letters Send To Yourself</p>
                    </div>
                </div>

                <div class="col-md-6 half-part-in-right">
                    <div class="main-picture_1">
                        <img src="images/feature_image/feature_big.jpg" alt="">
                    </div>
                    <div class="main-picture_2">
                        <img src="images/feature_image/feature_big_2.jpg" alt="">
                    </div>
                </div>
            </div>
        </div>
        <!-- Feature End -->

        <!-- Best Seller Start -->
        <div class="container py-1 best-seller-banner" style="">
            <div class="best-seller-header">
                <h3 class="text-light">Best Seller</h3>
            </div>
            <div class="best-seller-button">
                <button name="Science" id="literature_option" class="button button-option-normal active">Science</button>
                <button name="Mystery" id="foreign_option" class="button button-option-normal">Mystery</button>
                <button name="Light Novel" id="economic_option" class="button button-option-normal">Light Novel</button>
                <button name="Romance" id="children_option" class="button button-option-normal">Romance</button>
                <button name="Fantasy" id="other_option" class="button button-option-normal">Fantasy</button>
            </div>
            <div>
                <div id="literature_content" class="content">
                    <div class="row pb-3">
                        <div class="col-md-5 content-first img-fluid">
                            <c:set var="i" value="${1}"></c:set>
                            <c:forEach items="${bestSellerScienceList}" var="o">
                                <a href="book_detail?title=${o.title}&bookID=${o.bookID}" class="first-best-book">
                                    <div class="col-md-.5 fas fa-arrow-up d-flex flex-column justify-content-center px-2 text-success text-center">${i}</div>
                                    <c:set var="i" value="${i+1}"></c:set>
                                    <img src="${o.image}" alt="" class="col-md-1">
                                    <div class="col-md-5 description-text w-60 m-3 d-flex flex-direction-column left-0 w-60 ml-3 d-flex flex-direction-column">${o.title}</div>
                                </a>
                            </c:forEach>

                            <!--                            <a href="" class="second-best-book">
                                                            <div class="col-md-.5 fas fa-arrow-up d-flex flex-column justify-content-center px-2"> 02 </div>
                                                            <img src="images/best_seller/literature2.jpg" alt="" class="col-md-1">
                                                            <div class="col-md-5 description-text w-60 m-3 d-flex flex-direction-column justify-content-center left-0">Forensic Records - Mysterious deaths</div>
                                                        </a>
                            
                                                        <a href="" class="third-best-book">
                                                            <div class="col-md-.5 fas fa-arrow-up d-flex flex-column justify-content-center px-2"> 03 </div>
                                                            <img src="images/best_seller/literature3.jpg" alt="" class="col-md-1">
                                                            <div class="col-md-5 description-text w-60 m-3 d-flex flex-direction-column justify-content-center left-0">Forensic Records - When Corpses Can Talk</div>
                                                        </a>
                            
                                                        <a href="" class="fourth-best-book">
                                                            <div class="col-md-.5 fas fa-arrow-up d-flex flex-column justify-content-center px-2"> 04 </div>
                                                            <img src="images/best_seller/literature4.png" alt="" class="col-md-1">
                                                            <div class="col-md-5 description-text w-60 m-3 d-flex flex-direction-column justify-content-center left-0">Combo Full Forensic Records</div>
                                                        </a>
                            
                                                        <a href="" class="fifth-best-book">
                                                            <div class="col-md-.5 fas fa-arrow-up d-flex flex-column justify-content-center px-2"> 05 </div>
                                                            <img src="images/best_seller/literature5.png" alt="" class="col-md-1">
                                                            <div class="col-md-5 description-text w-60 m-3 d-flex flex-direction-column justify-content-center left-0">Chilren In Black Ocean</div>
                                                        </a>-->
                        </div>
                        <div class="col-md-7 content-second">
                            <c:set var="o" value="${bestSellerScienceList}"/>
                            <div id="first-book-detail-literature" class="row book-detail">
                                <div class="col-md-5">
                                    <a href="book_detail?title=${o[0].title}&bookID=${o[0].bookID}">
                                        <img src="${o[0].image}" alt="" class="img-fluid">
                                    </a>
                                </div>
                                <div class="col-md-7 ps-4 text-dark">
                                    <h3>${o[0].title}</h3>
                                    <p><strong>Year of Publication: </strong>${o[0].yearOfPublication}</p>
                                    <p><strong>Sold: </strong>${o[0].sold}</p>
                                    <h5>${Math.round(o[0].rate * 10.0) / 10.0} <i class="fa fa-star text-secondary"></i> </h5>
                                    <h5>$${o[0].price}</h5>
                                    <p>
                                        <span class="fw-bold">
                                            ${o[0].description}
                                        </span>
                                    </p>
                                </div>
                            </div>

                            <div id="second-book-detail-literature" class="row book-detail">
                                <div class="col-md-5">
                                    <a href="book_detail?title=${o[1].title}&bookID=${o[1].bookID}">
                                        <img src="${o[1].image}" alt="" class="img-fluid">
                                    </a>
                                </div>
                                <div class="col-md-7 ps-4 text-dark">
                                    <h3>${o[1].title}</h3>
                                    <p><strong>Year of Publication: </strong>${o[1].yearOfPublication}</p>
                                    <p><strong>Sold: </strong>${o[1].sold}</p>
                                    <h5>${Math.round(o[1].rate * 10.0) / 10.0} <i class="fa fa-star text-secondary"></i> </h5>
                                    <h5>$${o[1].price}</h5>
                                    <p>
                                        <span class="fw-bold">
                                            ${o[1].description}
                                        </span>
                                    </p>
                                </div>
                            </div>

                            <div id="third-book-detail-literature" class="row book-detail">
                                <div class="col-md-5">
                                    <a href="book_detail?title=${o[2].title}&bookID=${o[2].bookID}">
                                        <img src="${o[2].image}" alt="" class="img-fluid">
                                    </a>
                                </div>
                                <div class="col-md-7 ps-4 text-dark">
                                    <h3>${o[2].title}</h3>
                                    <p><strong>Year of Publication: </strong>${o[2].yearOfPublication}</p>
                                    <p><strong>Sold: </strong>${o[2].sold}</p>
                                    <h5>${Math.round(o[2].rate * 10.0) / 10.0} <i class="fa fa-star text-secondary"></i> </h5>
                                    <h5>$${o[2].price}</h5>
                                    <p>
                                        <span class="fw-bold">
                                            ${o[2].description}
                                        </span>
                                    </p>
                                </div>
                            </div>

                            <div id="fourth-book-detail-literature" class="row book-detail">
                                <div class="col-md-5">
                                    <a href="book_detail?title=${o[1].title}&bookID=${o[3].bookID}">
                                        <img src="${o[3].image}" alt="" class="img-fluid">
                                    </a>
                                </div>
                                <div class="col-md-7 ps-4 text-dark">
                                    <h3>${o[3].title}</h3>
                                    <p><strong>Year of Publication: </strong>${o[3].yearOfPublication}</p>
                                    <p><strong>Sold: </strong>${o[3].sold}</p>
                                    <h5>${Math.round(o[3].rate * 10.0) / 10.0} <i class="fa fa-star text-secondary"></i> </h5>
                                    <h5>$${o[3].price}</h5>
                                    <p>
                                        <span class="fw-bold">
                                            ${o[3].description}
                                        </span>
                                    </p>
                                </div>
                            </div>

                            <div id="fifth-book-detail-literature" class="row book-detail">
                                <div class="col-md-5">
                                    <a href="book_detail?title=${o[4].title}&bookID=${o[4].bookID}">
                                        <img src="${o[4].image}" alt="" class="img-fluid">
                                    </a>
                                </div>
                                <div class="col-md-7 ps-4 text-dark">
                                    <h3>${o[4].title}</h3>
                                    <p><strong>Year of Publication: </strong>${o[4].yearOfPublication}</p>
                                    <p><strong>Sold: </strong>${o[4].sold}</p>
                                    <h5>${Math.round(o[4].rate * 10.0) / 10.0} <i class="fa fa-star text-secondary"></i> </h5>
                                    <h5>$${o[4].price}</h5>
                                    <p>
                                        <span class="fw-bold">
                                            ${o[4].description}
                                        </span>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="foreign_content" class="content">
                    <div class="row">
                        <div class="col-md-5 content-first img-fluid">
                            <c:set var="i" value="${1}"></c:set>
                            <c:forEach items="${bestSellerMysteryList}" var="o">
                                <a href="book_detail?title=${o.title}&bookID=${o.bookID}" class="first-best-book">
                                    <div class="col-md-.5 fas fa-arrow-up d-flex flex-column justify-content-center px-2 text-success text-center">${i}</div>
                                    <c:set var="i" value="${i+1}"></c:set>
                                    <img src="${o.image}" alt="" class="col-md-1">
                                    <div class="col-md-5 description-text w-60 m-3 d-flex flex-direction-column left-0 w-60 ml-3 d-flex flex-direction-column">${o.title}</div>
                                </a>
                            </c:forEach>

                            <!--                            <a href="" class="second-best-book">
                                                            <div class="col-md-.5 fas fa-arrow-up d-flex flex-column justify-content-center px-2"> 02 </div>
                                                            <img src="images/best_seller/foreign2.jpg" alt="" class="col-md-1">
                                                            <div class="col-md-5 description-text w-60 m-3 d-flex flex-direction-column justify-content-center left-0">Life BRE A2-B1: Student Book With Web App Code And
                                                                Online
                                                                Workbook 2nd Edition</div>
                                                        </a>
                            
                                                        <a href="" class="third-best-book">
                                                            <div class="col-md-.5 fas fa-arrow-up d-flex flex-column justify-content-center px-2"> 03 </div>
                                                            <img src="images/best_seller/foreign3.jpg" alt="" class="col-md-1">
                                                            <div class="col-md-5 description-text w-60 m-3 d-flex flex-direction-column justify-content-center left-0">English Grammar in Use Book w Ans</div>
                                                        </a>
                            
                                                        <a href="" class="fourth-best-book">
                                                            <div class="col-md-.5 fas fa-arrow-up d-flex flex-column justify-content-center px-2"> 04 </div>
                                                            <img src="images/best_seller/foreign4.jpg" alt="" class="col-md-1">
                                                            <div class="col-md-5 description-text w-60 m-3 d-flex flex-direction-column justify-content-center left-0">Oxford Advanced Learner's Dictionary: Paperback -
                                                                10th
                                                                Edition</div>
                                                        </a>
                            
                                                        <a href="" class="fifth-best-book">
                                                            <div class="col-md-.5 fas fa-arrow-up d-flex flex-column justify-content-center px-2"> 05 </div>
                                                            <img src="images/best_seller/foreign5.jpg" alt="" class="col-md-1">
                                                            <div class="col-md-5 description-text w-60 m-3 d-flex flex-direction-column justify-content-center left-0">Oxford Essential Dictionary - New Ed - W/CD-Rom</div>
                                                        </a>-->

                        </div>
                        <div class="col-md-7 content-second">
                            <c:set var="o" value="${bestSellerMysteryList}"/>
                            <div id="first-book-detail-foreign" class="row book-detail">
                                <div class="col-md-5">
                                    <a href="book_detail?title=${o[0].title}&bookID=${o[0].bookID}">
                                        <img src="${o[0].image}" alt="" class="img-fluid">
                                    </a>
                                </div>
                                <div class="col-md-7 ps-4 text-dark">
                                    <h3>${o[0].title}</h3>
                                    <p><strong>Year of Publication: </strong>${o[0].yearOfPublication}</p>
                                    <p><strong>Sold: </strong>${o[0].sold}</p>
                                    <h5>${Math.round(o[0].rate * 10.0) / 10.0} <i class="fa fa-star text-secondary"></i> </h5>
                                    <h5>$${o[0].price}</h5>
                                    <p>
                                        <span class="fw-bold">
                                            ${o[0].description}
                                        </span>
                                    </p>
                                </div>
                            </div>

                            <div id="second-book-detail-foreign" class="row book-detail">
                                <div class="col-md-5">
                                    <a href="book_detail?title=${o[1].title}&bookID=${o[1].bookID}">
                                        <img src="${o[1].image}" alt="" class="img-fluid">
                                    </a>
                                </div>
                                <div class="col-md-7 ps-4 text-dark">
                                    <h3>${o[1].title}</h3>
                                    <p><strong>Year of Publication: </strong>${o[1].yearOfPublication}</p>
                                    <p><strong>Sold: </strong>${o[1].sold}</p>
                                    <h5>${Math.round(o[1].rate * 10.0) / 10.0} <i class="fa fa-star text-secondary"></i> </h5>
                                    <h5>$${o[1].price}</h5>
                                    <p>
                                        <span class="fw-bold">
                                            ${o[1].description}
                                        </span>
                                    </p>
                                </div>
                            </div>

                            <div id="third-book-detail-foreign" class="row book-detail">
                                <div class="col-md-5">
                                    <a href="book_detail?title=${o[0].title}&bookID=${o[0].bookID}">
                                        <img src="${o[0].image}" alt="" class="img-fluid">
                                    </a>
                                </div>
                                <div class="col-md-7 ps-4 text-dark">
                                    <h3>${o[2].title}</h3>
                                    <p><strong>Year of Publication: </strong>${o[2].yearOfPublication}</p>
                                    <p><strong>Sold: </strong>${o[2].sold}</p>
                                    <h5>${Math.round(o[2].rate * 10.0) / 10.0} <i class="fa fa-star text-secondary"></i> </h5>
                                    <h5>$${o[2].price}</h5>
                                    <p>
                                        <span class="fw-bold">
                                            ${o[2].description}
                                        </span>
                                    </p>
                                </div>
                            </div>

                            <div id="fourth-book-detail-foreign" class="row book-detail">
                                <div class="col-md-5">
                                    <a href="book_detail?title=${o[3].title}&bookID=${o[3].bookID}">
                                        <img src="${o[3].image}" alt="" class="img-fluid">
                                    </a>
                                </div>
                                <div class="col-md-7 ps-4 text-dark">
                                    <h3>${o[3].title}</h3>
                                    <p><strong>Year of Publication: </strong>${o[3].yearOfPublication}</p>
                                    <p><strong>Sold: </strong>${o[3].sold}</p>
                                    <h5>${Math.round(o[3].rate * 10.0) / 10.0} <i class="fa fa-star text-secondary"></i> </h5>
                                    <h5>$${o[3].price}</h5>
                                    <p>
                                        <span class="fw-bold">
                                            ${o[3].description}
                                        </span>
                                    </p>
                                </div>
                            </div>

                            <div id="fifth-book-detail-foreign" class="row book-detail">
                                <div class="col-md-5">
                                    <a href="book_detail?title=${o[4].title}&bookID=${o[4].bookID}">
                                        <img src="${o[4].image}" alt="" class="img-fluid">
                                    </a>
                                </div>
                                <div class="col-md-7 ps-4 text-dark">
                                    <h3>${o[4].title}</h3>
                                    <p><strong>Year of Publication: </strong>${o[4].yearOfPublication}</p>
                                    <p><strong>Sold: </strong>${o[4].sold}</p>
                                    <h5>${Math.round(o[4].rate * 10.0) / 10.0} <i class="fa fa-star text-secondary"></i> </h5>
                                    <h5>$${o[4].price}</h5>
                                    <p>
                                        <span class="fw-bold">
                                            ${o[4].description}
                                        </span>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="economic_content" class="content">
                    <div class="row">
                        <div class="col-md-5 content-first">
                            <c:set var="i" value="${1}"></c:set>
                            <c:forEach items="${bestSellerLightNovelList}" var="o">
                                <a href="book_detail?title=${o.title}&bookID=${o.bookID}" class="first-best-book">
                                    <div class="col-md-.5 fas fa-arrow-up d-flex flex-column justify-content-center px-2 text-success text-center">${i}</div>
                                    <c:set var="i" value="${i+1}"></c:set>
                                    <img src="${o.image}" alt="" class="col-md-1">
                                    <div class="col-md-5 description-text w-60 m-3 d-flex flex-direction-column left-0">${o.title}</div>
                                </a>
                            </c:forEach>

                            <!--                            <a href="" class="second-best-book">
                                                            <div class="col-md-.5 fas fa-arrow-up d-flex flex-column justify-content-center px-2"> 02 </div>
                                                            <img src="images/best_seller/economic2.jpg" alt="" class="col-md-1">
                                                            <div class="col-md-5 description-text w-60 m-3 d-flex flex-direction-column justify-content-center left-0">21st Century Monetary Policy</div>
                                                        </a>
                            
                                                        <a href="" class="third-best-book">
                                                            <div class="col-md-.5 fas fa-arrow-up d-flex flex-column justify-content-center px-2"> 03 </div>
                                                            <img src="images/best_seller/economic3.jpg" alt="" class="col-md-1">
                                                            <div class="col-md-5 description-text w-60 m-3 d-flex flex-direction-column justify-content-center left-0">The art of strategic thinking</div>
                                                        </a>
                            
                                                        <a href="" class="fourth-best-book">
                                                            <div class="col-md-.5 fas fa-arrow-up d-flex flex-column justify-content-center px-2"> 04 </div>
                                                            <img src="images/best_seller/economic4.jpg" alt="" class="col-md-1">
                                                            <div class="col-md-5 description-text w-60 m-3 d-flex flex-direction-column justify-content-center left-0">Currency Wars - Part 1 - Who Really Is the Richest
                                                                Person
                                                                in the World?</div>
                                                        </a>
                            
                                                        <a href="" class="fifth-best-book">
                                                            <div class="col-md-.5 fas fa-arrow-up d-flex flex-column justify-content-center px-2"> 05 </div>
                                                            <img src="images/best_seller/economic5.jpg" alt="" class="col-md-1">
                                                            <div class="col-md-5 description-text w-60 m-3 d-flex flex-direction-column justify-content-center left-0">Currency Wars - Part 2 - The Dominance of Financial
                                                                Power
                                                            </div>
                                                        </a>-->

                        </div>
                        <div class="col-md-7 content-second">
                            <c:set var="o" value="${bestSellerLightNovelList}"/>
                            <div id="first-book-detail-economic" class="row book-detail">
                                <div class="col-md-5">
                                    <a href="book_detail?title=${o[0].title}&bookID=${o[0].bookID}">
                                        <img src="${o[0].image}" alt="" class="img-fluid">
                                    </a>
                                </div>
                                <div class="col-md-7 ps-4 text-dark">
                                    <h3>${o[0].title}</h3>
                                    <p><strong>Year of Publication: </strong>${o[0].yearOfPublication}</p>
                                    <p><strong>Sold: </strong>${o[0].sold}</p>
                                    <h5>${Math.round(o[0].rate * 10.0) / 10.0} <i class="fa fa-star text-secondary"></i> </h5>
                                    <h5>$${o[0].price}</h5>
                                    <p>
                                        <span class="fw-bold">
                                            ${o[0].description}
                                        </span>
                                    </p>
                                </div>
                            </div>

                            <div id="second-book-detail-economic" class="row book-detail">
                                <div class="col-md-5">
                                    <a href="book_detail?title=${o[1].title}&bookID=${o[1].bookID}">
                                        <img src="${o[1].image}" alt="" class="img-fluid">
                                    </a>
                                </div>
                                <div class="col-md-7 ps-4 text-dark">
                                    <h3>${o[1].title}</h3>
                                    <p><strong>Year of Publication: </strong>${o[1].yearOfPublication}</p>
                                    <p><strong>Sold: </strong>${o[1].sold}</p>
                                    <h5>${Math.round(o[1].rate * 10.0) / 10.0} <i class="fa fa-star text-secondary"></i> </h5>
                                    <h5>$${o[1].price}</h5>
                                    <p>
                                        <span class="fw-bold">
                                            ${o[1].description}
                                        </span>
                                    </p>
                                </div>
                            </div>

                            <div id="third-book-detail-economic" class="row book-detail">
                                <div class="col-md-5">
                                    <a href="book_detail?title=${o[2].title}&bookID=${o[2].bookID}">
                                        <img src="${o[2].image}" alt="" class="img-fluid">
                                    </a>
                                </div>
                                <div class="col-md-7 ps-4 text-dark">
                                    <h3>${o[2].title}</h3>
                                    <p><strong>Year of Publication: </strong>${o[2].yearOfPublication}</p>
                                    <p><strong>Sold: </strong>${o[2].sold}</p>
                                    <h5>${Math.round(o[2].rate * 10.0) / 10.0} <i class="fa fa-star text-secondary"></i> </h5>
                                    <h5>$${o[2].price}</h5>
                                    <p>
                                        <span class="fw-bold">
                                            ${o[2].description}
                                        </span>
                                    </p>
                                </div>
                            </div>

                            <div id="fourth-book-detail-economic" class="row book-detail">
                                <div class="col-md-5">
                                    <a href="book_detail?title=${o[3].title}&bookID=${o[3].bookID}">
                                        <img src="${o[3].image}" alt="" class="img-fluid">
                                    </a>
                                </div>
                                <div class="col-md-7 ps-4 text-dark">
                                    <h3>${o[3].title}</h3>
                                    <p><strong>Year of Publication: </strong>${o[3].yearOfPublication}</p>
                                    <p><strong>Sold: </strong>${o[3].sold}</p>
                                    <h5>${Math.round(o[3].rate * 10.0) / 10.0} <i class="fa fa-star text-secondary"></i> </h5>
                                    <h5>$${o[3].price}</h5>
                                    <p>
                                        <span class="fw-bold">
                                            ${o[3].description}
                                        </span>
                                    </p>
                                </div>
                            </div>

                            <div id="fifth-book-detail-economic" class="row book-detail">
                                <div class="col-md-5">
                                    <a href="book_detail?title=${o[4].title}&bookID=${o[4].bookID}">
                                        <img src="${o[4].image}" alt="" class="img-fluid">
                                    </a>
                                </div>
                                <div class="col-md-7 ps-4 text-dark">
                                    <h3>${o[4].title}</h3>
                                    <p><strong>Year of Publication: </strong>${o[4].yearOfPublication}</p>
                                    <p><strong>Sold: </strong>${o[4].sold}</p>
                                    <h5>${Math.round(o[4].rate * 10.0) / 10.0} <i class="fa fa-star text-secondary"></i> </h5>
                                    <h5>$${o[4].price}</h5>
                                    <p>
                                        <span class="fw-bold">
                                            ${o[4].description}
                                        </span>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="children_content" class="content">
                    <div class="row">
                        <div class="col-md-5 content-first">
                            <c:forEach items="${bestSellerRomanceList}" var="o">
                                <a href="book_detail?title=${o.title}&bookID=${o.bookID}" class="first-best-book">
                                    <div class="col-md-.5 fas fa-arrow-up d-flex flex-column justify-content-center px-2"> 01 </div>
                                    <img src="${o.image}" alt="" class="col-md-1">
                                    <div class="col-md-5 description-text w-60 m-3 d-flex flex-direction-column left-0">${o.title}</div>
                                </a>
                            </c:forEach>

                            <!--                            <a href="" class="second-best-book">
                                                            <div class="col-md-.5 fas fa-arrow-up d-flex flex-column justify-content-center px-2"> 02 </div>
                                                            <img src="images/best_seller/children2.jpg" alt="" class="col-md-1">
                                                            <div class="col-md-5 description-text w-60 m-3 d-flex flex-direction-column justify-content-center left-0">Password Class New Version - Episode 6</div>
                                                        </a>
                            
                                                        <a href="" class="third-best-book">
                                                            <div class="col-md-.5 fas fa-arrow-up d-flex flex-column justify-content-center px-2"> 03 </div>
                                                            <img src="images/best_seller/children3.jpg" alt="" class="col-md-1">
                                                            <div class="col-md-5 description-text w-60 m-3 d-flex flex-direction-column justify-content-center left-0">Password Class New Version - Episode 2</div>
                                                        </a>
                            
                                                        <a href="" class="fourth-best-book">
                                                            <div class="col-md-.5 fas fa-arrow-up d-flex flex-column justify-content-center px-2"> 04 </div>
                                                            <img src="images/best_seller/children4.jpg" alt="" class="col-md-1">
                                                            <div class="col-md-5 description-text w-60 m-3 d-flex flex-direction-column justify-content-center left-0">Password Class New Version - Episode 4</div>
                                                        </a>
                            
                                                        <a href="" class="fifth-best-book">
                                                            <div class="col-md-.5 fas fa-arrow-up d-flex flex-column justify-content-center px-2"> 05 </div>
                                                            <img src="images/best_seller/children5.jpg" alt="" class="col-md-1">
                                                            <div class="col-md-5 description-text w-60 m-3 d-flex flex-direction-column justify-content-center left-0">Password Class New Version - Episode 5</div>
                                                        </a>-->

                        </div>
                        <div class="col-md-7 content-second">
                            <c:set var="o" value="${bestSellerRomanceList}"/>
                            <div id="first-book-detail-children" class="row book-detail">
                                <div class="col-md-5">
                                    <a href="book_detail?title=${o[0].title}&bookID=${o[0].bookID}">
                                        <img src="${o[0].image}" alt="" class="img-fluid">
                                    </a>
                                </div>
                                <div class="col-md-7 ps-4 text-dark">
                                    <h3>${o[0].title}</h3>
                                    <p><strong>Year of Publication: </strong>${o[0].yearOfPublication}</p>
                                    <p><strong>Sold: </strong>${o[0].sold}</p>
                                    <h5>${Math.round(o[0].rate * 10.0) / 10.0} <i class="fa fa-star text-secondary"></i> </h5>
                                    <h5>$${o[0].price}</h5>
                                    <p>
                                        <span class="fw-bold">
                                            ${o[0].description}
                                        </span>
                                    </p>
                                </div>
                            </div>

                            <div id="second-book-detail-children" class="row book-detail">
                                <div class="col-md-5">
                                    <a href="book_detail?title=${o[1].title}&bookID=${o[1].bookID}">
                                        <img src="${o[1].image}" alt="" class="img-fluid">
                                    </a>
                                </div>
                                <div class="col-md-7 ps-4 text-dark">
                                    <h3>${o[1].title}</h3>
                                    <p><strong>Year of Publication: </strong>${o[1].yearOfPublication}</p>
                                    <p><strong>Sold: </strong>${o[1].sold}</p>
                                    <h5>${Math.round(o[1].rate * 10.0) / 10.0} <i class="fa fa-star text-secondary"></i> </h5>
                                    <h5>$${o[1].price}</h5>
                                    <p>
                                        <span class="fw-bold">
                                            ${o[1].description}
                                        </span>
                                    </p>
                                </div>
                            </div>

                            <div id="third-book-detail-children" class="row book-detail">
                                <div class="col-md-5">
                                    <a href="book_detail?title=${o[2].title}&bookID=${o[2].bookID}">
                                        <img src="${o[2].image}" alt="" class="img-fluid">
                                    </a>
                                </div>
                                <div class="col-md-7 ps-4 text-dark">
                                    <h3>${o[2].title}</h3>
                                    <p><strong>Year of Publication: </strong>${o[2].yearOfPublication}</p>
                                    <p><strong>Sold: </strong>${o[2].sold}</p>
                                    <h5>${Math.round(o[2].rate * 10.0) / 10.0} <i class="fa fa-star text-secondary"></i> </h5>
                                    <h5>$${o[2].price}</h5>
                                    <p>
                                        <span class="fw-bold">
                                            ${o[2].description}
                                        </span>
                                    </p>
                                </div>
                            </div>

                            <div id="fourth-book-detail-children" class="row book-detail">
                                <div class="col-md-5">
                                    <a href="book_detail?title=${o[3].title}&bookID=${o[3].bookID}">
                                        <img src="${o[3].image}" alt="" class="img-fluid">
                                    </a>
                                </div>
                                <div class="col-md-7 ps-4 text-dark">
                                    <h3>${o[3].title}</h3>
                                    <p><strong>Year of Publication: </strong>${o[3].yearOfPublication}</p>
                                    <p><strong>Sold: </strong>${o[3].sold}</p>
                                    <h5>${Math.round(o[3].rate * 10.0) / 10.0} <i class="fa fa-star text-secondary"></i> </h5>
                                    <h5>$${o[3].price}</h5>
                                    <p>
                                        <span class="fw-bold">
                                            ${o[3].description}
                                        </span>
                                    </p>
                                </div>
                            </div>

                            <div id="fifth-book-detail-children" class="row book-detail">
                                <div class="col-md-5">
                                    <a href="book_detail?title=${o[4].title}&bookID=${o[4].bookID}">
                                        <img src="${o[4].image}" alt="" class="img-fluid">
                                    </a>
                                </div>
                                <div class="col-md-7 ps-4 text-dark">
                                    <h3>${o[4].title}</h3>
                                    <p><strong>Year of Publication: </strong>${o[4].yearOfPublication}</p>
                                    <p><strong>Sold: </strong>${o[4].sold}</p>
                                    <h5>${Math.round(o[4].rate * 10.0) / 10.0} <i class="fa fa-star text-secondary"></i> </h5>
                                    <h5>$${o[4].price}</h5>
                                    <p>
                                        <span class="fw-bold">
                                            ${o[4].description}
                                        </span>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="other_content" class="content">
                    <div class="row">
                        <div class="col-md-5 content-first">
                            <c:forEach items="${bestSellerFantasyList}" var="o">
                                <a href="book_detail?title=${o.title}&bookID=${o.bookID}" class="first-best-book">
                                    <div class="col-md-.5 fas fa-arrow-up d-flex flex-column justify-content-center px-2"> 01 </div>
                                    <img src="${o.image}" alt="" class="col-md-1">
                                    <div class="col-md-5 description-text w-60 m-3 d-flex flex-direction-column left-0">${o.title}</div>
                                </a>
                            </c:forEach>

                            <!--                            <a href="" class="second-best-book">
                                                            <div class="col-md-.5 fas fa-arrow-up d-flex flex-column justify-content-center px-2"> 02 </div>
                                                            <img src="images/best_seller/other2.jpg" alt="" class="col-md-1">
                                                            <div class="col-md-5 description-text w-60 m-3 d-flex flex-direction-column justify-content-center left-0">No Death No Birth Don't Be Afraid - Hardcover -
                                                                Special
                                                                Edition</div>
                                                        </a>
                            
                                                        <a href="" class="third-best-book">
                                                            <div class="col-md-.5 fas fa-arrow-up d-flex flex-column justify-content-center px-2"> 03 </div>
                                                            <img src="images/best_seller/other3.png" alt="" class="col-md-1">
                                                            <div class="col-md-5 description-text w-60 m-3 d-flex flex-direction-column justify-content-center left-0">Liu Pham Tu Instructions - Accumulate Blessings,
                                                                Improve
                                                                Fortune</div>
                                                        </a>
                            
                                                        <a href="" class="fourth-best-book">
                                                            <div class="col-md-.5 fas fa-arrow-up d-flex flex-column justify-content-center px-2"> 04 </div>
                                                            <img src="images/best_seller/other4.png" alt="" class="col-md-1">
                                                            <div class="col-md-5 description-text w-60 m-3 d-flex flex-direction-column justify-content-center left-0">Many Times, Many Lives</div>
                                                        </a>
                            
                                                        <a href="" class="fifth-best-book">
                                                            <div class="col-md-.5 fas fa-arrow-up d-flex flex-column justify-content-center px-2"> 05 </div>
                                                            <img src="images/best_seller/other5.jpg" alt="" class="col-md-1">
                                                            <div class="col-md-5 description-text w-60 m-3 d-flex flex-direction-column justify-content-center left-0">Writing Volume 1 - Part 2</div>
                                                        </a>-->

                        </div>
                        <div class="col-md-7 content-second">
                            <c:set var="o" value="${bestSellerFantasyList}"/>
                            <div id="first-book-detail-other" class="row book-detail">
                                <div class="col-md-5">
                                    <a href="book_detail?title=${o[0].title}&bookID=${o[0].bookID}">
                                        <img src="${o[0].image}" alt="" class="img-fluid">
                                    </a>
                                </div>
                                <div class="col-md-7 ps-4 text-dark">
                                    <h3>${o[0].title}</h3>
                                    <p><strong>Year of Publication: </strong>${o[0].yearOfPublication}</p>
                                    <p><strong>Sold: </strong>${o[0].sold}</p>
                                    <h5>${Math.round(o[0].rate * 10.0) / 10.0} <i class="fa fa-star text-secondary"></i> </h5>
                                    <h5>$${o[0].price}</h5>
                                    <p>
                                        <span class="fw-bold">
                                            ${o[0].description}
                                        </span>
                                    </p>
                                </div>
                            </div>

                            <div id="second-book-detail-other" class="row book-detail">
                                <div class="col-md-5">
                                    <a href="book_detail?title=${o[1].title}&bookID=${o[1].bookID}">
                                        <img src="${o[1].image}" alt="" class="img-fluid">
                                    </a>
                                </div>
                                <div class="col-md-7 ps-4 text-dark">
                                    <h3>${o[1].title}</h3>
                                    <p><strong>Year of Publication: </strong>${o[1].yearOfPublication}</p>
                                    <p><strong>Sold: </strong>${o[1].sold}</p>
                                    <h5>${Math.round(o[1].rate * 10.0) / 10.0} <i class="fa fa-star text-secondary"></i> </h5>
                                    <h5>$${o[1].price}</h5>
                                    <p>
                                        <span class="fw-bold">
                                            ${o[1].description}
                                        </span>
                                    </p>
                                </div>
                            </div>

                            <div id="third-book-detail-other" class="row book-detail">
                                <div class="col-md-5">
                                    <a href="book_detail?title=${o[2].title}&bookID=${o[2].bookID}">
                                        <img src="${o[2].image}" alt="" class="img-fluid">
                                    </a>
                                </div>
                                <div class="col-md-7 ps-4 text-dark">
                                    <h3>${o[2].title}</h3>
                                    <p><strong>Year of Publication: </strong>${o[2].yearOfPublication}</p>
                                    <p><strong>Sold: </strong>${o[2].sold}</p>
                                    <h5>${Math.round(o[2].rate * 10.0) / 10.0} <i class="fa fa-star text-secondary"></i> </h5>
                                    <h5>$${o[2].price}</h5>
                                    <p>
                                        <span class="fw-bold">
                                            ${o[2].description}
                                        </span>
                                    </p>
                                </div>
                            </div>

                            <div id="fourth-book-detail-other" class="row book-detail">
                                <div class="col-md-5">
                                    <a href="book_detail?title=${o[3].title}&bookID=${o[3].bookID}">
                                        <img src="${o[3].image}" alt="" class="img-fluid">
                                    </a>
                                </div>
                                <div class="col-md-7 ps-4 text-dark">
                                    <h3>${o[3].title}</h3>
                                    <p><strong>Year of Publication: </strong>${o[3].yearOfPublication}</p>
                                    <p><strong>Sold: </strong>${o[3].sold}</p>
                                    <h5>${Math.round(o[3].rate * 10.0) / 10.0} <i class="fa fa-star text-secondary"></i> </h5>
                                    <h5>$${o[3].price}</h5>
                                    <p>
                                        <span class="fw-bold">
                                            ${o[3].description}
                                        </span>
                                    </p>
                                </div>
                            </div>

                            <div id="fifth-book-detail-other" class="row book-detail">
                                <div class="col-md-5">
                                    <a href="book_detail?title=${o[4].title}&bookID=${o[4].bookID}">
                                        <img src="${o[4].image}" alt="" class="img-fluid">
                                    </a>
                                </div>
                                <div class="col-md-7 ps-4 text-dark">
                                    <h3>${o[4].title}</h3>
                                    <p><strong>Year of Publication: </strong>${o[4].yearOfPublication}</p>
                                    <p><strong>Sold: </strong>${o[4].sold}</p>
                                    <h5>${Math.round(o[4].rate * 10.0) / 10.0} <i class="fa fa-star text-secondary"></i> </h5>
                                    <h5>$${o[4].price}</h5>
                                    <p>
                                        <span class="fw-bold">
                                            ${o[4].description}
                                        </span>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <!-- New Book -->
        <div class="container py-1 new-book-banner">
            <div class="new-book-header">
                <h3 class="text-light">New Book</h3>
            </div>
            <div class="new-book-button mb-4">
                <button id="new1_option" class="button button-option-owl active">Science</button>
                <button id="new2_option" class="button button-option-owl">Mystery</button>
                <button id="new3_option" class="button button-option-owl">Light Novel</button>
                <button id="new4_option" class="button button-option-owl">Romance</button>
                <button id="new5_option" class="button button-option-owl">Fantasy</button>
            </div>
            <div id="new1_content" class="owl-content active">
                <div id="new1_content" class="vesitable">
                    <div class="owl-carousel vegetable-carousel justify-content-center">
                        <!-- 1 -->
                        <c:forEach items="${newBookScienceList}" var="o">
                            <div class="border border-primary rounded position-relative vesitable-item">

                                <a href="book_detail?title=${o.title}&bookID=${o.bookID}" style="display: block; overflow: hidden;">
                                    <div class="vesitable-img" style="overflow: hidden;">
                                        <img src="${o.image}" class="img-fluid w-100 rounded-top" alt="" style="height: 370px;">
                                    </div>
                                    <div class="text-white bg-primary px-3 py-1 rounded position-absolute"
                                         style="top: 10px; right: 10px;">
                                        New</div>
                                </a>
                                <div class="p-4 pb-0 rounded-bottom">
                                    <h4 class="d-block" style="min-height: 75px">${o.title}</h4>
                                    <p>
                                        <strong>Sold: </strong> ${o.sold}
                                    </p>
                                    <p>
                                        ${Math.round(o.rate * 10.0) / 10.0} <i class="fa fa-star text-secondary"></i>
                                    </p>
                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                        <p class="text-dark fs-5 fw-bold">$${o.price}</p>
                                        <!-- <a href="#" class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary">
                                            <i class="fa fa-shopping-bag me-2 text-primary"></i> 
                                            Add to cart
                                        </a> -->
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div id="new2_content" class="owl-content">
                <div id="new1_content" class="vesitable">
                    <div class="owl-carousel vegetable-carousel justify-content-center">
                        <c:forEach items="${newBookMysteryList}" var="o">
                            <div class="border border-primary rounded position-relative vesitable-item">

                                <a href="book_detail?title=${o.title}&bookID=${o.bookID}" style="display: block; overflow: hidden;">
                                    <div class="vesitable-img" style="overflow: hidden;">
                                        <img src="${o.image}" class="img-fluid w-100 rounded-top" alt="" style="height: 370px;">
                                    </div>
                                    <div class="text-white bg-primary px-3 py-1 rounded position-absolute"
                                         style="top: 10px; right: 10px;">
                                        New</div>
                                </a>
                                <div class="p-4 pb-0 rounded-bottom">
                                    <h4 class="d-block" style="min-height: 75px">${o.title}</h4>
                                    <p>
                                        <strong>Sold: </strong> ${o.sold}
                                    </p>
                                    <p>
                                        ${Math.round(o.rate * 10.0) / 10.0} <i class="fa fa-star text-secondary"></i>
                                    </p>
                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                        <p class="text-dark fs-5 fw-bold">$4.99</p>
                                        <!-- <a href="#" class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary">
                                            <i class="fa fa-shopping-bag me-2 text-primary"></i> 
                                            Add to cart
                                        </a> -->
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div id="new3_content" class="owl-content">
                <div id="new1_content" class="vesitable">
                    <div class="owl-carousel vegetable-carousel justify-content-center">
                        <c:forEach items="${newBookLightNovelList}" var="o">
                            <div class="border border-primary rounded position-relative vesitable-item">

                                <a href="book_detail?title=${o.title}&bookID=${o.bookID}" style="display: block; overflow: hidden;">
                                    <div class="vesitable-img" style="overflow: hidden;">
                                        <img src="${o.image}" class="img-fluid w-100 rounded-top" alt="" style="height: 370px;">
                                    </div>
                                    <div class="text-white bg-primary px-3 py-1 rounded position-absolute"
                                         style="top: 10px; right: 10px;">
                                        New</div>
                                </a>
                                <div class="p-4 pb-0 rounded-bottom">
                                    <h4 class="d-block" style="min-height: 75px">${o.title}</h4>
                                    <p>
                                        <strong>Sold: </strong> ${o.sold}
                                    </p>
                                    <p>
                                        ${Math.round(o.rate * 10.0) / 10.0} <i class="fa fa-star text-secondary"></i>
                                    </p>
                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                        <p class="text-dark fs-5 fw-bold">$4.99</p>
                                        <!-- <a href="#" class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary">
                                            <i class="fa fa-shopping-bag me-2 text-primary"></i> 
                                            Add to cart
                                        </a> -->
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div id="new4_content" class="owl-content">
                <div id="new1_content" class="vesitable">
                    <div class="owl-carousel vegetable-carousel justify-content-center">
                        <c:forEach items="${newBookRomanceList}" var="o">
                            <div class="border border-primary rounded position-relative vesitable-item">

                                <a href="book_detail?title=${o.title}&bookID=${o.bookID}" style="display: block; overflow: hidden;">
                                    <div class="vesitable-img" style="overflow: hidden;">
                                        <img src="${o.image}" class="img-fluid w-100 rounded-top" alt="" style="height: 370px;">
                                    </div>
                                    <div class="text-white bg-primary px-3 py-1 rounded position-absolute"
                                         style="top: 10px; right: 10px;">
                                        New</div>
                                </a>
                                <div class="p-4 pb-0 rounded-bottom">
                                    <h4 class="d-block" style="min-height: 75px">${o.title}</h4>
                                    <p>
                                        <strong>Sold: </strong> ${o.sold}
                                    </p>
                                    <p>
                                        ${Math.round(o.rate * 10.0) / 10.0} <i class="fa fa-star text-secondary"></i>
                                    </p>
                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                        <p class="text-dark fs-5 fw-bold">$4.99</p>
                                        <!-- <a href="#" class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary">
                                            <i class="fa fa-shopping-bag me-2 text-primary"></i> 
                                            Add to cart
                                        </a> -->
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div id="new5_content" class="owl-content">
                <div id="new1_content" class="vesitable">
                    <div class="owl-carousel vegetable-carousel justify-content-center">
                        <c:forEach items="${newBookFantasyList}" var="o">
                            <div class="border border-primary rounded position-relative vesitable-item">

                                <a href="book_detail?title=${o.title}&bookID=${o.bookID}" style="display: block; overflow: hidden;">
                                    <div class="vesitable-img" style="overflow: hidden;">
                                        <img src="${o.image}" class="img-fluid w-100 rounded-top" alt="" style="height: 370px;">
                                    </div>
                                    <div class="text-white bg-primary px-3 py-1 rounded position-absolute"
                                         style="top: 10px; right: 10px;">
                                        New</div>
                                </a>
                                <div class="p-4 pb-0 rounded-bottom">
                                    <h4 class="d-block" style="min-height: 75px">${o.title}</h4>
                                    <p>
                                        <strong>Sold: </strong> ${o.sold}
                                    </p>
                                    <p>
                                        ${Math.round(o.rate * 10.0) / 10.0} <i class="fa fa-star text-secondary"></i>
                                    </p>
                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                        <p class="text-dark fs-5 fw-bold">$4.99</p>
                                        <!-- <a href="#" class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary">
                                            <i class="fa fa-shopping-bag me-2 text-primary"></i> 
                                            Add to cart
                                        </a> -->
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>

        <!-- Best Publisher -->
        <!-- <div class="container py-1 best-seller-banner">
            <div class="best-seller-header">
                <h3>Best Publisher</h3>
            </div>
            <div class="best-seller-button">
                <button id="NXB-Tre_option" class="button button-option-publisher">
                    NXB Trẻ
                </button>
                <button id="Alpha-Book_option" class="button button-option-publisher">
                    Alpha Book
                </button>
                <button id="Phu-Nu_option" class="button button-option-publisher">
                    NXB Phụ Nữ
                </button>
                <button id="Sakura-Light-Novel_option" class="button button-option-publisher">
                    Sakura Light Novel
                </button>
            </div>
            <div id="NXB-Tre_content" class="publisher-content active">
                <div class="row justify-content-center text-center mt-4">
                    <div class="col-md-2 mx-3">
                        <a href="#"><img class="img-fluid" src="images/best_seller/children1.jpg" alt="Book 1"></a>
                        <p class="mt-3">
                            <span class="text-dark">BLUE PERIOD</span>
                        </p>
                        <p>
                            <span class="text-danger fw-bold">30$</span>
                        </p>
                    </div>
                    <div class="col-md-2 mx-3">
                        <a href="#"><img class="img-fluid" src="images/best_seller/children1.jpg" alt="Book 2"></a>
                        <p class="mt-3">
                            <span class="text-dark">BLUE PERIOD</span>
                        </p>
                        <p>
                            <span class="text-danger fw-bold">30$</span>
                        </p>
                    </div>
                    <div class="col-md-2 mx-3">
                        <a href="#"><img class="img-fluid" src="images/best_seller/children1.jpg" alt="Book 3"></a>
                        <p class="mt-3">
                            <span class="text-dark">BLUE PERIOD</span>
                        </p>
                        <p>
                            <span class="text-danger fw-bold">30$</span>
                        </p>
                    </div>
                    <div class="col-md-2 mx-3">
                        <a href="#"><img class="img-fluid" src="images/best_seller/children1.jpg" alt="Book 4"></a>
                        <p class="mt-3">
                            <span class="text-dark">BLUE PERIOD</span>
                        </p>
                        <p>
                            <span class="text-danger fw-bold">30$</span>
                        </p>
                    </div>
                    <div class="col-md-2 mx-3">
                        <a href="#"><img class="img-fluid" src="images/best_seller/children1.jpg" alt="Book 5"></a>
                        <p class="mt-3">
                            <span class="text-dark">BLUE PERIOD</span>
                        </p>
                        <p>
                            <span class="text-danger fw-bold">30$</span>
                        </p>
                    </div>
                </div>
            </div>
            <div id="Alpha-Book_content" class="publisher-content"></div>
            <div id="Phu-Nu_content" class="publisher-content"></div>
            <div id="Sakura-Light-Novel_content" class="publisher-content"></div>
        </div> -->

        <!-- Footer Start -->
        <jsp:include page="footer.jsp"></jsp:include>

            <!-- Back-to-top Button Start-->
        <%--<jsp:include page="backtotop.jsp"></jsp:include>--%>

        <!-- JavaScript Libraries -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Embeded Javascript -->
        <script src="./js/homepage.js"></script>
        <script src="js/main.js"></script>
        <script>
            document.getElementById('scrollToBottom').addEventListener('click', function (e) {
                e.preventDefault();

                window.scrollTo({
                    top: document.body.scrollHeight,
                    behavior: 'smooth'
                });
            });
        </script>

    </body>

</html>