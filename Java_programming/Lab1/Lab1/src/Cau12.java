import java.util.Scanner;
import java.util.Arrays;
public class Cau12 {
  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);
    // Nhập kích thước mảng từ người dùng
    System.out.print("Nhập kích thước mảng: ");
    int size = scanner.nextInt();
    // Nhập các phần tử của mảng
    int[] array = new int[size];
    System.out.println("Nhập các phần tử của mảng:");
    for (int i = 0; i < size; i++) {
      System.out.printf("A[%s] = ", i+1);
      array[i] = scanner.nextInt();
    }
    System.out.println("Dãy ban đầu: " + Arrays.toString(array));
    // Đảo ngược bằng cách copy vào dãy mới
    int[] reversedArray = reverseWithNewArray(array);
    System.out.println("Đảo ngược (dãy mới): " + Arrays.toString(reversedArray));
    // Đảo ngược tại chỗ
    reverseInPlace(array);
    System.out.println("Đảo ngược (tại chỗ): " + Arrays.toString(array));
    scanner.close();
  }
  public static int[] reverseWithNewArray(int[] array) {
    int[] reversedArray = new int[array.length];
    for (int i = 0; i < array.length; i++) {
      reversedArray[i] = array[array.length - 1 - i];
    }
    return reversedArray;
  }
  public static void reverseInPlace(int[] array) {
    int left = 0;
    int right = array.length - 1;
    while (left < right) {
      int temp = array[left];
      array[left] = array[right];
      array[right] = temp;
      left++;
      right--;
    }
  }
}
