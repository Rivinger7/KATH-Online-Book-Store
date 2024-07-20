<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>

        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/checkout.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
    </head>

    <body>

        <!-- Navbar Start -->

        <jsp:include page="header.jsp"></jsp:include>
            <!-- Navbar End -->

            <section class="py-5 mt-5-rem">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-8 col-lg-8 mb-4">


                            <!-- Checkout -->
                            <div class="card shadow-0 border background-color-FEF6EE">
                                <form action="./checkout" method="POST">
                                    <div class="p-4">
                                        <h5 class="card-title mb-3">Guest checkout</h5>
                                        <div class="row">
                                            <div class="col-6 mb-3">
                                                <p class="mb-0">First name</p>
                                                <div class="form-outline">
                                                    <input type="text" name="firstName" value="${sessionScope.usersession.firstName}" id="typeText" placeholder="Type here" class="form-control" />
                                            </div>
                                        </div>

                                        <div class="col-6">
                                            <p class="mb-0">Last name</p>
                                            <div class="form-outline">
                                                <input type="text" name="lastName" value="${sessionScope.usersession.lastName}" id="typeText" placeholder="Type here" class="form-control" />
                                            </div>
                                        </div>

                                        <div class="col-6 mb-3">
                                            <p class="mb-0">Phone</p>
                                            <div class="form-outline">
                                                <input type="tel" name="phoneNumber" id="typePhone" value="${sessionScope.usersession.phoneNumber}" class="form-control" />
                                            </div>
                                        </div>

                                        <div class="col-6 mb-3">
                                            <p class="mb-0">Email</p>
                                            <div class="form-outline">
                                                <input type="email" name="email" value="${sessionScope.usersession.email}" id="typeEmail" placeholder="example@gmail.com"
                                                       class="form-control" />
                                            </div>
                                        </div>
                                    </div>

                                    <!-- <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" />
                                        <label class="form-check-label" for="flexCheckDefault">Keep me up to date on
                                            news</label>
                                    </div> -->

                                    <hr class="my-4" />

                                    <h5 class="card-title mb-3">Shipping info</h5>

                                    <!-- Shipping Method -->
                                    <!-- <div class="row mb-3">
        
                                        <div class="col-lg-4 mb-3">
                                            <div class="form-check h-100 border rounded-3">
                                                <div class="p-3">
                                                    <input class="form-check-input" type="radio" name="flexRadioDefault"
                                                        id="flexRadioDefault1" checked />
                                                    <label class="form-check-label" for="flexRadioDefault1">
                                                        Express delivery <br />
                                                        <small class="text-muted">3-4 days via Fedex </small>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 mb-3">
                                            
                                            <div class="form-check h-100 border rounded-3">
                                                <div class="p-3">
                                                    <input class="form-check-input" type="radio" name="flexRadioDefault"
                                                        id="flexRadioDefault2" />
                                                    <label class="form-check-label" for="flexRadioDefault2">
                                                        Post office <br />
                                                        <small class="text-muted">20-30 days via post </small>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 mb-3">
                                            
                                            <div class="form-check h-100 border rounded-3">
                                                <div class="p-3">
                                                    <input class="form-check-input" type="radio" name="flexRadioDefault"
                                                        id="flexRadioDefault3" />
                                                    <label class="form-check-label" for="flexRadioDefault3">
                                                        Self pick-up <br />
                                                        <small class="text-muted">Come to our shop </small>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div> -->

                                    <div class="row">
                                        <div class="col-sm-8 mb-3">
                                            <p class="mb-0">Address</p>
                                            <div class="form-outline">
                                                <input id="addressInput" type="text" name="address" value="${sessionScope.usersession.address}" placeholder="Type here" class="form-control" />
                                            </div>
                                        </div>

                                        <div class="col-sm-4 mb-3">
                                            <p class="mb-0">City</p>
                                            <div class="form-outline">
                                                <input id="cityInput" type="text" name="city" value="${sessionScope.usersession.city}" placeholder="Type here" class="form-control" />
                                            </div>
                                        </div>

                                        <div class="col-sm-4 mb-3">
                                            <p class="mb-0">District</p>
                                            <div class="form-outline">
                                                <input id="districtInput" type="text" name="district" value="${sessionScope.usersession.district}" placeholder="Type here" class="form-control" />
                                            </div>
                                        </div>

                                        <div class="col-sm-4 col-6 mb-3">
                                            <p class="mb-0">Ward</p>
                                            <div class="form-outline">
                                                <input id="wardInput" type="text" name="ward" value="${sessionScope.usersession.ward}" class="form-control" />
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Checkbox for saving the address -->
                                    <!-- <div class="form-check mb-3">
                                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault1" />
                                        <label class="form-check-label" for="flexCheckDefault1">Save this address</label>
                                    </div> -->

                                    <div class="mb-3">
                                        <p class="mb-0">Note</p>
                                        <div class="form-outline">
                                            <textarea class="form-control" id="textAreaExample1" rows="2"></textarea>
                                        </div>
                                    </div>

                                    <div class="float-end mb-3">
                                        <button type="submit" name="action" value="cancel" class="btn btn-light border">Cancel</button>
                                        <button type="submit" name="action" value="orderConfirmation" class="btn btn-success shadow-0 border" onclick="return confirmOrder()">
                                            Order Confiramation
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <!-- Checkout -->
                    </div>
                    <div class="col-xl-4 col-lg-4 d-flex justify-content-center justify-content-lg-end">
                        <div class="ms-lg-4 mt-4 mt-lg-0" style="max-width: 320px;">
                            <h6 class="mb-3">Summary</h6>
                            <div class="d-flex justify-content-between">
                                <p class="mb-2">Total price:</p>
                                <p class="mb-2">$${sessionScope.totalCartPrice}</p>
                            </div>
                            <div class="d-flex justify-content-between">
                                <p class="mb-2">Discount:</p>
                                <p class="mb-2 text-danger">- $0.00</p>
                            </div>
                            <div class="d-flex justify-content-between">
                                <p class="mb-2">Shipping cost:</p>
                                <p class="mb-2">+ $0.00</p>
                            </div>
                            <hr />
                            <div class="d-flex justify-content-between">
                                <p class="mb-2">Total price:</p>
                                <p class="mb-2 fw-bold">$${sessionScope.totalCartPrice}</p>
                            </div>

                            <div class="input-group mt-3 mb-4">
                                <input type="text" class="form-control border" name="" placeholder="Promo code" />
                                <button class="btn btn-light text-primary border">Apply</button>
                            </div>

                            <hr />
                            <h6 class="text-dark my-4">Items in cart</h6>
                            <div class="card p-3 background-color-FEF6EE item-all">
                                <div class="row justify-content-start mt-4 item-in-cart">
                                    <c:forEach items="${sessionScope.cartBook}" var="o">
                                        <div class="col-6">
                                            <a href="#"><img class="img-fluid" src="${o.image}"
                                                             alt="Book 1">
                                            </a>
                                        </div>
                                        <div class="col-6">
                                            <p class="mt-3">
                                                <span class="text-dark">${o.title}</span>
                                            </p>
                                            <p>
                                                <span class="text-danger fw-bold">$${o.price}</span>
                                                <br>
                                                <span class="font-weight-bold">x${o.amount}</span>
                                            </p>
                                        </div>
                                        <hr class="my-4">
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <script src="js/checkout.js"></script>
    </body>

</html>