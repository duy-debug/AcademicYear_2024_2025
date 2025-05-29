function dangnhap() {
    const username = document.getElementById("username").value.trim();
    const password = document.getElementById("password").value.trim();

    if (username === "") {
        alert("Vui lòng nhập tên đăng nhập.");
        return false;
    }

    if (password === "") {
        alert("Vui lòng nhập mật khẩu.");
        return false;
    }

    alert("Đăng nhập thành công");
    return true; 
}
function chuyenSangDangKy() {
    window.location.href = "bai2.html"; 
}
document.addEventListener("DOMContentLoaded", function () {
    const eye = document.querySelector(".icon.password");
    const password = document.getElementById("password");

    eye.onclick = function () {
        if (password.type === "password") {
            password.type = "text";
            eye.innerHTML = '<i class="fas fa-eye"></i>';
        } else {
            password.type = "password";
            eye.innerHTML = '<i class="fas fa-eye-slash"></i>';
        }
    };
});

