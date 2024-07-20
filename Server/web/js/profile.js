// Navigation Header
var profile = document.getElementById('profile_option');
var myOrder = document.getElementById('my-order_option');
var shipping_address = document.getElementById('shipping-address_option');
var voucher = document.getElementById('voucher_option');

var profile_content = document.getElementById('profile_content');
var myOrder_content = document.getElementById('my-order_content');
var shipping_address_content = document.getElementById('shipping-address_content');
var voucher_content = document.getElementById('voucher_content');

profile.addEventListener('click', function () {
    displayContent(profile, profile_content);
});

myOrder.addEventListener('click', function () {
    displayContent(myOrder, myOrder_content);
});

shipping_address.addEventListener('click', function () {
    displayContent(shipping_address, shipping_address_content);
});

voucher.addEventListener('click', function () {
    displayContent(voucher, voucher_content);
});

function displayContent(button, content) {
    var allButtons = document.querySelectorAll('.button');
    var allContents = document.querySelectorAll('.content');
    allButtons.forEach(function (element) {
        element.classList.remove('active');
    });
    allContents.forEach(function (element) {
        element.classList.remove('active');
    });
    button.classList.add('active');
    content.classList.add('active');
}

// Order Details Button
document.addEventListener('DOMContentLoaded', function () {
    let order_btns = document.querySelectorAll('.order-detail-button');
    let banner_contents = document.querySelectorAll('.order-detail-content');

    order_btns.forEach(function (button, index) {
        button.addEventListener('click', function () {
            if (banner_contents[index].classList.contains('open')) {
                button.classList.remove('open');
                banner_contents[index].classList.remove('open');
            } else {
                displayHistoryOrder(button, banner_contents[index]);
            }
        });
    });
});

function displayHistoryOrder(button, content) {
    var allButtons = document.querySelectorAll('.order-detail-button');
    var allContents = document.querySelectorAll('.order-detail-content');

    allButtons.forEach(function (button) {
        button.classList.remove('open');
    });
    allContents.forEach(function (content) {
        content.classList.remove('open');
    });
    content.classList.add('open');
    button.classList.add('open');
}



// Update Profile
function updateFirstNameValue(input) {
    // Lấy giá trị mới từ người dùng nhập vào
    var newFirstNameValue = input.value;

    // Cập nhật giá trị mới cho input email trong trường hợp người dùng nhập vào
    input.setAttribute("value", newFirstNameValue);
}

function updateLastNameValue(input) {
    // Lấy giá trị mới từ người dùng nhập vào
    var newLastNameValue = input.value;

    sessionScope.usersession.firstName = newFirstNameValue;


    // Cập nhật giá trị mới cho input email trong trường hợp người dùng nhập vào
    input.setAttribute("value", newLastNameValue);
}

function updatePhoneNumberValue(input) {
    // Lấy giá trị mới từ người dùng nhập vào
    var newPhoneNumberValue = input.value;

    sessionScope.usersession.lastName = newLastNameValue;

    // Cập nhật giá trị mới cho input email trong trường hợp người dùng nhập vào
    input.setAttribute("value", newPhoneNumberValue);
}

function updateEmailValue(input) {
    // Lấy giá trị mới từ người dùng nhập vào
    var newEmailValue = input.value;

    // Cập nhật giá trị mới cho input email trong trường hợp người dùng nhập vào
    input.setAttribute("value", newEmailValue);
}

function confirmDeleteAccount() {
    if (confirm("Are you sure you want to delete your account? This action cannot be undone.")) {
        return true;
    } else {
        return false;
    }
}
