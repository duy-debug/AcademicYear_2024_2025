import java.util.Scanner;

public class Cau32 {
  // Câu 32. Viết một phương thức cho phép đổi từ milliseconds sang hours, minutes, và seconds sử dụng khai báo như sau:
  //public static String convertMillis(long timeMillis)
  //Phương thức trả về một xâu dưới dạng hours:minutes:seconds với ít nhất hai chữ số để biểu diễn mỗi thành phần hours, minutes, và seconds. Viết đoạn chương trình để test phương thức trên. Ví dụ: nếu gọi convertMillis(5500) thì phải trả lại xâu 00:00:05, gọi convertMillis(100000) thì trả lại 00:01:40, gọi convertMillis(555550000) thì trả lại 154:19:10
  public static String convertMillis(long timeMillis){
    int hours = (int)timeMillis / 3600000;
    int minutes = (int)(timeMillis % 3600000) / 60000;
    int seconds = (int)(timeMillis % 60000) / 1000;
    String hms = "";
    if(hours < 10){
      hms = "0" + hours;
    }
    else{
      hms = "" + hours;
    }
    if(minutes < 10){
      hms += ":0" + minutes;
    }
    else{
      hms += ":" + minutes;
    }
    if(seconds < 10){
      hms += ":0" + seconds;
    }
    else{
      hms += ":" + seconds;
    }
    return hms;
  }
  public static void main(String[] args) {
    Scanner sc = new Scanner(System.in);
    System.out.print("Nhập millis: ");
    long timeMillis = sc.nextLong();
    System.out.println(convertMillis(timeMillis));
  }
}
