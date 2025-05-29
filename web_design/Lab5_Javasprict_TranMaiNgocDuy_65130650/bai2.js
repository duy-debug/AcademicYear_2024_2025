function dangky() {
    const username = document.getElementById("username").value.trim();
    const email = document.getElementById("email").value.trim();
    const password = document.getElementById("password").value.trim();
    const repassword = document.getElementById("repassword").value.trim();
   
    // Kiểm tra bỏ trống
    if (!username || !email || !password || !repassword) {
        alert("Vui lòng không bỏ trống thông tin nào.");
        return false;
    }
    // Kiểm tra độ dài tên đăng nhập
    if (username.length < 4) {
        alert("Tên đăng nhập phải dài ít nhất 4 ký tự.");
        return false;
    }
    // Regex kiểm tra cú pháp email
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    // Kiểm tra định dạng email
    if (!emailRegex.test(email)) {
        alert("Email không đúng định dạng.");
        return false;
    }

    // Kiểm tra độ dài mật khẩu
    if (password.length < 8) {
        alert("Mật khẩu phải có ít nhất 8 ký tự.");
        return false;
    }

    // Kiểm tra mật khẩu nhập lại
    if (password !== repassword) {
        alert("Mật khẩu nhập lại không khớp.");
        return false;
    }

    alert("Chúc mừng bạn đăng ký thành công!");
    return true;
}
