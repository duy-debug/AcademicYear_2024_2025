import java.util.Hashtable;
import java.util.Scanner;

public class Cau25 {
  //Câu 25. Viết chương trình cài đặt một danh bạ điện thoại đơn giản theo các yêu cầu sau:
  //-	Mỗi mục từ (entry) trong danh bạ bao gồm Họ tên và Số điện thoại.
  //-	Sử dụng lớp Hashtable trong gói java.util để lưu trữ các entry.
  //-	Cung cấp các phương thức để thêm một entry vào danh bạ, nhận vào Họ tên và trả lại số điện thoại, phương thức để thay đổi số điện thoại cho người có Họ tên nào đó, phương thức để xóa một entry có Họ tên nào đó được truyền vào.
  //-	Viết lớp để kiểm tra danh bạ điện thoại vừa cài đặt: hiển thị một menu chọn lựa đơn giản: 1-thêm, 2-tìm kiếm, 3-sửa đổi, 4-xóa, 5-liệt kê danh bạ, 0-thoát; máy tính sẽ thực hiện các chức năng tương ứng với chọn lựa của người dùng.
  private static Hashtable<String, String> danhBa = new Hashtable<>();
  // Thêm entry
  public static void Add(String name, String phoneNumber) {
    danhBa.put(name, phoneNumber);
    System.out.println("Đã thêm: " + name + " - " + phoneNumber);
  }
  // Tìm kiếm số điện thoại theo tên
  public static String Search(String name) {
    return danhBa.getOrDefault(name, "Không tìm tên trong danh bạ!");
  }
  // Sửa đổi số điện thoại
  public static void Edit(String name, String phoneNumber) {
    if (danhBa.containsKey(name)) {
      danhBa.put(name, phoneNumber);
      System.out.println("Sửa số điện thoại thành công!");
    } else {
      System.out.println("Không tìm thấy tên trong danh bạ!");
    }
  }
  // Xóa một entry khỏi danh bạ
  public static void DeleteEntry(String name) {
    if (danhBa.remove(name) != null) {
      System.out.println("Đã xóa " + name + " khỏi danh bạ!");
    } else {
      System.out.println("Không tìm thấy tên trong danh bạ!");
    }
  }
  // Liệt kê danh bạ
  public static void Lists() {
    if (danhBa.isEmpty()) {
      System.out.println("Danh bạ trống!");
      return;
    }
    System.out.println("Danh bạ điện thoại: ");
    danhBa.forEach((name, phoneNumber) -> System.out.println(name + " - " + phoneNumber));
  }
  public static void main(String[] args) {
    Scanner sc = new Scanner(System.in);
    int n;
    do {
      System.out.println("---------MENU DANH BẠ ĐIỆN THOẠI-------");
      System.out.println("1. Thêm tên và số điện thoại");
      System.out.println("2. Tìm kiếm số điện thoại");
      System.out.println("3. Sửa số điện thoại");
      System.out.println("4. Xóa số điện thoại");
      System.out.println("5. Liệt kê danh bạ");
      System.out.println("0. Thoát");
      n = sc.nextInt();
      sc.nextLine();
      switch (n) {
        case 1:
          System.out.print("Nhập tên: ");
          String name = sc.nextLine();
          System.out.print("Nhập số điện thoại: ");
          String phoneNumber = sc.nextLine();
          Add(name, phoneNumber);
          break;
        case 2:
          System.out.print("Nhập tên muốn tìm số điện thoại: ");
          String searchName = sc.nextLine();
          System.out.println(Search(searchName));
          break;
        case 3:
          System.out.print("Nhập tên muốn sửa số điện thoại: ");
          String name1 = sc.nextLine();
          System.out.print("Nhập số điện thoại mới: ");
          String editPhoneNumber = sc.nextLine();
          Edit(name1, editPhoneNumber);
          break;
        case 4:
          System.out.print("Nhập tên muốn xóa: ");
          String name2 = sc.nextLine();
          DeleteEntry(name2);
          break;
        case 5:
          Lists();
          break;
        case 0:
          System.out.println("Thoát chương trình!");
          break;
        default:
          System.out.println("Lựa chọn không hợp lệ, vui lòng nhập lại!");
      }
    } while (n != 0);
  }
}
