import java.util.Scanner;

public class Cau47 {
  // Phương thức thay thế tất cả chuỗi y trong x bằng chuỗi z
  public static String replace(String x, String y, String z) {
    return x.replace(y, z); // Sử dụng phương thức có sẵn của Java
  }

  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);

    // Nhập các chuỗi từ bàn phím
    System.out.println("Nhập xâu gốc (x):");
    String x = scanner.nextLine();

    System.out.println("Nhập xâu cần thay thế (y):");
    String y = scanner.nextLine();

    System.out.println("Nhập xâu thay thế (z):");
    String z = scanner.nextLine();

    // Gọi phương thức replace và in kết quả
    String result = replace(x, y, z);
    System.out.println("Xâu sau khi thay thế:");
    System.out.println(result);

    scanner.close(); // Đóng scanner
  }
}
