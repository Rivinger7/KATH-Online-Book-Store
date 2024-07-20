<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Fruitables - Vegetable Website Template</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Google Web Fonts -->
        <!-- <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
            rel="stylesheet"> -->

        <!-- Icon Font Stylesheet -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
        <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet"> -->

        <!-- Libraries Stylesheet -->
        <!-- <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet"> -->


        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/shop.css" rel="stylesheet">
    </head>

    <body>

        <!-- Header Start -->
        <jsp:include page="header.jsp"></jsp:include>
            <!-- Header End -->

            <!-- Spinner Start -->
            <!-- <div id="spinner"
                class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
                <div class="spinner-grow text-primary" role="status"></div>
            </div> -->
            <!-- Spinner End -->

            <!-- Modal Search Start -->
            <!--        <div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-fullscreen">
                            <div class="modal-content rounded-0">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Search by keyword</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body d-flex align-items-center">
                                    <div class="input-group w-75 mx-auto d-flex">
                                        <input type="search" class="form-control p-3" placeholder="keywords"
                                               aria-describedby="search-icon-1" value="${searching}">
                                        <span id="search-icon-1" class="input-group-text p-3"><i class="fa fa-search"></i></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>-->
        <!-- Modal Search End -->


        <!-- Single Page Header start -->
        <!-- <div class="container-fluid page-header py-5">
                <h1 class="text-center text-white display-6">Shop</h1>
                <ol class="breadcrumb justify-content-center mb-0">
                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                    <li class="breadcrumb-item"><a href="#">Pages</a></li>
                    <li class="breadcrumb-item active text-white">Shop</li>
                </ol>
            </div> -->
        <!-- Single Page Header End -->


        <!-- Book Shop Start-->
        <div class="container-fluid book py-5">
            <div class="container py-5">
                <!-- <h1 class="mb-4">Fresh fruits shop</h1> -->
                <div class="row g-4">
                    <div class="col-lg-12">
                        <div id="margin-top_inherit" class="row g-4">
                            <div class="col-xl-3">
                                <form action="./search">
                                <div class="input-group w-100 mx-auto d-flex">
                                    <input type="text" name="searchBookInput" class="form-control p-3" placeholder="Book Title"
                                           aria-describedby="search-icon-1" value="${searching}">
                                    <button type="submit">
                                            <i class="fa fa-search p-2"></i>
                                        </span>
                                    </button>
                                </div>
                                </form>
                            </div>
                            <div class="col-6 d-flex">
                                <!-- URL Info -->
                                <nav aria-label="breadcrumb" class="d-flex align-items-center fs-5">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="./homepage">Home</a></li>
                                        <li class="breadcrumb-item"><a href="./shop">Categories</a></li>
                                            <c:if test="${categoryName != null}">
                                            <li class="breadcrumb-item active" aria-current="page">${categoryName}</li>
                                            </c:if>
                                            <c:if test="${publisherName != null}">
                                            <li class="breadcrumb-item active" aria-current="page">${publisherName}</li>
                                            </c:if>
                                    </ol>
                                </nav>
                            </div>
<!--                            <div class="col-xl-3">
                                <div class="bg-light ps-3 py-3 rounded d-flex justify-content-between mb-4">
                                    <label for="books">Default Sorting:</label>
                                    <select id="books" name="booklist" class="border-0 form-select-sm bg-light me-3 px-3"
                                            form="bookform">
                                        <option value="Nothing">
                                            Nothing
                                        </option>
                                        <option value="Price">
                                            Price
                                        </option>
                                        <option value="Rating">
                                            Rating
                                        </option>
                                        <option value="Name">
                                            Name
                                        </option>
                                    </select>
                                </div>
                            </div>-->
                        </div>
                        <div class="row g-4">
                            <div class="col-lg-3">
                                <div class="row g-4">
                                    <div class="col-lg-12">
                                        <div id="category_border-bottom" class="mb-3">
                                            <h4>Categories</h4>
                                            <ul class="list-unstyled book-categories">
                                                <c:forEach items="${categoryList}" var="o">
                                                    <li>
                                                        <div class="d-flex justify-content-between book-category-detail">
                                                            <a href="category?categoryName=${o.categoryName}&categoryID=${o.categoryID}">
                                                                ${o.categoryName}
                                                            </a>
                                                        </div>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="mb-3">
                                            <h4 class="mb-2">Price</h4>
                                            <ol id="price" class="m-filter-css-checkboxes">
                                                <li>
                                                    <div class="d-flex justify-content-between book-price">
                                                        <a href="price?bookPrice=6">
                                                            0 - 6$
                                                        </a>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="d-flex justify-content-between book-price">
                                                        <a href="price?bookPrice=7">
                                                            6 - 12$
                                                        </a>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="d-flex justify-content-between book-price">
                                                        <a href="price?bookPrice=13">
                                                            12 - 20$
                                                        </a>
                                                    </div>

                                                </li>
                                                <li>
                                                    <div class="d-flex justify-content-between book-price">
                                                        <a href="price?bookPrice=21">
                                                            Above 20$
                                                        </a>
                                                    </div>
                                                </li>
                                            </ol>
                                            <!-- <input type="range" class="form-range w-100" id="rangeInput" name="rangeInput"
                                                min="0" max="500" value="0" oninput="amount.value=rangeInput.value">
                                            <output id="amount" name="amount" min-velue="0" max-value="500"
                                                for="rangeInput">0</output> -->
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="mb-3">
                                            <h4>Publisher</h4>
                                            <ul id="publisher" class="m-filter-css-checkboxes">
                                                <c:forEach items="${publisherList}" var="o">
                                                    <li>
                                                        <div class="d-flex justify-content-between book-publisher">
                                                            <a href="publisher?publisherName=${o.publisherName}&publisherID=${o.publisherID}">
                                                                ${o.publisherName}
                                                            </a>
                                                        </div>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </div>

                                    <!-- Featured Products? -->

                                    <div class="col-lg-12">
                                        <div class="position-relative">
                                            <img src="images/banner_advertisement.jpg"
                                                 class="img-fluid w-100 rounded" alt="">
                                            <div class="position-absolute"
                                                 style="top: 50%; right: 10px; transform: translateY(-50%);">
                                                <!-- <h3 class="text-secondary fw-bold">Fresh <br> Fruits <br> Banner</h3> -->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-9">
                                <div class="row g-4 justify-content-center">
                                    <c:forEach items="${bookList}" var="o">
                                        <div class="col-md-6 col-lg-6 col-xl-4">
                                            <div class="rounded position-relative book-item border border-secondary">

                                                <div class="book-img">
                                                    <a href="book_detail?title=${o.title}&bookID=${o.bookID}">
                                                        <img src="${o.image}"
                                                             class="img-fluid w-100 rounded-top" alt="">
                                                    </a>
                                                </div>

                                                <!--                                        <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                                                            style="top: 10px; left: 10px;">Fruits
                                                                                        </div>-->
                                                <!-- Book Detail -->
                                                <div class="px-4 pt-4 pb-5">
                                                    <h5>
                                                        <a href="book_detail?title=${o.title}&bookID=${o.bookID}" class="d-block" style="min-height: 75px">
                                                            ${o.title}
                                                        </a>
                                                    </h5>
                                                    <!--<p>Description</p>-->
                                                    <p text-dark fs-5 fw-bold mb-0>${Math.round(o.rate * 10.0) / 10.0} <i class="fa fa-star text-secondary"></i></p>
                                                    <p class="text-dark fs-5 fw-bold mb-0">$ ${o.price}</p>
                                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                                        <a href="add_to_cart?title=${o.title}&bookID=${o.bookID}"
                                                           class="btn border border-secondary rounded-pill px-3 mt-2 text-primary flex-row-1 .align-self-end">
                                                            <i 
                                                                class="fa fa-shopping-bag me-2 text-primary">    
                                                            </i>
                                                            Add to cart
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                    <div class="col-12">
                                        <div class="pagination d-flex justify-content-center mt-5">
                                            <!-- Category Paging -->
                                            <c:set var="categoryName" value="${param.categoryName}"/>
                                            <c:set var="categoryID" value="${param.categoryID}"/>

                                            <!-- Publisher Paging -->
                                            <c:set var="publisherName" value="${param.publisherName}"/>
                                            <c:set var="publisherID" value="${param.publisherID}"/>

                                            <!-- Price Paging -->
                                            <c:set var="bookPrice" value="${param.bookPrice}"/>

                                            <c:choose>

                                                <c:when test="${categoryName eq 'Science' and categoryID eq '1'}">
                                                    <c:forEach begin="1" end="${endPage}" var="i">
                                                        <a href="./category?categoryName=${categoryName}&categoryID=${categoryID}&page=${i}" class="rounded">${i}</a>
                                                    </c:forEach>
                                                </c:when>
                                                <c:when test="${categoryName eq 'Mystery' and categoryID eq '2'}">
                                                    <c:forEach begin="1" end="${endPage}" var="i">
                                                        <a href="category?categoryName=${categoryName}&categoryID=${categoryID}&page=${i}" class="rounded">${i}</a>
                                                    </c:forEach>
                                                </c:when>
                                                <c:when test="${categoryName eq 'Light Novel' and categoryID eq '3'}">
                                                    <c:forEach begin="1" end="${endPage}" var="i">
                                                        <a href="category?categoryName=${categoryName}&categoryID=${categoryID}&page=${i}" class="rounded">${i}</a>
                                                    </c:forEach>
                                                </c:when>
                                                <c:when test="${categoryName eq 'Romance' and categoryID eq '4'}">
                                                    <c:forEach begin="1" end="${endPage}" var="i">
                                                        <a href="category?categoryName=${categoryName}&categoryID=${categoryID}&page=${i}" class="rounded">${i}</a>
                                                    </c:forEach>
                                                </c:when>
                                                <c:when test="${categoryName eq 'Fantasy' and categoryID eq '5'}">
                                                    <c:forEach begin="1" end="${endPage}" var="i">
                                                        <a href="category?categoryName=${categoryName}&categoryID=${categoryID}&page=${i}" class="rounded">${i}</a>
                                                    </c:forEach>
                                                </c:when>

                                                <c:when test="${publisherName eq 'Alpha Books' and publisherID eq '1'}">
                                                    <c:forEach begin="1" end="${endPage}" var="i">
                                                        <a href="publisher?publisherName=${publisherName}&publisherID=${publisherID}&page=${i}" class="rounded">${i}</a>
                                                    </c:forEach>
                                                </c:when>
                                                <c:when test="${publisherName eq 'Mega World' and publisherID eq '2'}">
                                                    <c:forEach begin="1" end="${endPage}" var="i">
                                                        <a href="publisher?publisherName=${publisherName}&publisherID=${publisherID}&page=${i}" class="rounded">${i}</a>
                                                    </c:forEach>
                                                </c:when>
                                                <c:when test="${publisherName eq 'IPM' and publisherID eq '3'}">
                                                    <c:forEach begin="1" end="${endPage}" var="i">
                                                        <a href="publisher?publisherName=${publisherName}&publisherID=${publisherID}&page=${i}" class="rounded">${i}</a>
                                                    </c:forEach>
                                                </c:when>
                                                <c:when test="${publisherName eq 'Sakura Light Novel' and publisherID eq '4'}">
                                                    <c:forEach begin="1" end="${endPage}" var="i">
                                                        <a href="publisher?publisherName=${publisherName}&publisherID=${publisherID}&page=${i}" class="rounded">${i}</a>
                                                    </c:forEach>
                                                </c:when>

                                                <c:when test="${bookPrice > 0  and bookPrice <= 6}">
                                                    <c:forEach begin="1" end="${endPage}" var="i">
                                                        <a href="price?bookPrice=${bookPrice}&page=${i}" class="rounded">${i}</a>
                                                    </c:forEach>
                                                </c:when>
                                                <c:when test="${bookPrice > 6 and bookPrice <= 12}">
                                                    <c:forEach begin="1" end="${endPage}" var="i">
                                                        <a href="price?bookPrice=${bookPrice}&page=${i}" class="rounded">${i}</a>
                                                    </c:forEach>
                                                </c:when>
                                                <c:when test="${bookPrice > 12  and bookPrice <= 20}">
                                                    <c:forEach begin="1" end="${endPage}" var="i">
                                                        <a href="price?bookPrice=${bookPrice}&page=${i}" class="rounded">${i}</a>
                                                    </c:forEach>
                                                </c:when>
                                                <c:when test="${bookPrice > 20}">
                                                    <c:forEach begin="1" end="${endPage}" var="i">
                                                        <a href="price?bookPrice=${bookPrice}&page=${i}" class="rounded">${i}</a>
                                                    </c:forEach>
                                                </c:when>


                                                <c:otherwise>
                                                    <c:forEach begin="1" end="${endPage}" var="i">
                                                        <a href="shop?page=${i}" class="rounded">${i}</a>
                                                    </c:forEach>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Fruits Shop End-->


        <!-- Footer Start -->
        <div class="container-fluid bg-dark text-white-50 footer pt-5 mt-5">
            <div class="container py-5">
                <div class="pb-4 mb-4" style="border-bottom: 1px solid rgba(226, 175, 24, 0.5) ;">
                    <div class="row g-4">
                        <div class="col-lg-3">
                            <a href="#">
                                <h1 class="text-primary mb-0">Books</h1>
                                <!-- <p class="text-secondary mb-0">Book products</p> -->
                            </a>
                        </div>
<!--                        <div class="col-lg-6">
                            <div class="position-relative mx-auto">
                                <input class="form-control border-0 w-100 py-3 px-4 rounded-pill" type="number" placeholder="Your Email">
                                <button type="submit" class="btn btn-primary border-0 border-secondary py-3 px-4 position-absolute rounded-pill text-white" style="top: 0; right: 0;">Subscribe Now</button>
                            </div>
                        </div>-->
                        <div class="col-lg-4">
                            <div class="d-flex justify-content-end pt-3">
                                <a class="btn  btn-outline-secondary me-2 btn-md-square rounded-circle" href=""><i class="fab fa-twitter"></i></a>
                                <a class="btn btn-outline-secondary me-2 btn-md-square rounded-circle" href=""><i class="fab fa-facebook-f"></i></a>
                                <a class="btn btn-outline-secondary me-2 btn-md-square rounded-circle" href=""><i class="fab fa-youtube"></i></a>
                                <a class="btn btn-outline-secondary btn-md-square rounded-circle" href=""><i class="fab fa-linkedin-in"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row g-5">



                    <div class="">
                        <div class="footer-item">
                            <!-- <h4 class="text-light mb-3">Contact</h4> -->
                            <div id="footer_image" class="col-md-12"><p>
                                    <img src="images/header_image/KATH_label.png" class="img-fluid" alt="KATH"></p>
                            </div>
                            <p>Address: 1429 Netus Rd, NY 48247</p>
                            <p>Email: Example@gmail.com</p>
                            <p>Phone: +0123 4567 8910</p>
                            <p>Payment Accepted</p>
                            <!--<img id="momo_payment" src="images/footer_payment/momo_pay.png" class="img-fluid" alt="">-->
                            <p><strong>COD</strong></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer End -->

        <!-- Copyright Start -->
        <!-- <div class="container-fluid copyright bg-dark py-4">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                        <span class="text-light"><a href="#"><i class="fas fa-copyright text-light me-2"></i>Your Site
                                Name</a>, All right reserved.</span>
                    </div>
                    <div class="col-md-6 my-auto text-center text-md-end text-white">
                        Designed By <a class="border-bottom" href="https://htmlcodex.com">HTML Codex</a> Distributed By <a
                            class="border-bottom" href="https://themewagon.com">ThemeWagon</a>
                    </div>
                </div>
            </div>
        </div> -->
        <!-- Copyright End -->



        <!-- Back to Top -->
        <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
                class="fa fa-arrow-up"></i></a>


        <!-- JavaScript Libraries -->
        <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> -->
        <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script> -->
        <!-- <script src="lib/easing/easing.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/lightbox/js/lightbox.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script> -->

        <!-- Template Javascript -->
        <!-- <script src="js/main.js"></script> -->
    </body>

</html>