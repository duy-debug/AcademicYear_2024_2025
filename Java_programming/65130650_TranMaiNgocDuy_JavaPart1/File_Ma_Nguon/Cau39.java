import java.util.Scanner;

public class Cau39 {
  //Câu 39. Viết một phương thức để đổi một số nguyên dương từ hệ 16 sang hệ 10, có khai báo dạng: public static int hex2decimal(String s)
  //	Viết một phương thức để dổi một số nguyên dương từ hệ 10 sang hệ 16, có khai báo dạng: public static String decimal2hex(int d)
  //	Viết một phương thức main để test hai phương thức trên. Lưu ý: không được sử dụng phương thức Integer.parseInt(s, radix) để thực hiện chuyển đổi (phải tự viết lấy các phương thức làm chức năng tương tự).
  //	Tất cả các phương thức trên được đặt trong cùng một lớp có tên Cau39
  public static int hex2decimal(String s){
    int sum = 0;
    for(int i = 0; i < s.length(); i++){
      char c = s.charAt(i);
      int value;
      if(c >= '0' && c <= '9'){
        value = c - '0'; // chuyển '0' - '9' thành 0 - 9
      }
      else{
        value = c - 'A' + 10; // chuyển 'A' - 'F' thành 10 - 15
      }
      sum += value * (int)Math.pow(16, s.length() - i - 1);
    }
    return sum;
  }
  public static String decimal2hex(int d){
    String s = "";
    while(d != 0){
      int tem = d % 16;
      if(tem < 10){
        s = tem + s;
      }
      else{
        s = (char)(tem - 10 + 'A') + s;
      }
      d /= 16;
    }
    return s;
  }
  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);
    String s = scanner.next();
    System.out.println(hex2decimal(s));
    System.out.println(decimal2hex(47));
  }
}
