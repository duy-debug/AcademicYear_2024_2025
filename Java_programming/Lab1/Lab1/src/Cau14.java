public class Cau14 {
  //Câu 14. Viết chương trình để in ra màn hình bốn khuôn mẫu (pattern) như sau (mỗi pattern là một đoạn chương trình):
  //	Pattern I       Pattern II     Pattern III     	 Pattern IV
  //	1                1 2 3 4 5 6              1    	 1 2 3 4 5 6
  //	1 2              1 2 3 4 5              2 1     	 1 2 3 4 5
  //	1 2 3            1 2 3 4              3 2 1     	   1 2 3 4
  //	1 2 3 4          1 2 3              4 3 2 1    	       1 2 3
  //	1 2 3 4 5        1 2              5 4 3 2 1       	     1 2
  // 	1 2 3 4 5 6      1              6 5 4 3 2 1                1            1
  public static void main(String[] args) {
    // Pattern I
    for(int i = 1; i <= 6; i++){
      for(int j = 1; j <= i; j++){
        System.out.print(j + " ");
      }
      System.out.println();
    }
    // Pattern II
    System.out.println();
    for(int i = 1; i <= 6; i++){
      for(int j = 1; j <= 6 - i + 1; j++){
        System.out.print(j + " ");
      }
      System.out.println();
    }
    System.out.println();
    // Pattern III
    for (int i = 1; i <= 6; i++) {
      for (int j = 6 - i; j > 0; j--)
        System.out.print("  ");
      for (int j = i; j >= 1; j--)
        System.out.print(j + " ");
      System.out.println();
    }
    // Pattern IV
    System.out.println();
    for (int i = 1; i <= 6; i++) {
      for (int j = 1; j <= 6 - i + 1; j++){
        System.out.print(j + " ");
      }
      for (int j = i; j >= 1; j--){
        System.out.print(" ");
      }
      System.out.println();
    }
  }
}
