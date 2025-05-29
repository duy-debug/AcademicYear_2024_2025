function Reset(){
    document.getElementById("a").value = null;
    document.getElementById("b").value = null;
    document.getElementById("kq").value = null;
    document.getElementById("log").innerText="";
}
// Hàm kiểm tra các giá trị có phải là số hay không
function check(a,b,c){
    // c là số
    if(isNaN(c) == false){
        document.getElementById("kq").value = c;
        document.getElementById("log").innerText="";
    }
    else{
        // kiểm tra xem a va b không phải là số
        if(isNaN(a) == true && isNaN(b) == true){
            document.getElementById("log").innerText="Vui lòng nhập a và b ở dạng số!";
            document.getElementById("a").value = null;
            document.getElementById("b").value = null;
            document.getElementById("kq").value = null;
        }
        else{
            // kiểm tra xem a không phải là số
            if(isNaN(a) == true){
                document.getElementById("log").innerText="Vui lòng nhập a ở dạng số!";
                document.getElementById("a").value = null;
                document.getElementById("kq").value = null;
            }
            // kiểm tra xem b không phải là số
            else if(isNaN(b) == true){
                document.getElementById("log").innerText="Vui lòng nhập b ở dạng số!";
                document.getElementById("b").value = null;
                document.getElementById("kq").value = null;
            }
        }
    }
}
// Hàm tính tổng
function Sum(){
    var a = document.getElementById("a").value;
    var b = document.getElementById("b").value;
    var s = parseFloat(a) + parseFloat(b);
    check(a,b,s);
}
// Hàm tính hiệu
function Sub(){
    var a = document.getElementById("a").value;
    var b = document.getElementById("b").value;
    var h = parseFloat(a) - parseFloat(b);
    check(a,b,h);
}
// Hàm tính tích
function Multi(){
    var a = document.getElementById("a").value;
    var b = document.getElementById("b").value;
    var t = parseFloat(a) * parseFloat(b);
    check(a,b,t);
}
// Hàm tính thương
function Div(){
    var a = document.getElementById("a").value;
    var b = document.getElementById("b").value;
    if(b == 0){
        document.getElementById("log").innerText="Vui lòng nhập b khác 0!";
        document.getElementById("b").value = null;
        document.getElementById("kq").value = null;
    }
    else{
        var k = parseFloat(a) / parseFloat(b);
        check(a,b,k);
    }
}