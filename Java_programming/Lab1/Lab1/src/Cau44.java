import java.util.Scanner;

public class Cau44 {
  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);
    String s = scanner.nextLine();
    scanner.close(); // Đóng Scanner sau khi nhập

    StringBuilder word = new StringBuilder();
    for (int i = 0; i < s.length(); i++) {
      char ch = s.charAt(i);
      if (Character.isLetter(ch)) {
        word.append(ch);
      } else {
        if (word.length() > 0) {
          System.out.println(word);
          word.setLength(0); // Xóa từ hiện tại để chuẩn bị cho từ tiếp theo
        }
      }
    }

    // In từ cuối cùng nếu có
    if (word.length() > 0) {
      System.out.println(word);
    }
  }
}
