public class Cau45 {
  //Câu 45. Viết một phương thức đệ quy có khai báo dạng public static double m(int i) để tính tổng của chuỗi sau:
  //
  //	Viết phương thức main để test phương thức trên với i đi từ 1 đến 10
  public static double m(int i){
    if(i == 0) return 0;
    else return i + m(i-1);
  }
  public static void main(String[] args) {
    System.out.println(m(10));
  }
}
