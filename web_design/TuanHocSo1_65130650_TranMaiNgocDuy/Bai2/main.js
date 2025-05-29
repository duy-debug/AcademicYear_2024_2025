function dangNhap(){
    var taiKhoan = document.getElementById("username").value;
    var matKhau = document.getElementById("pass1").value;
    if(taiKhoan == "" || matKhau == ""){
        alert("Vui lòng nhập đầy đủ thông tin");
    }
    else if(taiKhoan == "duytran" && matKhau == "12345678"){
        alert("Đăng nhập thành công");
        window.location.href = "index.html";
    }
    else{
        alert("Đăng nhập thất bại");
    }
}