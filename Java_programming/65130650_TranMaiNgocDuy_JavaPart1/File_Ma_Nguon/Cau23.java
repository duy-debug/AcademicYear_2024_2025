import java.util.Scanner;

public class Cau23 {
  //Câu 23. Viết một phương thức để trả lại một số nguyên đảo ngược. Phương thức được khai báo dưới dạng như sau:
  //	public static int reverse(int number)
  //Ví dụ, nếu gọi phương thức reverse(3456) thì sẽ trả lại số nguyên 6543. Viết đoạn chương trình để test phương thức trên.
  public static int reverse(int x) {
    int pop = 0;
    while(x != 0){
      pop = pop * 10 + x % 10;
      x = x / 10;
    }
    return pop;
  }
  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);
    int n = scanner.nextInt();
    System.out.println(reverse(n));
  }
}
