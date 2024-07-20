function handleKeyDown(event, input, bookID) {
    if (event.key === 'Enter') {
        event.preventDefault(); // Ngăn chặn hành động mặc định của phím Enter (tránh việc gửi dữ liệu mặc định)
        updateValue(input); // Gọi hàm updateValue để cập nhật giá trị
        // Sau đó, bạn có thể gửi dữ liệu đến servlet tại đây
        // Ví dụ: window.location.href = 'your_servlet_url?quantity=' + input.value;
        var quantity = input.value;
        redirectToShoppingCart(bookID, quantity);
    }
}

function updateValue(input) {
    if (input.value.trim() === '' || parseInt(input.value) < 0) {
        input.value = '1';
    } else {
        // Cập nhật giá trị của thuộc tính value
        input.setAttribute('value', input.value);
    }
}

function redirectToShoppingCart(bookID, quantity) {
    // Chuyển hướng trang và truyền tham số bookID và quantity trong URL
    window.location.href = './shopping_cart?bookID=' + bookID + '&quantity=' + quantity;
}


