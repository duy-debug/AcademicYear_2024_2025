const imgs = document.querySelectorAll('.slide');
//imgs[0] -> imgs[i] ==> classList add / remove
let currentSlide = 0;
// vitri la vi tri cua hanh anh duoc hien thi
function ShowSlide(vitri){
    for(let i=0; i<imgs.length; i++){
      // ẩn toàn bộ ảnh
        imgs[i].classList.remove('active');
        // hiển thị ảnh tại vị trí muốn hiển thị
        if(i == vitri){
            imgs[i].classList.add('active');
        }
    }
}
// hàm chuyển ảnh về phía sau
function prevSlide(){
  // dang co số lượng ảnh là 3
  // ví dụ ta đang đứng ở ảnh thứ 0 ->(0-1+3)%3 = 2
  //(currentSlide-1+số lượng ảnh) % số lượng ảnh
  currentSlide = (currentSlide + 1) % imgs.length;
  // sau khi lấy được vị trí ảnh cần hiển thị currentSlide -> Show ảnh này lên
  ShowSlide(currentSlide);
}
function nextSlide(){
  // dang co số lượng ảnh là 3
  // ví dụ ta đang đứng ở ảnh thứ 0 ->(0-1+3)%3 = 2
  //(currentSlide-1+số lượng ảnh) % số lượng ảnh
  currentSlide = (currentSlide + 1) % imgs.length;
  // sau khi lấy được vị trí ảnh cần hiển thị currentSlide -> Show ảnh này lên
  ShowSlide(currentSlide);
}
ShowSlide(currentSlide);
setInterval(nextSlide, 3000);
// viết hàm thiển hị menu cấp con
function ShowSubmenu(){
  // tìm đến thẻ li gần nhất được click (tức là vừa được người dùng click)
  const li = target.clo
}