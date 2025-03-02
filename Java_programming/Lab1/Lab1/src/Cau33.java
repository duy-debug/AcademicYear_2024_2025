import java.util.Scanner;

public class Cau33 {
  //Câu 33. Một chuỗi được gọi là palindrom nếu như đọc xuôi hay ngược chuỗi đó đều giống như nhau, ví dụ như: “mom”, “dad”, “noon”. Viết chương trình cho phép nhập vào một chuỗi và thông báo kết quả ra màn hình là chuỗi đó có phải là palindrom hay không với yêu cầu là không phân biệt ký tự hoa hay thường.
  public static void main(String[] args) {
  Scanner sc = new Scanner(System.in);
  String str;
  System.out.print("Nhập vào một chuỗi: ");
  str = sc.nextLine();
  str = str.toLowerCase();
  for (int i = 0; i < str.length()/2; i++) {
      if(str.charAt(i)!=str.charAt(str.length()-i-1)){
        System.out.println("Chuỗi không phải Palindrom1");
        return;
      }
    }
  System.out.println("Chuỗi này là Palindrom");
  }
}
