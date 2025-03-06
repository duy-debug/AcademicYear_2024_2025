import java.util.Scanner;

public class Cau44 {
  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);
    String s = scanner.nextLine();
    for(int i=0; i<s.length(); i++){
      if(s.charAt(i) == ' '){
        System.out.println();
      }
      System.out.print(s.charAt(i));
    }
  }
}
