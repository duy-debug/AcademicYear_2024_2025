public class Cau38a {
  //Câu 38. Viết một chương trình cho phép truyền vào phương thức main các số nguyên với số lượng không chỉ rõ như là các xâu tách biệt và hiển thị tổng của chúng ra màn hình.
  //	Viết một chương trình cho phép truyền vào phương thức main các số nguyên với số lượng không chỉ rõ dưới dạng một xâu và hiển thị tổng của chúng ra màn hình.
  //	Ví dụ khi chạy chương trình sẽ là :
  //	java Cau38a 12  332  34  4545
  //	Tong cac so la 4923
  //	java Cau38b “12 332 34 4545”
  //	Tong cac so la 4923
  public static void main(String[] args) {
    if(args.length == 0){
      System.out.println("Vui long truyen mot xau: ");
      return;
    }
    int sum = 0;
    for(String arg : args){ //Duyệt qua từng số sau khi tách
      sum += Integer.parseInt(arg); // Chuyển chuỗi thành số nguyên
    }
    System.out.println("Tong cac so la " + sum);
  }
}
