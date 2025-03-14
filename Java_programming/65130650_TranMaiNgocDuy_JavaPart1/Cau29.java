import java.util.Scanner;

public class Cau29 {
  //Câu 29. Viết hai phương thức nạp chồng (hay tải bội) để trả lại giá trị trung bình của một dãy sử dụng các khai báo như sau:
  //public static int average(int[] array);
  //public static double average(double[] array);
  //Sử dụng {1, 2, 3, 4, 5, 6} and {6.0, 4.4, 1.9, 2.9, 3.4, 3.5} để test các phương thức trên.
// Phương thức tính trung bình cho mảng int
  public static int average(int[] array) {
    if (array.length == 0) return 0; // Xử lý mảng rỗng
    int sum = 0;
    for (int i = 0; i < array.length; i++) {
      sum += array[i];
    }
    return sum / array.length;
  }

  // Phương thức tính trung bình cho mảng double
  public static double average(double[] array) {
    if (array.length == 0) return 0.0; // Xử lý mảng rỗng
    double sum = 0.0;
    for (int i = 0; i < array.length; i++) {
      sum += array[i];
    }
    return sum / array.length;
  }

  public static void main(String[] args) {
    // Test với mảng int: {1, 2, 3, 4, 5, 6}
    int[] intArray = {1, 2, 3, 4, 5, 6};
    System.out.println("Giá trị trung bình của mảng int {1, 2, 3, 4, 5, 6}: " + average(intArray));

    // Test với mảng double: {6.0, 4.4, 1.9, 2.9, 3.4, 3.5}
    double[] doubleArray = {6.0, 4.4, 1.9, 2.9, 3.4, 3.5};
    System.out.println("Giá trị trung bình của mảng double {6.0, 4.4, 1.9, 2.9, 3.4, 3.5}: " + average(doubleArray));
  }
}
