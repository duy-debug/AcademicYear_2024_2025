import java.util.Scanner;

public class Cau19 {
  //Câu 19. Viết một phương thức để tính tổng các chữ số của một số nguyên. Phương thức được khai báo dưới dạng như sau:
  //	public static int sumDigits(int n)
  //Ví dụ, nếu gọi phương thức sumDigits(234) thì sẽ trả lại giá trị là 2 + 3 + 4 = 9. Viết đoạn chương trình để test phương thức trên.
  public static int sumDigits(int n) {
    int sum = 0;
    while(n > 0){
      sum += n % 10;
      n = n / 10;
    }
    return sum;
  }
  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);
    int n = scanner.nextInt();
    System.out.println(sumDigits(n));
  }
}
