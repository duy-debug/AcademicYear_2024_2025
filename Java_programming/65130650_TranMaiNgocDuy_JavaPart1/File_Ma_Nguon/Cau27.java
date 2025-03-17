import java.util.Scanner;

public class Cau27 {
  //Câu 27. Viết một phương thức chuyển một xâu biểu số nguyên ở hệ nhị phân sang một số nguyên ở hệ thập phân. Phương thức được khai báo dưới dạng như sau:
  //public static int parseBinary(String binaryString)
  //Ví dụ, nếu gọi parseBinary(“10001”) thì sẽ trả lại giá trị là 17. Lưu ý rằng Integer.parseInt(“10001”, 2) cũng sẽ trả lại giá trị là 17, không được dùng phương thức đó trong câu hỏi này.
  public static int parrseBinary(String binary){
    int n = 0;
    for(int i = 0; i < binary.length(); i++){
      if(binary.charAt(i) == '1'){
        n = n + (int)Math.pow(2,(binary.length()-i-1));
      }
    }
    return n;
  }
  public static void main(String[] args) {
    Scanner sc = new Scanner(System.in);
    System.out.print("Nhập chuỗi nhị phân: ");
    String binary = sc.nextLine();
    System.out.println("Đổi sang hệ thập phân: " + parrseBinary(binary));
  }
}
