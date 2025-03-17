import java.util.Scanner;

public class Cau48 {
  //Câu 48. Viết một phương thức đệ quy dùng để hiển thị giá trị của một số nguyên theo thứ tự đảo ngược ra màn hình, sử dụng khai báo dạng: public static void reverseDisplay(int value). Viết phương thức main để test reverseDisplay, ví dụ như khi gọi reverseDisplay(2341) thì sẽ hiển thị 1432; tất cả các phương thức trên được đặt trong lớp Cau48.
  public static void reverseDisplay(int value){
    if(value == 0) return;
    else{
      System.out.print(value%10);
      reverseDisplay(value/10);
    }
  }
  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);
    int n = scanner.nextInt();
    reverseDisplay(n);
  }
}