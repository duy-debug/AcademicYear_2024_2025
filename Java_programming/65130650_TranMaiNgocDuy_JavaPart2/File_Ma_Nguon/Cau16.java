import java.time.LocalDateTime;
import java.util.Date;
import java.util.EnumMap;
import java.util.Scanner;

public class Cau16 {
  //Câu 16. Hãy thiết kế và cài đặt một lớp Loan theo các yêu cầu sau:
  //-	Một biến kiểu số thực tên loanAmount để lưu số lượng tiền cho vay
  //-	Một biến kiểu nguyên tên numberOfYears để lưu số năm cho vay
  //-	Một biến kiểu thực tên annualInterestRate để lưu tỉ lệ lãi suất cho vay hàng năm.
  //-	Một biến kiểu Date tên loanDate để lưu giữ ngày bắt đầu vay.
  //-	Một phương thức khởi tạo mặc định không tham số: loanAmount = 1000, annualInterestRate  = 2.5 và numberOfYears = 1.
  //-	Một phương thức khởi tạo để tạo một đối tượng kiểu Loan với loanAmount, annualIntersetRate và numberOfYears được định rõ (qua tham số).
  //-	Các phương thức để truy cập giá trị của các trường thuộc tính.
  //-	Các phương thức để thay đổi giá trị của các trường loanAmount, numberOfYears, và annualInterestRate.
  //-	Một phương thức tên monthlyPayment để trả lại số tiền phải trả hàng tháng. Phương thức được khai báo dưới dạng như sau:
  //public static double monthlyPayment(double annualInterestRate, int numOfYears,  double loanAmount)
  //-	Một phương thức tên totalPayment để trả lại tổng số tiền phải trả. Phương thức được khai báo dưới dạng như sau:
  //public static double totalPayment(double annualInterestRate, int numOfYears,  double loanAmount)
  //-	Viết chương trình để test lớp Loan vừa cài đặt: nhập vào các giá trị như annualInterestRate, numberOfYears, và loanAmount từ bàn phím; lấy ngày giờ hệ thống để lưu vào biến loanDate. In ra màn hình ngày giờ bắt đầu vay, số tiền phải trả hàng tháng và tổng số tiển phải trả.
  //
  //Gợi ý cách tính tiền phải trả hàng tháng như sau:
  //	A -  số tiền cho vay
  //	B -  tỷ lệ lãi suất hàng năm
  //	C -  tỷ lệ lãi suất hàng tháng = B / 1200, ví dụ C = 8/1200 = 0.0066666666…
  //	D - số tháng vay
  //	E - số tiền phải trả hàng tháng:
  //		E = (C + C/( (1+C)^D – 1) ) * A
  //Ví dụ: A = 150,000 USD, tỷ lệ lãi suất hàng năm B = 8%, vậy tỷ lệ lãi suất hàng tháng là C = 8/1200 = 0.0066666666…, vay trong vòng 30 năm hay D = 30*12 = 360 tháng. Vậy ta có:
  // E = (0.0066666666 + 0.0066666666 /((1 + 0.0066666666) ^360 -1) ) * 150,000 = 1,100.64 USD
  public static void main(String[] args) {
    Scanner sc = new Scanner(System.in);
    // Nhập dữ liệu từ bàn phím
    System.out.print("Nhập số tiền vay: ");
    double loanAmount = sc.nextDouble();
    System.out.print("Nhập số năm vay: ");
    int numberOfYears = sc.nextInt();
    System.out.print("Nhập lãi suất hàng năm (%): ");
    double annualInterestRate = sc.nextDouble();
    LocalDateTime now = LocalDateTime.now();
    Loan l1 = new Loan(loanAmount,numberOfYears,annualInterestRate);
    System.out.println("Ngày giờ bắt đầu vay: " +now);
    System.out.printf("Số tiền phải trả hàng tháng: %.2f", Loan.monthlyPayment(l1.getAnnualInterestRate(),l1.getNumberOfYears(),l1.getLoanAmount()));
    System.out.println();
    System.out.printf("Tổng số tiền phải trả: %.2f", Loan.totalPayment(l1.getAnnualInterestRate(),l1.getNumberOfYears(),l1.getLoanAmount()));
  }
  public static class Loan{
    private double loanAmount; // lưu số tiền cho vay
    private int numberOfYears; // lưu số năm cho vay
    private double annualInterestRate; // lưu tỉ lệ lãi suất cho vay hàng năm
    private Date loanDate; // lưu giữ ngày bắt đầu
    public Loan(){
      loanAmount = 1000;
      annualInterestRate = 2.5;
      numberOfYears = 1;
    }
    public Loan(double loanAmount, int numberOfYears, double annualInterestRate){
      this.loanAmount = loanAmount;
      this.numberOfYears = numberOfYears;
      this.annualInterestRate = annualInterestRate;
      loanDate = new Date();
    }

    public double getLoanAmount() {
      return loanAmount;
    }

    public void setLoanAmount(double loanAmount) {
      this.loanAmount = loanAmount;
    }

    public int getNumberOfYears() {
      return numberOfYears;
    }

    public void setNumberOfYears(int numberOfYears) {
      this.numberOfYears = numberOfYears;
    }

    public double getAnnualInterestRate() {
      return annualInterestRate;
    }

    public void setAnnualInterestRate(double annualInterestRate) {
      this.annualInterestRate = annualInterestRate;
    }
    // trả lại số tiền phải trả hàng tháng
    public static double monthlyPayment(double annualInterestRate, int numberOfYears, double loanAmount){
      double laisuathangThang = annualInterestRate / 1200;
      return (laisuathangThang + laisuathangThang/(Math.pow(1+laisuathangThang,numberOfYears*12)-1)) * loanAmount;
    }
    // tổng số tiền phải trải
    public static double totalPayment(double annualInterestRate, int numberOfYears, double loanAmount){
      return monthlyPayment(annualInterestRate, numberOfYears, loanAmount)*numberOfYears*12;
    }
  }
}
