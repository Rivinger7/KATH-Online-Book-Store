function confirmOrder() {
    if (confirm("Are you sure you want to order? This action cannot be undone.")) {
        return true;
    } else {
        return false;
    }
}

//document.addEventListener('DOMContentLoaded', function () {
//    const cityInput = document.getElementById('city');
//    const districtInput = document.getElementById('districtInput');
//    const wardInput = document.getElementById('wardInput');
//    const addressInput = document.getElementById('addressInput');
//
//    // Set default value for district
//    const defaultDistrictValue = "${sessionScope.usersession.district}";
//    if (!defaultDistrictValue || defaultDistrictValue.trim() === '') {
//        districtInput.value = '';
//    }
//
//    // Set default value for ward
//    const defaultWardValue = "${sessionScope.usersession.ward}";
//    if (!defaultWardValue || defaultWardValue.trim() === '') {
//        wardInput.value = '';
//    }
//
//    // Set default value for address
//    const defaultAddressValue = "${sessionScope.usersession.address}";
//    if (!defaultAddressValue || defaultAddressValue.trim() === '') {
//        addressInput.value = '';
//    }
//    
//    const defaultCityValue = "${sessionScope.usersession.city}";
//    if (!defaultCityValue || defaultCityValue.trim() === '') {
//        cityInput.value = ''; // Trường hợp giá trị mặc định không tồn tại hoặc trống
//    }
//});


