<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700&display=swap">


        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/profile.css">

    </head>

    <body>
        <div class="container">
            <div class="row">
                <div class="label-img col-md-2"><a href="./homepage"> <img
                            class="logo-img img-fluid img-thumbnail d-inline" src="./images/header_image/KATH_label.png"
                            alt=""></a></div>
                <div class="col-12">
                    <div class="header-around">
                        <!-- Label -->

                        <!-- Nav-Link Start-->
                        <div class="nav-button text-center col-md-12">
                            <button id="profile_option" class="button active">Profile</button>
                            <button id="my-order_option" class="button">Order History</button>
                            <button id="shipping-address_option" class="button">Shipping Address</button>
                            <button id="voucher_option" class="button">Voucher</button>
                            <!-- <button id="other_option" class="button">Other</button> -->
                        </div>
                        <!-- Nav-Link End-->
                    </div>

                    <!-- Profile Content Start -->
                    <div id="profile_content" class="content active">
                        <!-- Page title -->
                        <div class="my-5">
                            <h3>My Profile</h3>
                            <hr>
                        </div>
                        <!-- Form START -->
                        <form class="" action="./profile" method="POST"
                              enctype="multipart/form-data">
                            <!-- Contact Info -->
                            <div class="row g-3">
                                <div class="d-flex info-logout w-100">
                                    <h4 class="mb-4 mt-0 col-md-11">Contact detail</h4>
                                    <a href="./logout" class="logout-button">
                                        <div>Log out!</div> <i class="material-icons"
                                                               style="font-size: 40px;">exit_to_app</i>
                                    </a>
                                </div>
                                <!-- First Name -->
                                <div class="col-md-6">
                                    <label class="form-label">First Name *</label>
                                    <input type="text" name="firstName" class="form-control" aria-label="First name" placeholder="Enter your first name"
                                           value="${sessionScope.usersession.firstName}"
                                           oninput="updateFirstNameValue(this)">
                                </div>
                                <!-- Last name -->
                                <div class="col-md-6">
                                    <label class="form-label">Last Name *</label>
                                    <input type="text" name="lastName" class="form-control" aria-label="Last name" placeholder="Enter your last name"
                                           value="${sessionScope.usersession.lastName}"
                                           >
                                </div>
                                <!-- Phone number -->
                                <div class="col-md-6">
                                    <label class="form-label">Phone number *</label>
                                    <input type="text" name="phoneNumber" class="form-control" aria-label="Phone number" placeholder="Enter your phone number"
                                           value=${sessionScope.usersession.phoneNumber}
                                           >
                                </div>
                                <!-- Email -->
                                <div class="col-md-6">
                                    <label for="inputEmail" class="form-label">Email *</label>
                                    <input type="email" name="email" class="form-control" id="inputEmail" placeholder="Enter your email"
                                           value="${sessionScope.usersession.email}"
                                           oninput="updateEmailValue(this)">
                                </div>
                                <!-- Birthday -->
                                <div class="col-md-6">
                                    <label for="inputBirthday" class="form-label">Birthday</label>
                                    <input type="date" name="birthday" class="form-control" id="inputBirthday" placeholder="Enter your"
                                           value="${sessionScope.usersession.convertBirthday()}">
                                </div>
                                <!-- Gender -->
                                <div class="col-md-6">
                                    <label for="inputGender" class="form-label">Gender</label>
                                    <select class="form-control" id="inputGender" name="gender">
                                        <option value="Male" ${sessionScope.usersession.gender == 'Male' ? 'selected' : ''}>Male</option>
                                        <option value="Female" ${sessionScope.usersession.gender == 'Female' ? 'selected' : ''}>Female</option>
                                        <option value="Unknown" ${sessionScope.usersession.gender == null ? 'selected' : ''}>Not Selected</option>
                                    </select>
                                </div>
                                <div class="gap-3 d-md-flex justify-content-md-end text-center">
                                    <button type="submit" name="action" value="updateProfile"
                                            class="btn btn-success mt-2">Update
                                        profile</button>
                                </div>
                            </div>
                        </form>
                        <!-- Upload Avatar -->
                        <form class="file-upload" action="./profile" method="POST" enctype="multipart/form-data">
                            <div class="row g-9">
                                <div class="bg-secondary-soft px-4 py-5 rounded">
                                    <div class="row g-3">
                                        <h4 class="mb-4 mt-0">Upload your profile photo</h4>
                                        <div class="text-center">
                                            <!-- Image upload -->
                                            <div class="square mb-3">
                                                <img width="100%" height="100%" src="${sessionScope.usersession.avatarPath}" alt="Avatar">
                                            </div>
                                            <!-- Button -->
                                            <input type="file" id="customFile" name="avatar" hidden="">
                                            <label class="btn btn-primary btn-block" for="customFile">Upload</label>
                                            <button type="submit" name="action" value="uploadAvatar" class="btn btn-success">Save</button>
                                            <!-- Content -->
                                            <p class="text-muted mt-3 mb-0"><span class="me-1">Note:</span>Minimum size
                                                300px * 300px</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>


                        <!-- Delete Account -->
                        <div class="d-flex justify-content-between align-items-center">
                            <form class="file-delete" action="./profile" method="POST" enctype="multipart/form-data">
                                <!-- Delete account card-->
                                <div class="card mb-4">
                                    <div class="card-header">Delete Account</div>
                                    <div class="card-body">
                                        <p>Deleting your account is a permanent action and cannot be undone. If you are
                                            sure
                                            you
                                            want to delete your account, select the button below.</p>
                                        <button type="submit" name="action" value="deleteAccount" onclick="return confirmDeleteAccount()"
                                                class="btn btn-danger-soft text-danger">I understand,
                                            delete
                                            my
                                            account</button>
                                    </div>
                                </div>
                            </form>

                            <!-- Change password -->
                            <c:if test="${sessionScope.isGoogleUser == false}">
                                <form class="file-upload" action="./profile" method="POST" enctype="multipart/form-data">
                                    <div class="">
                                        <div class="px-4 py-4 rounded">
                                            <div class="row g-3">
                                                <h4 class="">Change Password</h4>
                                                <!-- Old password -->
                                                <c:if test="${requestScope.errorProfileMessage != null}">
                                                    <div class="alert alert-danger" role="alert">
                                                        ${requestScope.errorProfileMessage}
                                                    </div>
                                                </c:if>
                                                <c:if test="${requestScope.successfulMessage != null}">
                                                    <div class="alert alert-success" role="alert">
                                                        ${requestScope.successfulMessage}
                                                    </div>
                                                </c:if>
                                                <div class="col-md-6">
                                                    <label for="exampleInputPassword1" class="form-label">Old password
                                                        *</label>
                                                    <input name="oldPassword" type="password" class="form-control" id="exampleInputPassword1" required="">
                                                </div>
                                                <!-- New password -->
                                                <div class="col-md-6">
                                                    <label for="exampleInputPassword2" class="form-label">New password
                                                        *</label>
                                                    <input name="newPassword" type="password" class="form-control" id="exampleInputPassword2" required="">
                                                </div>
                                                <!-- Confirm password -->
                                                <div class="col-md-12">
                                                    <label for="exampleInputPassword3" class="form-label">Confirm Password
                                                        *</label>
                                                    <input name="passwordConfirmed" type="password" class="form-control" id="exampleInputPassword3" required="">
                                                </div>
                                                <!-- button -->
                                                <div class="gap-3 d-md-flex justify-content-md-end text-center">
                                                    <!-- <button type="button" class="btn btn-danger btn-lg">Delete profile</button> -->
                                                    <button type="submit" name="action" value="changePassword"
                                                            class="btn btn-danger">
                                                        Change Password
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </c:if>
                        </div>
                        <!-- Row END -->
                    </div>
                    <!-- Profile Content End -->

                    <!-- My Order History Start -->
                    <div id="my-order_content" class="content">
                        <div class="my-5">
                            <h3>Order History</h3>
                            <hr>
                        </div>
                        <div class="panel-order">
                            <c:forEach items="${sessionScope.orderList}" var="o">
                                <div class="row mt-4">
                                    <div class="col-md-1"><img src="${sessionScope.usersession.avatarPath}"
                                                               class="media-object img-thumbnail" /></div>
                                    <div class="col-md-11">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="pull-right mb-2">
                                                    <c:choose>
                                                        <c:when test="${o.status eq 'Pending'}">
                                                            <label class="label bg-warning text-dark fw-bold">
                                                                <strong>${o.status}</strong>
                                                            </label>
                                                        </c:when>
                                                        <c:when test="${o.status eq 'Accepted'}">
                                                            <label class="label bg-success text-dark fw-bold">
                                                                <strong>${o.status}</strong>
                                                            </label>
                                                        </c:when>
                                                        <c:when test="${o.status eq 'Rejected'}">
                                                            <label class="label bg-danger text-dark fw-bold">
                                                                <strong>${o.status}</strong>
                                                            </label>
                                                        </c:when>
                                                        <c:when test="${o.status eq 'Shipping'}">
                                                            <label class="label bg-secondary text-dark fw-bold">
                                                                <strong>${o.status}</strong>
                                                            </label>
                                                        </c:when>
                                                    </c:choose>
                                                </div>
                                                <span>
                                                    <strong>Order ID</strong>
                                                </span>
                                                <span lass="label label-info">
                                                    <strong>#${o.orderID}</strong>
                                                </span>
                                                <br/>
                                                <strong>Unit Quantity : ${o.unitQuantity}</strong>
                                                <br/>
                                                <strong>Cost: $${o.totalPrice}</strong>
                                                <br/>
                                                <div class="col-md-12">Order made on: ${o.date} by 
                                                    <a href="#">
                                                        ${sessionScope.usersession.firstName} ${sessionScope.usersession.lastName}
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <button class="button order-detail-button"> <i class="fas fa-angle-down fa-2x"></i></button>
                                    <div class="order-detail-content">
                                        <c:forEach items="${sessionScope.orderBookList[o.orderID]}" var="orderBook">
                                            <div class="banner-content">
                                                <img class="img-fluid" src="${orderBook.image}" alt="product">
                                                <div class="content-description"><strong>Titile:</strong> ${orderBook.title}<br>
                                                    <strong>Quantity: ${orderBook.amount}</strong>
                                                    <br>
                                                    <strong>Price: $${orderBook.price}</strong>
                                                    <br>
                                                    <strong>Total Price: $${Math.round((orderBook.price * orderBook.amount) * 100.0) / 100.0}</strong>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>

                    <!-- My Order End -->

                    <!-- Shipping Address Start -->
                    <div id="shipping-address_content" class="content">
                        <div class="my-5">
                            <h3>Shipping Address</h3>
                            <hr>
                        </div>
                        <div class="container mt-5">
                            <div class="row">
                                <!-- Contact Info -->
                                <div class="col-md-6">
                                    <h4>Contact Info</h4>
                                    <div class="mb-3">
                                        <label for="firstName" class="form-label">First Name</label>
                                        <input type="text" class="form-control" id="firstName"
                                               placeholder="Enter your first name"
                                               value="${sessionScope.usersession.firstName}">
                                    </div>
                                    <div class="mb-3">
                                        <label for="lastName" class="form-label">Last Name</label>
                                        <input type="text" class="form-control" id="lastName"
                                               placeholder="Enter your last name"
                                               value="${sessionScope.usersession.lastName}">
                                    </div>
                                    <div class="mb-3">
                                        <label for="phoneNumber" class="form-label">Phone Number</label>
                                        <input type="tel" class="form-control" id="phoneNumber"
                                               placeholder="Enter your phone number"
                                               value="${sessionScope.usersession.phoneNumber}">
                                    </div>
                                </div>
                                <!-- Shipping Address -->
                                <div class="col-md-6">
                                    <form class="file-upload" action="./profile" method="POST" enctype="multipart/form-data">
                                        <h4>Address</h4>
                                        <div class="mb-3">
                                            <label for="address" class="form-label">Address</label>
                                            <input type="text" name="address" class="form-control" id="address"
                                                   placeholder="Enter your Address (House Number)"
                                                   value="${sessionScope.usersession.address}">
                                        </div>
                                        <div class="mb-3">
                                            <label for="city" class="form-label">City</label>
                                            <input type="text" name="city" class="form-control" id="city"
                                                   placeholder="Enter your City"
                                                   value="${sessionScope.usersession.city}">
                                        </div>
                                        <div class="mb-3">
                                            <label for="district" class="form-label">District</label>
                                            <input type="text" name="district" class="form-control" id="district"
                                                   placeholder="Enter your District"
                                                   value="${sessionScope.usersession.district}">

                                        </div>
                                        <div class="mb-3">
                                            <label for="ward" class="form-label">Ward</label>
                                            <input type="text" name="ward" class="form-control" id="ward"
                                                   placeholder="Enter your Ward"
                                                   value="${sessionScope.usersession.ward}">
                                        </div>
                                        <div class="d-flex justify-content-end mt-4">
                                            <button type="submit" name="action" value="updateShippingAddress"
                                                    class="btn btn-success">
                                                Update Shipping Address
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>

                        </div>
                    </div>
                    <!-- Shipping Address End -->

                    <!-- Voucher Start -->
                    <div id="voucher_content" class="content">

                    </div>
                    <!-- Voucher End -->

                </div>
            </div>
        </div>

        <script src="js/profile.js"></script>

    </body>

</html>