import java.util.Scanner;

public class Cau8 {
  //Câu 8. Viết chương trình nhập vào các số nguyên (không lưu vào dãy), đếm xem có bao nhiêu số nguyên dương và số nguyên âm đã được nhập; tính và in ra màn hình tổng và giá trị trung bình của các số  được nhập, không tính số 0. Chương trình kết thúc việc nhập khi gặp số 0. Hiển thị giá trị trung bình dưới dạng số chấm động, ví dụ: nếu nhập vào 1, 2, và 0 thì giá trị trung bình sẽ là 1.5.
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