import java.util.Random;

public class Cau31 {
  public static void main(String[] args) {
    Coin coin = new Coin();
    int headsCount = 0;
    int tailsCount = 0;
    for(int i=0; i<1000; i++){
      coin.flip();
      if(coin.isHeads())
        headsCount++;
      else
        tailsCount++;
    }
    System.out.println("Số lần mặt ngữa: " + headsCount);
    System.out.println("Số lần mặt sấp: " + tailsCount);
    Coin nguoi = new Coin();
    Coin maytinh = new Coin();
    int solanmatngua_nguoi = 0, solanmatngua_maytinh = 0;
    while(true){
      nguoi.flip();
      if(nguoi.isHeads())
        solanmatngua_nguoi++;
      else
        solanmatngua_nguoi=0;
      maytinh.flip();
      if(maytinh.isHeads())
        solanmatngua_maytinh++;
      else
        solanmatngua_maytinh=0;

      System.out.println("Người chơi: " + nguoi + "|" +" Máy tính: " + maytinh); // trạng thái
      if(solanmatngua_nguoi == 3 && solanmatngua_maytinh == 3) {
        System.out.println("Hòa nhau!");
        break;
      }
      else if(solanmatngua_nguoi == 3){
        System.out.println("Người thắng!");
        break;
      }
      else if(solanmatngua_maytinh == 3){
        System.out.println("Máy thắng!");
        break;
      }
    }
  }
}
class  Coin{
  private static final int HEADS = 0; // chỉ mặt ngữa
  private static final int TAILS = 1; // chỉ mặt sấp
  private int face; // lưu trạng thái sấp hay ngửa của đồng xu
  public Coin() { // Constructor
    flip();
  }
  public void flip() { // Tạo giá trị ngẫu nhiên
    Random rand = new Random();
    face = rand.nextInt(2);
  }
  public boolean isHeads(){ // trả lại giá trị true nếu như đồng xu là ngữa
    return face == HEADS;
  }
  public String toString(){
    if(isHeads())
      return "Heads";
    else
      return "Tails";
  }
}
