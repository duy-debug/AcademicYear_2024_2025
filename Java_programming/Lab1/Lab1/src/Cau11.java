public class Cau11 {
  //Câu 11. Viết chương trình thỏa mãn các yêu cầu sau:
  //-	Xây dựng một phương thức để xác định xem một số nguyên có phải là số nguyên tố hay không (là số chỉ chia hết cho 1 và chính nó).
  //-	Sử dụng phương thức vừa viết ở trên để tìm 1000 số nguyên tố đầu tiên và in ra màn hình 10 số nguyên tố trên một hàng, dưới dạng như sau:
  //	2   3   5   7   11   13   17   19   23   29
  //	31  37  41  43  47   53   59   61   67   71
  //	73  79  83  89  97   ...
  //	...
  public static int KT_SoNguyenTo(int n) {
    if (n < 2)
      return 0;
    for (int i = 2; i <= Math.sqrt(n); i++) {
      if (n % i == 0) {
        return 0;
      }
    }
    return 1;
  }
  public static void main(String[] args){
    int i = 2;
    int cnt = 0;
    while(cnt != 1000){
      if(KT_SoNguyenTo(i)==1){
        System.out.println(i);
        cnt++;
      }
      i++;
    }
  }
}