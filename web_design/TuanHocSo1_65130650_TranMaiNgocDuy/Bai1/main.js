function dangKy(){
    var ten = document.getElementById("username").value;
    var email = document.getElementById("email").value;
    var matKhau = document.getElementById("pass1").value;
    var matKhau2 = document.getElementById("pass2").value;
    if(ten =="" &&email==""&& matKhau=="" && matKhau2==""){
        alert("Vui lòng cung cấp thông tin");
        return false;
    }
    if(ten.length<4){
        alert("Vui lòng nhập tên đăng nhập tối thiểu 4 ký tự");
        return false;
    }
    if(email==""){
        alert("Vui lòng nhập email");
        return false;
    }
    if(matKhau.length<8){
        alert("Vui lòng nhập mật khẩu tối thiểu 8 ký tự");
        return false;
    }
    if(matKhau2.length<8){
        alert("Vui lòng nhập lại mật khẩu");
        return false;
    }
    if(matKhau!=matKhau2){
        alert("Mật khẩu không khớp");
        return false;
    }
    else{
        alert("Đăng ký thành công");
        return true;
    }
}