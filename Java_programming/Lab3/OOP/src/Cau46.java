public class Cau46 {
  //Câu 46. Thiết kế và cài đặt lớp có tên RationalNumber để biểu diễn số hữu tỷ theo các yêu cầu sau:
  //-	Có hai biến private kiểu nguyên có tên numerator, denominator để lưu tử số và mẫu số của một số hữu tỷ.
  //-	Có một phương thức để tìm ước số chung lớn nhất của hai số nguyên, có khai báo dạng: private int gcd(int num1, int num2).
  //-	Có một phương thức để tối giản số hữu tỷ, có khai báo dạng: private void reduce(), ví dụ với phân số là 3/9 thì sẽ rút gọn lại thành 1/3
  //-	Có một phương thức khởi tạo để tạo một số hữu tỷ với tham số truyền vào là tử số và mẫu số; phải đảm bảo rằng phân số được tạo lập phải có nghĩa: mẫu số không thể bằng 0 (nếu truyền vào bằng 0 thì chuyển lại là 1), tử số sẽ “chứa” dấu của số hữu tỷ (không có dấu âm ở mẫu số), số hữu tỷ được tạo phải tối giản (gọi phương thức reduce() vừa viết ở trên), ví dụ: 2/6 -> 1/3.
  //-	Có các phương thức để trả lại giá trị của tử số và mẫu số của một số hữu tỷ.
  //-	Có một phương thức để trả lại một số hữu tỷ (đối tượng thuộc lớp RationalNumber) là số nghịch đảo của số hữu tỷ đang xét, có khai báo dạng: public RationalNumber reciprocal()
  //-	Có một phương thức cho phép cộng số hữu tỷ đang xét với một số hữu tỷ khác và trả lại một số hữu tỷ mới, có khai báo dạng: public RationalNumber add (RationalNumber op2).
  //-	Có một phương thức cho phép trừ số hữu tỷ đang xét với một số hữu tỷ khác và trả lại một số hữu tỷ mới, có khai báo dạng: public RationalNumber subtract (RationalNumber op2).
  //-	Có một phương thức cho phép nhân số hữu tỷ đang xét với một số hữu tỷ khác và trả lại một số hữu tỷ mới, có khai báo dạng: public RationalNumber multiply (RationalNumber op2).
  //-	Có một phương thức cho phép chia số hữu tỷ đang xét với một số hữu tỷ khác và trả lại một số hữu tỷ mới, có khai báo dạng: public RationalNumber divide (RationalNumber op2)
  //-	Có một phương thức để cho biết số hữu tỷ đang xét có bằng một số hữu tỷ khác được truyền vào hay không, có khai báo dạng: public boolean equals (RationalNumber op2)
  //-	Có một phương thức tên toString() để trả lại một xâu biểu diễn số hữu tỷ đang xét dưới dạng chuỗi, ví dụ: 3/5.
  //
  //Viết chương trình có tên RationalTester.java để test lớp RationalNumber ở trên với các yêu cầu như sau:
  //-	Tạo hai đối tượng thuộc lớp để biểu diễn hai số hữu tỷ lần lượt là 6/8 và 1/3
  //-	In hai số hữu tỷ vừa tạo ra màn hình.
  //-	Test các phương thức equals, reciprocal, add, substract, multiply, divide được viết trong lớp RationalNumber và ghi kết quả ra màn hình để đối chiếu.
  public static void main(String[] args) {
    RationalNumber ra1 = new RationalNumber(6,8);
    RationalNumber ra2 = new RationalNumber(3,4);
    System.out.println(ra1.getNumerator()+"/"+ra1.getDenominator());
    System.out.println(ra2.getNumerator()+"/"+ra2.getDenominator());
    ra1.reduce();
    ra2.reduce();
    System.out.println("Sau khi tối giản: ");
    System.out.println(ra1.getNumerator()+"/"+ra1.getDenominator());
    System.out.println(ra2.getNumerator()+"/"+ra2.getDenominator());
    ra1.reciprocal();
    ra2.reciprocal();
    System.out.println("Nghịch đảo: ");
    System.out.println(ra1.reciprocal().toString());
    System.out.println(ra2.reciprocal().toString());
    System.out.println("Cộng: ");
    System.out.println(ra1.add(ra2).toString());
    System.out.println("Trừ: ");
    System.out.println(ra1.subtract(ra2).toString());
    System.out.println("Nhân: ");
    System.out.println(ra1.multiply(ra2).toString());
    System.out.println("Chia: ");
    System.out.println(ra1.divide(ra2).toString());
    System.out.println("So sánh: ");
    if(ra1.equals(ra2))
      System.out.println("True");
    else
      System.out.println("False");
  }
  public static class RationalNumber{
    private int numerator; // lưu tử số
    private int denominator; // lưu mẫu số
    public RationalNumber(int numerator, int denominator) {
      this.numerator = numerator;
      if(denominator == 0)
        this.denominator = 1;
      else
        this.denominator = denominator;
    }
    public int gcd(int num1, int num2){ // tìm ước chung lớn lớn nhất
      while(num2!=0){
        int temp = num2;
        num2 = num1%num2;
        num1 = temp;
      }
      return num1;
    }
    public void reduce(){ // tối giản số hữu tỷ
      if(this.denominator == 0){
        this.denominator = 1;
      }
      int a = gcd(this.denominator, this.numerator);
      this.numerator /= a;
      this.denominator /= a;
    }
    public int getNumerator() {
      return numerator;
    }
    public void setNumerator(int numerator) {
      this.numerator = numerator;
    }
    public int getDenominator() {
      return denominator;
    }
    public void setDenominator(int denominator) {
      this.denominator = denominator;
    }
    public RationalNumber reciprocal(){ // trả lại một số hữu tỷ nghịch đảo
      return new RationalNumber(denominator, numerator);
    }
    public RationalNumber add(RationalNumber op2){ // Cộng số hữu tỷ
      int numeratorNew = this.numerator * op2.getDenominator() + op2.getNumerator() * this.denominator;
      int denominatorNew = this.denominator * op2.getDenominator();
      return new RationalNumber(numeratorNew, denominatorNew);
    }
    public RationalNumber subtract(RationalNumber op2){ // Trừ số hữu tỷ
      int numeratorNew = this.numerator * op2.getDenominator() - op2.getNumerator() * this.denominator;
      int denominatorNew = this.denominator * op2.getDenominator();
      return new RationalNumber(numeratorNew, denominatorNew);
    }
    public RationalNumber multiply(RationalNumber op2){ // Nhân số hữu tỷ
      int numeratorNew = this.numerator * op2.getNumerator();
      int denominatorNew = this.denominator * op2.getDenominator();
      return new RationalNumber(numeratorNew, denominatorNew);
    }
    public RationalNumber divide(RationalNumber op2){ // Chia số hữu tỷ
      int numeratorNew = this.numerator * op2.getDenominator();
      int denominatorNew = this.denominator * op2.getNumerator();
      return new RationalNumber(numeratorNew, denominatorNew);
    }
    public boolean equals(RationalNumber op2){ // so sánh 2 phân số hữu tỷ
      if(numerator != op2.getNumerator())
        return false;
      if(denominator != op2.getDenominator())
        return false;
      return true;
    }
    public String toString(){
      return numerator + "/" + denominator;
    }
  }
}
