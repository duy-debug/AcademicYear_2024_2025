import java.util.Scanner;

public class Cau9 {
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
