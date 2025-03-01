import java.util.Scanner;

public class Cau26 {
  //Câu 26. Viết một phương thức tính Ước số chung lớn nhất của hai số nguyên dương. Phương thức được khai báo dưới dạng như sau:
  //public static int uscln(int m, int n)
  //	Áp dụng phương thức vừa viết ở trên để viết phương thức tìm Bội số chung nhỏ nhất của hai số nguyên dương. Viết đoạn chương trình để test hai phương thức trên.
  public static int uscln(int m, int n){
    while(n != 0){
      int tem = n;
      n = m % n;
      m = tem;
    }
    return m;
  }
  public static int bcnn(int m, int n){
    if(uscln(m, n) == 0)
      return 0;
    else return (m * n) / uscln(m, n);
  }
  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);
    System.out.print("Nhâp a: ");
    int a = scanner.nextInt();
    System.out.print("Nhập b: ");
    int b = scanner.nextInt();
    System.out.println("ƯỚC SỐ CHUNG LỚN NHẤT CỦA HAI SỐ a và b: " + uscln(a, b));
    System.out.println("BỘI CHUNG NHỎ NHẤT CỦA HAI SỐ a và b : " + bcnn(a, b));
  }
}
