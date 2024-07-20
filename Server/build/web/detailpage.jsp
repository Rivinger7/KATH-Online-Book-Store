<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin> -->
        <link
            href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
            rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <!-- <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet"> -->



        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/detailpage.css" rel="stylesheet">
        <link rel="stylesheet" href="css/starrating.css"> 
    </head>

    <body>

        <!-- Spinner Start -->
        <!-- <div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
                <div class="spinner-grow text-primary" role="status"></div>
            </div> -->
        <!-- Spinner End -->


        <!-- Navbar Start -->
        <jsp:include page="header.jsp"></jsp:include>

            <!-- Navbar End -->

            <!-- Single Product Start -->
            <div class="container-fluid pt-5 mt-5">
                <div class="row mt-5">
                    <nav aria-label="breadcrumb" class="d-flex justify-content-center fs-5">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="./homepage">Home</a></li>
                            <li class="breadcrumb-item"><a href="./shop">Categories</a></li>
                            <li class="breadcrumb-item"><a href="category?categoryName=${category.categoryName}&categoryID=${category.categoryID}">${category.categoryName}</a></li>
                        <li class="breadcrumb-item active" aria-current="page">${book.title}</li>

                    </ol>
                </nav>
            </div>
            <div class="container pt-5">
                <div class="row g-4 mb-5">
                    <div class="col-lg-8 col-xl-9">
                        <div class="row g-4">
                            <div class="col-lg-6">
                                <div class="border rounded">
                                    <a href="#">
                                        <img src="${book.image}" class="img-fluid rounded" alt="Image">
                                    </a>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <h4 class="fw-bold mb-3">${book.title}</h4>
                                <h5 class="mb-3">Category: ${category.categoryName}</h5>
                                <h5 class="fw-bold mb-3 text-danger">$ ${book.price}</h5>
                                <div class="d-flex mb-4">
                                    <div class="rating">
                                        <c:if test="${ratingBook == null}">
                                            <i class="fa fa-star-o text-secondary"></i>
                                        </c:if>
                                        <c:if test="${ratingBook != null}">
                                            <c:if test="${ratingBook < 1}">
                                                <i class="fa fa-star-o text-secondary"></i>
                                            </c:if>
                                            <c:forEach begin="1" end="${ratingBook}" var="i">
                                                <i class="fa fa-star text-secondary"></i>
                                            </c:forEach>
                                            <c:set var="ratingInteger" value="${fn:substringBefore(ratingBook, '.')}" />
                                            <c:set var="diff" value="${ratingBook - ratingInteger}" />
                                            <c:if test="${diff >= 0.5}">
                                                <i class="fa fa-star-half text-secondary"></i>
                                            </c:if>
                                        </c:if>
                                    </div>
                                    <div class="mx-auto fs-5">
                                        <strong>
                                            Sold: 
                                        </strong>
                                        <span class="fw-bold">
                                            ${book.sold}
                                        </span>

                                    </div>
                                </div>
                                <div class="row justify-content-space-between">
                                    <div class="row">
                                        <h5 class="fw-bold mb-3">
                                            Publisher: <span class="fw-normal">${publisher.publisherName}</span>
                                        </h5>

                                        <h5 class="fw-bold mb-3">
                                            Author: <span class="fw-normal">${author.authorName}</span>
                                        </h5>

                                        <h5 class="fw-bold mb-3">
                                            Year Of Publication: <span class="fw-normal">${book.yearOfPublication}</span>
                                        </h5>
                                    </div>
                                </div>
                                <p class="mb-4">${book.description}</p>
                                <div class="input-group quantity mb-5" style="width: 40%;">
                                    <div class="input-group-btn mx-2">
                                        <button id="minusBtn" class="btn btn-sm btn-minus rounded-circle bg-light border">
                                            <i class="fa fa-minus"></i>
                                        </button>
                                    </div>
                                    <input id="quantityInput" type="text" name="quantity" class="form-control form-control-sm text-center border-0 rounded"
                                           value="1">
                                    <div class="input-group-btn mx-2">
                                        <button id="plusBtn" class="btn btn-sm btn-plus rounded-circle bg-light border">
                                            <i class="fa fa-plus"></i>
                                        </button>
                                    </div>
                                </div>
                                <a id="addToCartLink" href="add_to_cart?title=${book.title}&bookID=${book.bookID}&quantity=" class="btn border border-secondary rounded-pill px-4 py-2 mb-4 mx-1 text-primary" ><i
                                        class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>

                                <a id="buyNowLink" href="buy_now?title=${book.title}&bookID=${book.bookID}&quantity=" class="btn border border-secondary rounded-pill px-4 py-2 mb-4 mx-1 text-primary buy_button">
                                    Buy Now
                                </a>
                            </div>
                            <div class="col-lg-12">
                                <nav>
                                    <div class="nav nav-tabs mb-3" style="margin-bottom: 3rem !important;">
                                        <button class="nav-link active border-white border-bottom-0" type="button"
                                                role="tab" id="nav-about-tab" data-bs-toggle="tab" data-bs-target="#nav-about"
                                                aria-controls="nav-about" aria-selected="true">Reviews</button>
                                    </div>
                                </nav>
                                <jsp:include page="review.jsp"></jsp:include>

                                </div>
                            <c:if test="${sessionScope.usersession != null}">
                                <form action="./book_detail" method="POST" class="mt-5">
                                    <h4 class="mb-4 fw-bold">Leave a Reply</h4>
                                    <div class="d-flex align-items-center mb-4">
                                        <p class="mb-0 me-3">Please rate:</p>
                                        <fieldset class="rating">
                                            <input type="radio" id="star5" name="rating" value="5"/><label for="star5" class="full" title="Awesome"></label>
                                            <input type="radio" id="star4.5" name="rating" value="4.5"/><label for="star4.5" class="half"></label>
                                            <input type="radio" id="star4" name="rating" value="4"/><label for="star4" class="full"></label>
                                            <input type="radio" id="star3.5" name="rating" value="3.5"/><label for="star3.5" class="half"></label>
                                            <input type="radio" id="star3" name="rating" value="3"/><label for="star3" class="full"></label>
                                            <input type="radio" id="star2.5" name="rating" value="2.5"/><label for="star2.5" class="half"></label>
                                            <input type="radio" id="star2" name="rating" value="2"/><label for="star2" class="full"></label>
                                            <input type="radio" id="star1.5" name="rating" value="1.5"/><label for="star1.5" class="half"></label>
                                            <input type="radio" id="star1" name="rating" value="1"/><label for="star1" class="full"></label>
                                            <input type="radio" id="star0.5" name="rating" value="0.5"/><label for="star0.5" class="half"></label>
                                        </fieldset>
                                        <!--<h4 id="rating-value"></h4>-->
                                        <input type="text" name="action" value="postComment" hidden>
                                        <input type="hidden" name="valueBookID" value="${book.bookID}" />
                                        <input type="hidden" id="rating-value" name="rating" value="0"/>

                                    </div>
                                    <div class="row g-4">
                                        <!--                                        <div class="col-lg-6">
                                                                                    <div class="border-bottom rounded">
                                                                                        <input type="text" class="form-control border-0 me-4" placeholder="Your Name *">
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-lg-6">
                                                                                    <div class="border-bottom rounded">
                                                                                        <input type="email" class="form-control border-0" placeholder="Your Email *">
                                                                                    </div>
                                                                                </div>-->
                                        <div class="col-lg-12">
                                            <div class="border-bottom rounded my-4">
                                                <textarea name="comment" id="" class="form-control border-0" cols="30" rows="8"
                                                          placeholder="Your Review *" spellcheck="false" required=""></textarea>
                                            </div>
                                        </div>
                                        <div class="col-lg-12">
                                            <div class="d-flex justify-content-end py-3 mb-5">

                                                <button type="submit"
                                                        class="btn border border-secondary text-primary rounded-pill px-4 py-3">
                                                    Post Comment</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </c:if>
                        </div>
                    </div>
                    <div class="col-lg-4 col-xl-3">
                        <div class="row g-4 fruite">
                            <div class="col-lg-12">
                                <h4 class="mb-4">Same Books</h4>
                                <c:forEach items="${relatedBooks}" var="o" begin="1" end="4">
                                    <%--<c:if test="${not o.title eq book.title}">--%>
                                    <a href="book_detail?title=${o.title}&bookID=${o.bookID}">
                                        <div id="featured_item" class="d-flex align-items-center justify-content-start">
                                            <div class="rounded" style="max-width: 40%;">
                                                <img src="${o.image}" class="img-fluid rounded" alt="Image">
                                            </div>
                                            <div id="featured_item_info">
                                                <h6 class="mb-2">${o.title}</h6>
                                                <div class="d-flex mb-2">
                                                    <div class="rating">
                                                        <c:if test="${o.rate == null}">
                                                            <i class="fa fa-star-o text-secondary"></i>
                                                        </c:if>
                                                        <c:if test="${o.rate != null}">
                                                            <c:if test="${o.rate < 1}">
                                                                <i class="fa fa-star-o text-secondary"></i>
                                                            </c:if>
                                                            <c:forEach begin="1" end="${o.rate}" var="i">
                                                                <i class="fa fa-star text-secondary"></i>
                                                            </c:forEach>
                                                            <c:set var="ratingInteger" value="${fn:substringBefore(o.rate, '.')}" />
                                                            <c:set var="diff" value="${o.rate - ratingInteger}" />
                                                            <c:if test="${diff >= 0.5}">
                                                                <i class="fa fa-star-half text-secondary"></i>
                                                            </c:if>
                                                        </c:if>

                                                    </div>
                                                </div>
                                                <div class="d-flex mb-2">
                                                    <h5 class="fw-bold me-2 text-danger">${o.price}</h5>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                    <%--</c:if>--%>
                                </c:forEach>
<!--                                <div id="featured_item" class="d-flex justify-content-center my-4">
                                    <a href=""
                                       class="btn border border-secondary px-4 py-3 rounded-pill text-primary w-100">Vew
                                        More</a>
                                </div>-->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Single Product End -->


        <!-- Footer Start -->
        <jsp:include page="footer.jsp"></jsp:include>

            <!-- Back to Top Start-->
        <%--<jsp:include page="backtotop.jsp"></jsp:include>--%>

        <!-- JavaScript Libraries -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
        <script src="js/starratings.js"></script>
        <script src="js/detailpage.js"></script>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const minusBtn = document.getElementById('minusBtn');
                const plusBtn = document.getElementById('plusBtn');
                const quantityInput = document.getElementById('quantityInput');
                const addToCartLink = document.getElementById('addToCartLink');
                const buyNowLink = document.getElementById('buyNowLink');

                // Function to update quantity and validate
                function updateQuantity() {
                    let newQuantity = parseInt(quantityInput.value);
                    if (isNaN(newQuantity) || newQuantity < 1) {
                        quantity = 1; // Set to 1 if the input is not a number or less than 1
                    } else {
                        quantity = newQuantity;
                    }
                    quantityInput.value = quantity;
                    updateLinks();
                }

                // Function to update links
                function updateLinks() {
                    const baseAddToCartUrl = `add_to_cart?title=${book.title}&bookID=${book.bookID}&quantity=`;
                    const baseBuyNowUrl = `add_to_cart?buyNow=true&title=${book.title}&bookID=${book.bookID}&quantity=`;
                    addToCartLink.href = baseAddToCartUrl + quantity;
                    buyNowLink.href = baseBuyNowUrl + quantity;
                }

                // Event listener for minus button
                minusBtn.addEventListener('click', function () {
                    if (quantity > 1) {
                        quantity -= 1;
                        quantityInput.value = quantity;
                        updateLinks();
                    }
                });

                // Event listener for plus button
                plusBtn.addEventListener('click', function () {
                    quantity += 1;
                    quantityInput.value = quantity;
                    updateLinks();
                });

                // Event listener for input change
                quantityInput.addEventListener('input', updateQuantity);

                // Initialize quantity and links on page load
                updateQuantity();
            });
        </script>



    </body>

</html>