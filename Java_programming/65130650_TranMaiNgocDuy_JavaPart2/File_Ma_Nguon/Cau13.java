public class Cau13 {
  //Câu 13. Hãy thiết kế và cài đặt một lớp tên Stock theo các yêu cầu sau:
  //-	Một biến kiểu chuỗi tên symbol để lưu giữ ký hiệu của cổ phiếu.
  //-	Một biến kiểu chuỗi tên name để lưu giữ tên của cổ phiếu.
  //-	Một biến kiểu thực tên previousClosingPrice để lưu giữ giá cổ phiếu của ngày hôm trước.
  //-	Một biến kiểu thực tên currentPrice để lưu giữ giá cổ phiếu hiện tại.
  //-	Một phương thức khởi tạo mặc định không tham số và một phương thức khởi tạo để tạo một cổ phiếu với ký hiệu và tên được định rõ (qua tham số).
  //-	Các phương thức để truy cập giá trị của các trường thuộc tính.
  //-	Các phương thức để thay đổi giá trị của previousClosingPrice và currentPrice.
  //-	Một phương thức tên changePercent() để trả lại tỷ lệ thay đổi từ previousClosingPrice đến currentPrice.
  //Viết chương trình để test lớp Stock vừa cài đặt: tạo một đối tượng thuộc lớp Stock với ký hiệu là SUNW, tên là Sun Microsystems Inc, và giá của lần đóng cửa trước đó là 100. Đặt giá trị cổ phiếu hiện tại là 90 và hiển thị tỷ lệ thay đổi của giá cổ phiếu.
  public static void main(String[] args) {
    Stock s1 = new Stock("SUNW","Sun Microsystems Inc",100,90);
    System.out.println(s1.toString());
    System.out.println("Tỷ lệ thay đổi: "+s1.ChangePercent()+"%");
  }
  public static class Stock{
    private String symbol; // lưu giữ ký hiệu cổ phiếu
    private String name; //Lưu tên cổ phiếu
    private double previousClosingPrice; // Gía cổ phiếu ngày hôm trước
    private double currentPrice; // Gía cổ phiểu hiện tại
    public Stock(String symbol, String name, double previousClosingPrice, double currentPrice) {
      this.symbol = symbol;
      this.name = name;
      this.previousClosingPrice = previousClosingPrice;
      this.currentPrice = currentPrice;
    }
    public Stock(){
      symbol = "";
      name = "";
      previousClosingPrice = 0;
      currentPrice = 0;
    }
    public String getSymbol() {
      return symbol;
    }
    public void setSymbol(String symbol) {
      this.symbol = symbol;
    }
    public String getName() {
      return name;
    }
    public void setName(String name) {
      this.name = name;
    }
    public double getPreviousClosingPrice() {
      return previousClosingPrice;
    }
    public void setPreviousClosingPrice(double previousClosingPrice) {
      this.previousClosingPrice = previousClosingPrice;
    }
    public double getCurrentPrice() {
      return currentPrice;
    }
    public void setCurrentPrice(double currentPrice) {
      this.currentPrice = currentPrice;
    }
    public double ChangePercent(){
      return 100*(currentPrice-previousClosingPrice)/previousClosingPrice;
    }

    @Override
    public String toString() {
      return "Stock{" +
              "symbol='" + symbol + '\'' +
              ", name='" + name + '\'' +
              ", previousClosingPrice=" + previousClosingPrice +
              ", currentPrice=" + currentPrice +
              '}';
    }
  }
}
