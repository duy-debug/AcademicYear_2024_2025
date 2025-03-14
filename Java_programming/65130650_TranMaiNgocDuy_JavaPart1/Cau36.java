import java.util.Scanner;

public class Cau36 {
  //Câu 36. Viết một phương thức theo kỹ thuật đệ quy để trả lại số Fibonacci thứ i (chỉ số), với i được nhập vào từ bàn phím, sử dụng khai báo sau: public static long fib1(long index)
  //Dãy Fibonacci nổi tiếng có dạng :
  //Dãy số:	0	1	1	2	3	5	8	13	21	34	55	89	…
  //Chỉ số:	0	1	2	3	4	5	6	7	8	9	10	11
  //	Viết một phương thức trong đó sử dụng vòng lặp để tính số Fibonacci thứ i, với i được đưa vào từ bàn phím, sử dụng khai báo public static long fib2(long index)
  //	Viết một phương thức main để test hai phương thức vừa viết ở trên.
  public static long fib1(long index) {
    if(index == 0)
      return 0;
    if(index == 1)
      return 1;
    return fib1(index - 1) + fib1(index - 2);
  }
  public static long fib2(long index) {
    long a = 0;
    long b = 1;
    long tem = 0;
    for(int i = 2; i <= index; i++){
      tem = a + b;
      a = b;
      b = tem;
    }
    return tem;
  }
  public static void main(String[] args) {
    Scanner sc = new Scanner(System.in);
    long i = sc.nextInt();
    System.out.println(fib1(i));
    System.out.println(fib2(i));
  }
}
