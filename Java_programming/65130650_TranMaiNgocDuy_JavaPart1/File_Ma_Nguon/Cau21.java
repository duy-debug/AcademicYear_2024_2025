import java.util.Scanner;
import java.util.Stack;

public class Cau21 {
  //Câu 21. Viết chương trình cho phép nhập vào một số nguyên dương và hiển thị lên màn hình tất cả các thừa số nhỏ nhất của nó theo thứ tự giảm dần. Ví dụ, nếu số nguyên được nhập vào là 120 thì các thừa số nhỏ nhất được hiển thị là 5, 3, 2, 2, 2. Gợi ý: dùng lớp Stack trong gói java.util để lưu giữ các thừa số rồi sau đó truy cập và hiển thị theo thứ tự đảo ngược.
  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);
    Stack<Integer> stack = new Stack<>(); // Tạo stack để lưu thừa số nguyên tố
    int n;
    do{
      System.out.print("Nhập một số nguyên dương: ");
      n = scanner.nextInt();
    }while(n <= 0);
    for(int i = 2; i <= n; i++){
      if(n % i == 0){ // nếu i là thừa số nguyên tố
        stack.push(i); // đẩy vào stack
        n /= i;
        i--;
      }
    }
    for(int i = stack.size() - 1; i >= 0; i--){
      System.out.print(stack.pop());
      if(i >= 1)
        System.out.print(", ");
    }
  }
}
