import java.util.Scanner;

public class Cau9 {
  //Câu 9. Viết chương trình nhập vào một số nguyên và hiển thị tất cả các thừa số nhỏ nhất của nó. Ví dụ: nếu số nguyên nhập vào là 120 thì kết quả xuất ra sẽ là 2, 2, 2, 3, 5
  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);
    int n = scanner.nextInt();
    int cnt=0;
    for(int i=2; i<=n; i++){
      if(n%i==0){
        System.out.print(i+" ");
        n/=i;
        i--;
      }
    }
  }
}