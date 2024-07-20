<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>

        <link rel="stylesheet" href="css/shoppingcart.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
        <!-- <link
            href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
            rel="stylesheet"> -->

    </head>

    <body>

        <!-- Navbar Start -->

        <jsp:include page="header.jsp"></jsp:include>
            <!-- Navbar End -->


            <section class="h-100 h-custom mt-7-rem">
                <div class="container h-100 mt-5 py-3 background-color-FEF6EE font-weight-500 rounded-3">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                        <div class="col">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <!-- <th scope="col"></th> -->
                                            <th scope="col" class="h5">Shopping Cart</th>
                                            <th scope="col">Unit Price</th> 
                                            <th scope="col">Quantity</th>
                                            <th scope="col">Price</th>
                                            <th scope="col"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:if test="${sessionScope.cartList != null}">
                                        <c:forEach items="${sessionScope.cartBook}" var="o">
                                            <tr class="border-primary">
                                                <th scope="row">
                                                    <div class="d-flex align-items-center">
                                                        <img src="${o.image}"
                                                             class="img-fluid rounded-3 book-image-cart" alt="Book">
                                                        <div class="flex-column ms-4">
                                                            <p class="mb-2">Title: ${o.title}</p>
                                                            <p class="mb-0">Category: ${o.category}</p>
                                                        </div>
                                                    </div>
                                                </th>

                                                <td class="align-middle">
                                                    <div class="d-flex flex-row">
                                                        $${o.price}
                                                    </div>
                                                </td> 

                                                <td class="align-middle">
                                                    <div class="d-flex flex-row">
                                                        <a class="btn btn-link px-2" href="./shopping_cart?bookID=${o.bookID}&decreasing=${o.amount}">
                                                            <i class="fas fa-minus"></i>
                                                        </a>
                                                        <input id="form1" min="0" name="quantity" value="${o.amount}" type="number" onkeydown="handleKeyDown(event, this, ${o.bookID})" onchange="updateValue(this)"
                                                               class="form-control form-control-sm text-center" style="width: 50px;" />
                                                        <a class="btn btn-link px-2" href="./shopping_cart?bookID=${o.bookID}&increasing=${o.amount}">
                                                            <i class="fas fa-plus"></i>
                                                        </a>
                                                    </div>
                                                </td>
                                                <td class="align-middle">
                                                    <p class="mb-0">$${Math.round((o.price * o.amount) * 100.0) / 100.0}</p>
                                                </td>
                                                <td class="align-middle">
                                                    <a href="./shopping_cart?bookID=${o.bookID}&isDeleted=${true}" class="delete-product">
                                                        <i class="fas fa-trash text-danger"></i>
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:if>
                                </tbody>
                            </table>
                        </div>

                        <div class="shadow-2-strong mb-5 mb-lg-0">
                            <div class="p-4">
                                <div class="row justify-content-end">

                                    <div class="col-lg-4 col-xl-3 text-end">
                                        <div class="d-flex justify-content-between">
                                            <p class="mb-2">Subtotal</p>
                                            <p class="mb-2">$${sessionScope.totalCartPrice > 0 ? sessionScope.totalCartPrice : 0}</p>
                                        </div>

                                        <div class="d-flex justify-content-between">
                                            <p class="mb-0">Shipping</p>
                                            <p class="mb-0">$0</p>
                                        </div>

                                        <!-- Separating Line Start-->
                                        <hr class="my-4">
                                        <!-- Separating Line End-->

                                        <div class="d-flex justify-content-between mb-4">
                                            <p class="mb-2">Total</p>
                                            <p class="mb-2">$${sessionScope.totalCartPrice > 0 ? sessionScope.totalCartPrice : 0}</p>
                                        </div>
                                        <c:if test="${sessionScope.cartList.size() > 0}">
                                            <button type="button" class="btn btn-danger btn-block btn-lg">
                                                <div class="d-flex justify-content-between">

                                                    <a href="checkout.jsp" style="color:aliceblue">
                                                        <span>PROCEED TO CHECKOUT</span>
                                                    </a>
                                                </div>
                                            </button>
                                        </c:if>

                                    </div>
                                </div>

                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </section>

        <!-- JavaScript -->
         <script src="js/shoppingcart.js"></script> 
    </body>

</html>