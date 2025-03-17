import java.util.Scanner;
public class Cau6 {

  //Câu 6. Viết chương trình cho phép nhập ba số nguyên từ bàn phím và lưu vào ba biến tương ứng là num1, num2, num3. Chương trình sẽ sắp xếp ba số đó theo thứ tự num1 <=  num2 <= num3 và xuất kết quả ra màn hình.
  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);
    // Nhập ba số nguyên
    System.out.print("Nhập số thứ nhất: ");
    int num1 = scanner.nextInt();
    System.out.print("Nhập số thứ hai: ");
    int num2 = scanner.nextInt();
    System.out.print("Nhập số thứ ba: ");
    int num3 = scanner.nextInt();
    // Sắp xếp theo thứ tự tăng dần
    if(num1 < num2 && num1 < num3){
      if (num2>num3){
        int tem=num2;
        num2=num3;
        num3=tem;
      }
    }
    if(num2 < num1 && num2 < num3){
      int tem=num1;
      num1=num2;
      num2=tem;
      if(num2>num3){
        int tem1=num2;
        num2=num3;
        num3=tem1;
      }
    }
    if(num3<num1 && num3 < num2){
      int tem=num1;
      num1=num3;
      num3=tem;
      if(num2>num3){
        int tem1=num2;
        num2=num3;
        num3=tem1;
      }
    }
    // Xuất kết quả
    System.out.println("Ba số sau khi sắp xếp: " + num1 + " <= " + num2 + " <= " + num3);
  }
}