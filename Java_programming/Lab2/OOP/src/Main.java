public class Main {
  public static void main(String[] args) {
    Clock a = new Clock(); // tạo đối tượng thông qua hàm constructor không tham số
    System.out.println(a); // in ra màn hình
    a.setTime(1,0,0); // Thay đổi giá trị của hour, minute, second
    System.out.println(a); // in ra màn hình
    System.out.println(a.totalSeconds(1,0,0)); // in ra tổng số giây
    a.addSeconds(10); // thêm vào thời gian hiện tại s giây
    System.out.println(a); // in ra màn hình
    System.out.println("------------------------------------");
    Clocks b = new Clocks();
    System.out.println(b);
    b.setSeconds(3600);
    System.out.println(b);
    System.out.println(b.totalSeconds()); // in ra tổng số giây
    b.addSeconds(10);
    System.out.println(b);
  }
}