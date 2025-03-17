import java.util.Scanner;

public class Cau15 {
  //Câu 15. Viết một phương thức cho chuyển một số nguyên hệ thập phân sang số hệ nhị phân được biểu diễn dưới dạng một xâu. Phương thức được khai báo dưới dạng như sau:
  //	public static String convertDecimalToBinary(int value)
  //	Viết đoạn chương trình để test phương thức trên với các giá trị: 8, 298, và 9123.
  public static void main(String[] args) {
    Scanner sc = new Scanner(System.in);
    System.out.print("Nhập n: ");
    int n = sc.nextInt();
    System.out.print("Đổi sang hệ nhị phân: " +convertDecimalToBinary(n));
  }
  public static String convertDecimalToBinary(int value) {
    String binary = "";
    while(value > 0){
      int a = value % 2;
      binary = a + binary;
      value /= 2;
    }
    return binary;
  }
}
