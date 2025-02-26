import java.util.Scanner;

public class Cau8 {
  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);
    int n = 1;
    int demduong = -1;
    int demam = 0;
    int tong = 0;
    while(n!=0) {
      n = scanner.nextInt();
        if(n<0){
          demam++;
      }
        else{
          demduong++;
        }
        tong+=n;
    }
    double tbc = (double)tong/(demduong+demam);
    System.out.printf("Tổng: %d Giá trị trung bình: %.2f\n", tong, tbc);
    System.out.println("Có số dương: "+demduong);
    System.out.println("Có số âm: "+demam);
  }
}
