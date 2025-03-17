public class Cau38b {
  public static void main(String[] args) {
    if(args.length == 0){
      System.out.println("Vui long truyen mot xau: ");
      return;
    }
    String[] numbers = args[0].split(" "); // cắt chuỗi đầu thành mảng số
    int sum = 0;
    for(String number : numbers){ //Duyệt qua từng số sau khi tách
      sum += Integer.parseInt(number); // Chuyển chuỗi thành số nguyên
    }
    System.out.println("Tong cac so la " + sum);
  }
}
