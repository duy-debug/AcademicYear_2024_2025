//code js
const imgs = document.querySelectorAll('.slide');
let currentSlide = 0;
function showSlide(n) {
    for (let i = 0; i < imgs.length; i++) {

        imgs[i].classList.remove ('active'); 
        if (i === n) {
            imgs[i].classList.add('active'); 
        }
    }
}
//ham chuyen anh ve phia sau
function prevSlide() {
    currentSlide = (currentSlide - 1 + imgs.length) % imgs.length;
    showSlide(currentSlide); 
}
function nextSlide() {
    currentSlide = (currentSlide + 1 ) % imgs.length; 
    showSlide(currentSlide);
}
showSlide(currentSlide);
//tự động chuyển ảnh sau mỗi 3 giây
setInterval(nextSlide, 3000);
// viet ham hien thi menu cap con
function ShowSubMenu() {
    var subMenus = document.querySelectorAll('.sub-menu');
    subMenus.forEach(function(subMenu) {
        if (subMenu.style.display === 'block') {
            subMenu.style.display = 'none';
        } else {
            subMenu.style.display = 'block';
        }
    });
}
document.querySelector('li.has-submenu>a').addEventListener('click', ShowSubMenu);

function toggleButtons(product) {
    const overlay = product.querySelector('.overlay');
    const image = product.querySelector('img');
    const isActive = overlay.style.display === 'flex';

    // Reset tất cả
    document.querySelectorAll('.overlay').forEach(o => o.style.display = 'none');
    document.querySelectorAll('.product img').forEach(img => img.style.filter = 'none');

    // Nếu chưa active thì active, còn nếu đã active thì thôi
    if (!isActive) {
        overlay.style.display = 'flex';
        image.style.filter = 'blur(2px)';
    }
}
// Hiển thị submenu khi nhấn "Sản phẩm"
// Hiển thị Modal đăng nhập
function hienThiDangNhap() {
    document.getElementById("modalDangNhap").style.display = "block";
}

// Hiển thị Modal đăng ký
function hienThiDangKy() {
    document.getElementById("modalDangKy").style.display = "block";
}

// Đóng modal khi nhấn ra ngoài
window.onclick = function(event) {
    const modalDN = document.getElementById("modalDangNhap");
    const modalDK = document.getElementById("modalDangKy");

    if (event.target == modalDN) {
        modalDN.style.display = "none";
    }
    if (event.target == modalDK) {
        modalDK.style.display = "none";
    }
}
