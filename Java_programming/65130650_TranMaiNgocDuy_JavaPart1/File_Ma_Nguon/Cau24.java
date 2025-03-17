import java.util.Random;

public class Cau24 {
  //Câu 24. Xây dựng lớp RandomCharacter bao gồm các phương thức như sau:
  //-	public static char getRandomCharacter(char ch1, char ch2) để trả lại một ký tự ngẫu nhiên trong đoạn từ ký tự ch1 đến ch2.
  //-	public static char getRandomLowerCaseLetter() để trả lại một ký tự thường ngẫu nhiên.
  //-	public static char getRandomUpperCaseLetter() để trả lại một ký tự hoa ngẫu nhiên.
  //-	public static char getRandomDigitCharacter() để trả lại một ký tự số ngẫu nhiên trong đoạn từ ‘0’ đến ‘9’.
  //-	public static char getRandomCharacter() để trả lại một ký tự ngẫu nhiên.
  //Viết chương trình để test lớp RandomCharacter ở trên: tạo 175 ký tự thường ngẫu nhiên và in ra màn hình, mỗi hàng 25 ký tự.
  //Gợi ý: mỗi ký tự đều có một mã Unicode duy nhất trong đoạn từ 0 đến FFFF ở hệ 16 và ‘b’ – ‘a’ = 1.
  public class RandomCharacter {
    private static final Random RANDOM = new Random();
    public static char getRandomCharacter(char ch1, char ch2) {
      // Trả về một ký tự ngẫu nhiên trong đoạn từ ch1 đến ch2
      return (char) (ch1 + RANDOM.nextInt(ch2 - ch1 + 1));
    }
    // Trả về một ký tự chữ thường ngẫu nhiên ('a' đến 'z')
    public static char getRandomLowerCaseLetter() {
      return getRandomCharacter('a', 'z');
    }

    // Trả về một ký tự chữ hoa ngẫu nhiên ('A' đến 'Z')
    public static char getRandomUpperCaseLetter() {
      return getRandomCharacter('A', 'Z');
    }

    // Trả về một ký tự số ngẫu nhiên ('0' đến '9')
    public static char getRandomDigitCharacter() {
      return getRandomCharacter('0', '9');
    }

    // Trả về một ký tự bất kỳ (chữ, số hoặc ký tự đặc biệt)
    public static char getRandomCharacter() {
      return getRandomCharacter('\u0020', '\u007E'); // Khoảng từ ' ' (32) đến '~' (126)
    }
  }
  public static void main(String[] args) {
    final int total_chars = 175; // tổng số ký tự cần tạo
    final int total_words = 25; // Số ký tự trên mỗi dòng
    System.out.println("175 ký tự thường ngẫu nhiên: ");
    for(int i = 1; i <= total_chars; i++){
      System.out.print(RandomCharacter.getRandomLowerCaseLetter() + " ");
      if(i % total_words == 0){
        System.out.println();
      }
    }
  }
}
