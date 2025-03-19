public class Cau10 {
  //Câu 10. Hãy thiết kế và cài đặt một lớp tên Fan để biểu diễn cho một chiếc quạt như sau:
  //-	Có ba hằng số tên SLOW, MEDIUM, FAST với giá trị tương ứng là 1, 2, và 3 chỉ tốc độ của quạt.
  //-	Một biến nguyên tên speed để lưu giữ tốc độ hiện tại của quạt (mặc định là SLOW).
  //-	Một biến kiểu logic tên on để lưu giữ trạng thái bật/tắt của quạt (mặc định là tắt).
  //-	Một biến kiểu số thực tên radius để chỉ bán kính của cánh quạt (mặc định là 5)
  //-	Một biến kiểu chuỗi tên là color để chỉ màu sắc của chiếc quạt (mặc định là blue).
  //-	Một phương thức khởi tạo không tham số để tạo một chiếc quạt với các thuộc tính mặc định.
  //-	Các phương thức để lấy và đặt giá trị của tất cả các trường thuộc tính.
  //-	Một phương thức tên là toString() trả lại một xâu mô tả về chiếc quạt.
  //  Nếu chiếc quạt đang được bật, phương thức này sẽ trả về tốc độ, màu sắc, và bán kính dưới dạng một xâu kết hợp.
  //  Nếu chiếc quạt không được bật, phương thức trả về màu sắc và bán kính cùng với xâu “fan is off” dưới dạng một xâu kết hợp.
  //  Viết một chương trình để kiểm tra lớp Fan vừa cài đặt trong đó tạo ra hai đối tượng thuộc lớp Fan.
  //  Gán tốc độ tối đa, bán kính là 10, màu sắc là yellow, và ở trạng thái bật/true cho đối tượng thứ nhất.
  //  Gán tốc độ trung bình, bán kính là 5, màu sắc là white, và ở trạng thái tắt/false cho đối tượng thứ hai.
  //  Hiển thị thông tin mô tả các đối tượng bằng cách triệu gọi các phương thức toString() của chúng.
  public static void main(String[] args) {
    Fan f1 = new Fan();
    Fan f2 = new Fan();
    f1 = new Fan(3,true,10,"yellow");
    f2 = new Fan(2,false,5,"while");
    System.out.println(f1.toString());
    System.out.println(f2.toString());
  }
  public static class Fan{
    final int Slow = 1;
    final int Medium = 2;
    final int Fast = 3;
    private int speed;
    private boolean on;
    private double radius;
    private String color;
    public Fan(int speed, boolean on, double radius, String color) {
      this.speed = speed;
      this.on = on;
      this.radius = radius;
      this.color = color;
    }
    public Fan(){
      speed = Slow;
      on = false;
      radius = 5;
      color = "blue";
    }

    public int getSpeed() {
      return speed;
    }

    public void setSpeed(int speed) {
      this.speed = speed;
    }

    public boolean isOn() {
      return on;
    }

    public void setOn(boolean on) {
      this.on = on;
    }

    public double getRadius() {
      return radius;
    }

    public void setRadius(double radius) {
      this.radius = radius;
    }

    public String getColor() {
      return color;
    }

    public void setColor(String color) {
      this.color = color;
    }
    @Override
    public String toString() {
      if(isOn() == true){
        return "speed= " + speed + ", color=" + color + ", radius= " + radius ;
      }
      else{
        return  "color= " + color + ", radius= " + radius + " fan is off";
      }
    }
  }
}
