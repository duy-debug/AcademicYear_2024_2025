import java.util.Scanner;

public class Cau20 {
  //Câu 20. Viết một phương thức để tìm số lần xuất hiện của một ký tự trong một xâu. Phương thức được khai báo dưới dạng như sau:
  //public static int count(String str, char a)
  //Ví dụ, nếu gọi phương thức count(“Welcome”, ‘e’) thì sẽ trả lại giá trị là 2.
  public static int count(String str, char a){
    int cnt = 0;
    for(int i = 0; i< str.length(); i++){
      if(str.charAt(i) == a){
        cnt++;
      }
    }
    return cnt;
  }
  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);
    String str = scanner.nextLine();
    char a = scanner.next().charAt(0);
    System.out.println(count(str, a));
  }
}
