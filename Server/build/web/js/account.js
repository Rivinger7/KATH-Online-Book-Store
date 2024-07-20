document.addEventListener("DOMContentLoaded", function () {
    document.getElementById("login-form").style.display = "block";
    document.getElementById("register-form").style.display = "none";
    document.getElementById("forgot-password-form").style.display = "none";

});

function showRegister() {
    document.getElementById("login-form").style.display = "none";
    // document.getElementById("forgot-password-form").style.display = "none";
    document.getElementById("register-form").style.display = "block";
}

function showLogin() {
    document.getElementById("register-form").style.display = "none";
    document.getElementById("forgot-password-form").style.display = "none";
    document.getElementById("login-form").style.display = "block";
}

function showForgotPassword() {
    document.getElementById("register-form").style.display = "none";
    document.getElementById("login-form").style.display = "none";
    document.getElementById("forgot-password-form").style.display = "block";
}