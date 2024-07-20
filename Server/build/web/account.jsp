<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>

        <link rel="stylesheet" href="css/account.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    </head>

    <body>
        <section id="container" class="vh-100">
            <div class="container-fluid h-custom">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-md-9 col-lg-6 col-xl-5">
                        <a href="./homepage">
                            <img src="images/header_image/KATH_label.png" class="img-fluid" alt="Sample image">
                        </a>
                    </div>


                    <!-- Login -->
                    <div id="login-form" class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
                        <form action="./login" method="post">
                            <div class="d-flex flex-row align-items-center justify-content-center justify-content-lg-start">
                                <p class="lead fw-normal mb-0 me-3">Login with</p>
                                <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile &redirect_uri=http://localhost:8080/server/google_login&response_type=code
                                   &client_id=184865787602-fk1acjjmovuleg2r4i7dabhs6k1bk6lo.apps.googleusercontent.com&approval_prompt=force" class="btn btn-primary btn-floating mx-1">
                                    <i class="fab fa-google">
                                    </i>
                                </a>

<!--                                <button type="button" class="btn btn-primary btn-floating mx-1">
                                    <i class="fab fa-facebook-f"></i>
                                </button>-->

<!--                                <button type="button" class="btn btn-primary btn-floating mx-1">
                                    <i class="fab fa-linkedin-in"></i>
                                </button>-->
                            </div>

                            <div class="divider d-flex align-items-center my-4">
                                <p class="text-center fw-bold mx-3 mb-0">Or</p>
                            </div>

                            <!-- Username input -->
                            <c:if test="${requestScope.errorMessage != null}">
                                <div class="alert alert-danger" role="alert">
                                    ${requestScope.errorMessage}
                                </div>
                            </c:if>
                            <c:if test="${requestScope.status != null}">
                                <div class="alert alert-danger" role="alert">
                                    ${requestScope.status}
                                </div>
                            </c:if>
                            <div class="form-outline mb-4">
                                <input name="username" type="text" id="" class="form-control form-control-lg"
                                       placeholder="Enter a valid username"
                                       value="${sessionScope.usernameRememberMe}"/>
                                <label class="ms-2 fs-5 form-label" for="">Username</label>
                            </div>

                            <!-- Password input -->
                            <div class="form-outline mb-3">
                                <input name="password" type="password" id="form3Example4" class="form-control form-control-lg"
                                       placeholder="Enter password"
                                       value="${sessionScope.passwordRememberMe}"/>
                                <label class="ms-2 fs-5 form-label" for="">Password</label>
                            </div>

                            <div class="d-flex justify-content-between align-items-center">
                                <!-- Checkbox -->
                                <div class="form-check mb-0">
                                    <input class="form-check-input me-2" name="rememberMe" type="checkbox" value="1" id="rememberMe"/>
                                    <label class="fs-0 form-check-label" for="rememberMe">
                                        Remember me
                                    </label>
                                </div>
                                <a href="#forgot_password" onclick="showForgotPassword()" class="text-body">Forgot password?</a>
                            </div>

                            <div class="text-center text-lg-start mt-4 pt-2">
                                <button type="submit" value="Login" class="btn btn-primary btn-lg"
                                        style="padding-left: 2.5rem; padding-right: 2.5rem;">Login</button>
                                <p class="medium fw-bold mt-2 pt-1 mb-0">Don't have an account? <a href="#register"
                                                                                                   onclick="showRegister()" class=" link-danger">Register</a></p>
                            </div>

                        </form>
                    </div>


                    <!-- Forgot Password -->
                    <div id="forgot-password-form" class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
                        <form action="./forgot_password" method="POST">
                            <!-- Phone Number input -->
                            <!--                            <div class="form-outline">
                                                            <input type="text" class="form-control form-control-lg"
                                                                   placeholder="Enter your phone number" />
                                                            <label class="ms-2 fs-5 form-label" for="">Phone Number</label>
                                                        </div>-->

                            <!--                            <div class="divider d-flex align-items-center mb-4">
                                                            <p class="text-center fw-bold mx-3 mb-0">Or</p>
                                                        </div>-->

                            <!-- Detail reset password -->
                            <div class="forgot">
                                <h2>Forgot your password?</h2>
                                <p>Change your password in three easy steps. This will help you
                                    to secure your password!</p>
                                <ol class="list-unstyled">
                                    <li><span class="text-primary text-medium">1. </span>Enter
                                        your email address below.</li>
                                    <li><span class="text-primary text-medium">2. </span>Our
                                        system will send you an OTP to your email</li>
                                    <li><span class="text-primary text-medium">3. </span>Enter the OTP on the 
                                        next page</li>
                                </ol>
                            </div>

                            <!-- Email input -->
                            <div class="form-outline mb-4">
                                <label class="ms-2 fs-5 form-label" for="">Email</label>
                                <input type="email" name="email" class="form-control form-control-lg"
                                       placeholder="Enter your email address" required=""/>
                            </div>

                            <div class="text-center text-lg-start mt-4 pt-2">
                                <button type="submit" class="btn btn-danger"
                                        style="padding-left: 2.5rem; padding-right: 2.5rem;">Reset Password</button>
                                <p class="medium fw-bold mt-2 pt-1 mb-0">Already have an account? <a href="#!"
                                                                                                     onclick="showLogin()" class="link-danger">Login</a></p>
                            </div>

                        </form>
                    </div>

                    <!-- Register -->
                    <div id="register-form" class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
                        <form action="./register" method="post">
                            <div class="d-flex flex-row align-items-center justify-content-center justify-content-lg-start">
                                <p class="lead fw-normal mb-0 me-3">Login with</p>
                                <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile &redirect_uri=http://localhost:8080/server/google_login&response_type=code
                                   &client_id=184865787602-fk1acjjmovuleg2r4i7dabhs6k1bk6lo.apps.googleusercontent.com&approval_prompt=force" class="btn btn-primary btn-floating mx-1">
                                    <i class="fab fa-google">
                                    </i>
                                </a>

<!--                                <button type="button" class="btn btn-primary btn-floating mx-1">
                                    <i class="fab fa-twitter"></i>
                                </button>-->

<!--                                <button type="button" class="btn btn-primary btn-floating mx-1">
                                    <i class="fab fa-linkedin-in"></i>
                                </button>-->
                            </div>

                            <div class="divider d-flex align-items-center my-4">
                                <p class="text-center fw-bold mx-3 mb-0">Or</p>
                            </div>

                            <!-- First Name & Last Name -->
                            <c:if test="${requestScope.registerErrorMessage != null}">
                                <div class="alert alert-danger" role="alert">
                                    ${requestScope.errorMessage}
                                </div>
                            </c:if>
                            <div class="row mb-4">
                                <div class="col">
                                    <input name="firstName" type="text" class="form-control form-control-lg" placeholder="First name" required="">
                                    <label for="" class="ms-2 fs-5">First Name</label>
                                </div>
                                <div class="col">
                                    <input name="lastName" type="text" class="form-control form-control-lg" placeholder="Last name" required="">
                                    <label for="" class="ms-2 fs-5">Last Name</label>
                                </div>
                            </div>

                            <!-- Email & Phone Number input -->
                            <div class="row mb-4">
                                <div class="col">
                                    <input name="email" type="email" class="form-control form-control-lg"
                                           placeholder="Enter a valid email address" required="">
                                    <label for="" class="ms-2 fs-5">Email</label>
                                </div>
                                <div class="col">
                                    <input name="phoneNumber" type="text" class="form-control form-control-lg"
                                           placeholder="Enter a phone number" required="">
                                    <label for="" class="ms-2 fs-5">Phone Number</label>
                                </div>
                            </div>

                            <!-- Username input -->
                            <div class="form-outline mb-4">
                                <input name="username" type="text" class="form-control form-control-lg"
                                       placeholder="Enter a valid username" required=""/>
                                <label class="ms-2 fs-5 form-label" for="">Username</label>
                            </div>

                            <!-- Password input -->
                            <div class="form-outline mb-4">
                                <input name="password" type="password" class="form-control form-control-lg" placeholder="Enter password" required="" />
                                <label class="ms-2 fs-5 form-label" for="">Password</label>
                            </div>

                            <!-- Confirm Password input -->
                            <div class="form-outline">
                                <input name="passwordConfirmed" type="password" id="" class="form-control form-control-lg"
                                       placeholder="Confirm password" required=""/>
                                <label class="ms-2 fs-5 form-label" for="">Confirm Password</label>
                            </div>



                            <div class="text-center text-lg-start mt-4 pt-2">
                                <button type="submit" class="btn btn-primary btn-lg"
                                        style="padding-left: 2.5rem; padding-right: 2.5rem;">Register</button>
                                <p class="medium fw-bold mt-2 pt-1 mb-0">Already have an account? <a href="#login"
                                                                                                     onclick="showLogin()" class="link-danger">Login</a></p>
                            </div>

                        </form>
                    </div>


                </div>
            </div>
        </section>
        <script src="js/account.js"></script>
    </body>

</html>