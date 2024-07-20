let star = document.querySelectorAll('input');
let ratingStar = document.querySelector('#rating-value');

for (let i = 0; i < star.length; i++) {
    star[i].addEventListener('click', function () {
//        i = this.value;
//        ratingStar.innerHTML = i + " out of 5";
        ratingStar.value = this.value;

    });
}