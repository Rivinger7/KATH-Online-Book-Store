var literature = document.getElementById('literature_option');
var foreign = document.getElementById('foreign_option');
var economic = document.getElementById('economic_option');
var children = document.getElementById('children_option');
var other = document.getElementById('other_option');
// New Book
var new1 = document.getElementById('new1_option');
var new2 = document.getElementById('new2_option');
var new3 = document.getElementById('new3_option');
var new4 = document.getElementById('new4_option');
var new5 = document.getElementById('new5_option');

// Best Publisher
// var NXB_Tre = document.getElementById('NXB-Tre_option');
// var Alpha_Book = document.getElementById('Alpha-Book_option');
// var Phu_Nu = document.getElementById('Phu-Nu_option');
// var Sakura_Light_Novel = document.getElementById('Sakura-Light-Novel_option');

// Content Var Start

var literature_content = document.getElementById('literature_content');
var foreign_content = document.getElementById('foreign_content');
var economic_content = document.getElementById('economic_content');
var children_content = document.getElementById('children_content');
var other_content = document.getElementById('other_content');
// New Book
var new1_content = document.getElementById('new1_content');
var new2_content = document.getElementById('new2_content');
var new3_content = document.getElementById('new3_content');
var new4_content = document.getElementById('new4_content');
var new5_content = document.getElementById('new5_content');

// Best Publisher
var NXB_Tre_content = document.getElementById('NXB-Tre_content');
var Alpha_Book_content = document.getElementById('Alpha-Book_content');
var Phu_Nu_content = document.getElementById('Phu-Nu_content');
// var Sakura_Light_Novel_content = document.getElementById('Sakura-Light-Novel_content');

// Content Var End

literature_content.classList.add('active');
new1_content.classList.add('active');
// NXB_Tre_content.classList.add('active');

literature.addEventListener('click', function () {
    displayContent(literature, literature_content);
});
foreign.addEventListener('click', function () {
    displayContent(foreign, foreign_content);
});
economic.addEventListener('click', function () {
    displayContent(economic, economic_content);
});
children.addEventListener('click', function () {
    displayContent(children, children_content);
});
other.addEventListener('click', function () {
    displayContent(other, other_content);
});

// Testing Start
new1.addEventListener('click', function () {
    displayContentNeww(new1, new1_content);
});

new2.addEventListener('click', function () {
    displayContentNeww(new2, new2_content);
});

new3.addEventListener('click', function () {
    displayContentNeww(new3, new3_content);
});

new4.addEventListener('click', function () {
    displayContentNeww(new4, new4_content);
});

new5.addEventListener('click', function () {
    displayContentNeww(new5, new5_content);
});

// Best Publisher

// NXB_Tre.addEventListener('click', function () {
//     displayContentBestPublisher(NXB_Tre, NXB_Tre_content);
// });

// Alpha_Book.addEventListener('click', function () {
//     displayContentBestPublisher(Alpha_Book, Alpha_Book_content);
// });

// Phu_Nu.addEventListener('click', function () {
//     displayContentBestPublisher(Phu_Nu, Phu_Nu_content);
// });

// Sakura_Light_Novel.addEventListener('click', function () {
//     displayContentBestPublisher(Sakura_Light_Novel, Sakura_Light_Novel_content);
// });

// Testing


// Buttons for all
// function displayContent(button, content) {
//     var allButtons = document.querySelectorAll('.button');
//     var allContents = document.querySelectorAll('.content');
//     allButtons.forEach(function(element) {
//         element.classList.remove('active');
//     });
//     allContents.forEach(function(element) {
//         element.classList.remove('active');
//     });
//     button.classList.add('active');
//     content.classList.add('active');
// }

function displayContent(button, content) {
    var allButtons = document.querySelectorAll('.button-option-normal');
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

function displayContentNeww(button, content) {
    var allButtons = document.querySelectorAll('.button-option-owl');
    var allContents = document.querySelectorAll('.owl-content');
    allButtons.forEach(function (element) {
        element.classList.remove('active');
    });
    allContents.forEach(function (element) {
        element.classList.remove('active');
    });
    button.classList.add('active');
    content.classList.add('active');
}

function displayContentBestPublisher(button, content) {
    var allButtons = document.querySelectorAll('.button-option-publisher');
    var allContents = document.querySelectorAll('.publisher-content');
    allButtons.forEach(function (element) {
        element.classList.remove('active');
    });
    allContents.forEach(function (element) {
        element.classList.remove('active');
    });
    button.classList.add('active');
    content.classList.add('active');
}
;

document.addEventListener('DOMContentLoaded', function () {

    var bookPairs = [
        // Literature Content
        {
            books: document.querySelectorAll('#literature_content .content-first .first-best-book'),
            detail: document.getElementById('first-book-detail-literature')
        },
        {
            books: document.querySelectorAll('#literature_content .content-first .second-best-book'),
            detail: document.getElementById('second-book-detail-literature')
        },
        {
            books: document.querySelectorAll('#literature_content .content-first .third-best-book'),
            detail: document.getElementById('third-book-detail-literature')
        },
        {
            books: document.querySelectorAll('#literature_content .content-first .fourth-best-book'),
            detail: document.getElementById('fourth-book-detail-literature')
        },
        {
            books: document.querySelectorAll('#literature_content .content-first .fifth-best-book'),
            detail: document.getElementById('fifth-book-detail-literature')
        },

        // Foregin Content
        {
            books: document.querySelectorAll('#foreign_content .content-first .first-best-book'),
            detail: document.getElementById('first-book-detail-foreign')
        },
        {
            books: document.querySelectorAll('#foreign_content .content-first .second-best-book'),
            detail: document.getElementById('second-book-detail-foreign')
        },
        {
            books: document.querySelectorAll('#foreign_content .content-first .third-best-book'),
            detail: document.getElementById('third-book-detail-foreign')
        },
        {
            books: document.querySelectorAll('#foreign_content .content-first .fourth-best-book'),
            detail: document.getElementById('fourth-book-detail-foreign')
        },
        {
            books: document.querySelectorAll('#foreign_content .content-first .fifth-best-book'),
            detail: document.getElementById('fifth-book-detail-foreign')
        },

        // Economic Content
        {
            books: document.querySelectorAll('#economic_content .content-first .first-best-book'),
            detail: document.getElementById('first-book-detail-economic')
        },
        {
            books: document.querySelectorAll('#economic_content .content-first .second-best-book'),
            detail: document.getElementById('second-book-detail-economic')
        },
        {
            books: document.querySelectorAll('#economic_content .content-first .third-best-book'),
            detail: document.getElementById('third-book-detail-economic')
        },
        {
            books: document.querySelectorAll('#economic_content .content-first .fourth-best-book'),
            detail: document.getElementById('fourth-book-detail-economic')
        },
        {
            books: document.querySelectorAll('#economic_content .content-first .fifth-best-book'),
            detail: document.getElementById('fifth-book-detail-economic')
        },

        // Children Content
        {
            books: document.querySelectorAll('#children_content .content-first .first-best-book'),
            detail: document.getElementById('first-book-detail-children')
        },
        {
            books: document.querySelectorAll('#children_content .content-first .second-best-book'),
            detail: document.getElementById('second-book-detail-children')
        },
        {
            books: document.querySelectorAll('#children_content .content-first .third-best-book'),
            detail: document.getElementById('third-book-detail-children')
        },
        {
            books: document.querySelectorAll('#children_content .content-first .fourth-best-book'),
            detail: document.getElementById('fourth-book-detail-children')
        },
        {
            books: document.querySelectorAll('#children_content .content-first .fifth-best-book'),
            detail: document.getElementById('fifth-book-detail-children')
        },

        // Other Content
        {
            books: document.querySelectorAll('#other_content .content-first .first-best-book'),
            detail: document.getElementById('first-book-detail-other')
        },
        {
            books: document.querySelectorAll('#other_content .content-first .second-best-book'),
            detail: document.getElementById('second-book-detail-other')
        },
        {
            books: document.querySelectorAll('#other_content .content-first .third-best-book'),
            detail: document.getElementById('third-book-detail-other')
        },
        {
            books: document.querySelectorAll('#other_content .content-first .fourth-best-book'),
            detail: document.getElementById('fourth-book-detail-other')
        },
        {
            books: document.querySelectorAll('#other_content .content-first .fifth-best-book'),
            detail: document.getElementById('fifth-book-detail-other')
        }
    ];

    bookPairs.forEach(pair => {
        pair.detail.style.display = 'none';
        displayBookDetail(pair.books, pair.detail);
    });
});

function displayBookDetail() {
    const books = document.querySelectorAll('.content-first a');
    const bookDetails = document.querySelectorAll('.book-detail');

    bookDetails.forEach(detail => {
        detail.style.display = 'none';
    });

    books.forEach((book, index) => {
        book.addEventListener('mouseenter', () => {
            bookDetails.forEach(detail => {
                detail.style.display = 'none';
            });

            if (bookDetails[index]) {
                bookDetails[index].style.display = 'flex'; // Sử dụng 'block' hoặc 'flex' tùy thuộc vào layout của bạn
            }
        });
    });
}

document.addEventListener('DOMContentLoaded', displayBookDetail);


// First Book Detail
// document.addEventListener('DOMContentLoaded', function () {

//     firstBookDetail.style.display = 'none';

//     firstBestBook.forEach((link, index) => {
//         link.addEventListener('mouseenter', () => {
//             firstBookDetail.style.display = 'flex';
//         });

//         link.addEventListener('mouseleave', () => {
//             firstBookDetail.style.display = 'none';
//         });
//     });
// });

// Second Book Detail
// document.addEventListener('DOMContentLoaded', function () {

//     secondBookDetail.style.display = 'none';

//     secondBestBook.forEach((link, index) => {
//         link.addEventListener('mouseenter', () => {
//             secondBookDetail.style.display = 'flex';
//         });

//         link.addEventListener('mouseleave', () => {
//             secondBookDetail.style.display = 'none';
//         });
//     });
// });

// Third Book Detail
// document.addEventListener('DOMContentLoaded', function () {

//     thirdBookDetail.style.display = 'none';

//     thirdBestBook.forEach((link, index) => {
//         link.addEventListener('mouseenter', () => {
//             thirdBookDetail.style.display = 'flex';
//         });

//         link.addEventListener('mouseleave', () => {
//             thirdBookDetail.style.display = 'none';
//         });
//     });
// });

// Fourth Book Detail
// document.addEventListener('DOMContentLoaded', function () {

//     fourthBookDetail.style.display = 'none';

//     fourthBestBook.forEach((link, index) => {
//         link.addEventListener('mouseenter', () => {
//             fourthBookDetail.style.display = 'flex';
//         });

//         link.addEventListener('mouseleave', () => {
//             fourthBookDetail.style.display = 'none';
//         });
//     });
// });

// Fifth Book Detail
// document.addEventListener('DOMContentLoaded', function () {

//     fifthBookDetail.style.display = 'none';

//     fifthBestBook.forEach((link, index) => {
//         link.addEventListener('mouseenter', () => {
//             fifthBookDetail.style.display = 'flex';
//         });

//         link.addEventListener('mouseleave', () => {
//             fifthBookDetail.style.display = 'none';
//         });
//     });
// });

// Display the book details End