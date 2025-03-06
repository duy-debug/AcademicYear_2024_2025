import java.util.Arrays;
import java.util.Random;

public class Cau40 {
  //Câu 40. Viết một lớp có tên LinearSearch trong đó có một phương thức tên linearSearch thực hiện tìm kiếm tuần tự một phần tử trong một dãy số nguyên: trả lại giá trị chỉ vị trí tìm được của phần tử đó trong dãy, trả lại giá trị -1 nếu không tìm thấy phần tử đó trong dãy. Sử dụng khai báo dạng: public static int linearSearch(int[] list, int key)
  //	Viết một lớp có tên BinarySearch trong đó có một phương thức tên binarySearch thực hiện tìm kiếm nhị phân một phần tử trong một dãy số nguyên đã được sắp xếp: trả lại giá trị chỉ vị trị tìm được của phần tử đó trong dãy, trả lại giá trị âm nếu không tìm thấy phần tử đó trong dãy. Sử dụng khai báo dạng: public static int binarySearch(int[] list, int key)
  //	Viết một chương trình trong đó khởi tạo ngẫu nhiên một dãy các số nguyên bao gồm 100000 phần tử và khởi tạo một ngẫu nhiên một phần tử cần tìm. Sử dụng các phương thức được viết ở trên, hãy ước lượng thời gian tìm kiếm phần tử đó trong dãy được tạo theo phương pháp tìm kiếm tuần tự và tìm kiếm nhị phân. Gợi ý: có thể dùng phương thức System.currentTimeMillis() để lấy thời gian hiện tại của hệ thống theo milliseconds.
  public static void main(String[] args) {
    Random random = new Random();
    int[] arr = new int[100000];
    for(int i=0; i<100000; i++){
      arr[i] = random.nextInt(100000);
      System.out.println(arr[i]);
    }
    Random random2 = new Random();
    int key = random2.nextInt(100000);
    long startTime = System.currentTimeMillis();
    int linearResult = LinearSearch.linearSearch(arr, key);
    long endTime = System.currentTimeMillis();
    System.out.println("Tìm kiếm tuyến tính: " + (linearResult >= 0 ? "Tìm thấy tại " + linearResult : "Không tìm thấy"));
    System.out.println("Thời gian tuyến tính: " + (endTime - startTime) + "ms");
    Arrays.sort(arr);
    startTime = System.currentTimeMillis();
    int binaryResult = BinarySearch.binarySearch(arr,key);
    endTime = System.currentTimeMillis();
    System.out.println("Tìm kiếm nhị phân: " + (binaryResult >= 0 ? "Tìm thấy tại " + binaryResult : "Không tìm thấy"));
    System.out.println("Thời gian nhị phân: " + (endTime - startTime) + " ms");
  }
  public class LinearSearch {
    public static int linearSearch(int[] arr, int key) {
      for(int i=0; i<arr.length; i++){
        if(arr[i]==key){
          return i;
        }
      }
      return -1;
    }
  }
  public class BinarySearch {
    public static int binarySearch(int[] arr, int key) {
      int left = 0;
      int right = arr.length-1;
      while(left<=right){
        int mid = (left + right) / 2;
        if(arr[mid]==key){
          return mid;
        }else if(arr[mid]<key){
          left = mid+1;
        }else{
          right = mid-1;
        }
      }
      return -1;
    }
  }
}

