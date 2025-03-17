import java.util.Arrays;

public class Cau35 {
  //Câu 35. Viết một phương thức cho phép truyền vào một xâu và trả lại một xâu đã được sắp xếp theo thứ tự alphabet, sử dụng khai báo dạng:
  //public static String sort(String s)
  //Ví dụ: gọi sort(“acb”) thì sẽ trả lại xâu “abc”.
  //	Viết một phương thức để kiểm tra xem hai từ có phải là anagram hay không (sử dụng phương thức sort() vừa viết ở trên). Hai từ được gọi là anagram nếu chúng chứa các ký tự giống nhau ở bất kỳ thứ tự nào. Ví dụ: hai từ “listen” và “silent” được gọi là anagram. Sử dụng khai báo dưới đây:
  //public static boolean isAnagram(String s1, String s2)
  // 	Viết một phương thức main để gọi isAnagram("silent", "listen"), isAnagram("garden", "ranged"), và isAnagram("split", "lisp").
  public static String sort(String str) {
    char[] chars = str.toCharArray();
    Arrays.sort(chars);
    return new String(chars);
  }
  public static boolean isAnagram(String s1, String s2){
    if(sort(s1).equals(sort(s2))){ // so sánh chuỗi
      return true;
    }
    return false;
  }
  public static void main(String[] args) {
    System.out.println(isAnagram("silent", "listen"));
    System.out.println(isAnagram("garden", "ranged"));
    System.out.println(isAnagram("split", "lisp"));
  }
}