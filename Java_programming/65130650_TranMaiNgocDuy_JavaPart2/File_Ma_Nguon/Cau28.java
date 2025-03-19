import java.util.ArrayList;
import java.util.Scanner;
import java.util.Stack;

public class Cau28 {
  //Câu 28. Thiết kế và cài đặt lớp có tên StackOfIntegers để đóng vai trò như là một ngăn xếp (stack) lưu giữ các số nguyên với các yêu cầu sau:
  //-	Một biến kiểu dãy có tên elements để lưu giữ các số nguyên trong stack.
  //-	Một biển kiểu nguyên có tên là size để lưu giữ số lượng hiện tại của các số nguyên trong ngăn xếp.
  //-	Một phương thức khởi tạo không tham số để tạo một stack rỗng với dung lượng mặc định là 16.
  //-	Một phương thức khởi tạo có một tham số để tạo một stack rỗng với dung lượng được chỉ định.
  //-	Một phương thức tên empty() trả lại giá trị true nếu stack là rỗng
  //-	Một phương thức tên peek() trả lại số nguyên ở đỉnh của stack nhưng không xóa nó khỏi stack.
  //-	Một phương thức tên push(int value) để lưu giữ một số nguyên tại đỉnh của stack.
  //-	Một phương thức tên pop() để trả lại số nguyên tại đỉnh của stack và loại bỏ (remove) nó khỏi stack.
  //-	Một phương thức tên getSize() để trả lại số phần tử có trong stack.
  //Viết chương trình để test lớp StackOfIntegers vừa tạo bằng cách tạo ra một stack để lưu giữ các giá trị từ 0 đến 10; lấy các phần tử đó ra khỏi stack và in ra màn hình.
  //Sử dụng lớp StackOfIntegers đó để viết chương trình cho phép nhập vào một số nguyên dương và hiển thị lên màn hình tất cả các thừa số nhỏ nhất của nó theo thứ tự giảm dần. Ví dụ, nếu số nguyên được nhập vào là 120 thì các thừa số nhỏ nhất được hiển thị là 5, 3, 2, 2, 2.
  public static void main(String[] args) {
    StackOfIntegers stack = new StackOfIntegers();
    for(int i = 0; i<=10; i++) {
      stack.push(i);
    }
    for(int i = 0; i<=5; i++) {
      System.out.print(stack.pop()+" ");
    }
    System.out.println();
    System.out.println(stack.getSize());
    StackOfIntegers stack2 = new StackOfIntegers();
    Scanner sc = new Scanner(System.in);
    int n = sc.nextInt();
    int index=0;
    for(int i = 2; i<=n; i++){
      if(n%i==0){
        stack2.push(i);
        n/=i;
        i--;
      }
    }
    while(!stack2.empty()){ // duyệt stack
      System.out.print(stack2.pop()+ " ");
    }
  }
  public static class StackOfIntegers{
    private int[] elements;
    private int size; // lưu giữ số lượng hiện tại của các số nguyên
    public StackOfIntegers() { // constructor không tham số
      elements = new int[16];
    }
    public StackOfIntegers(int size) { // constructor có tham số
      elements = new int[size];
      this.size = 0;
    }
    public boolean empty(){ // trả lại giá trị nếu stack rỗng
      return size == 0;
    }
    public int peek(){ // trả lại s nguyên ở đỉnh
      if(empty()){
        System.out.println("Stack is empty");
      }
      return elements[size - 1];
    }
    public void push(int value){ // đẩy giá trị vào đỉnh
      elements[size++] = value;
    }
    public int pop(){ //trả lại số nguyên tại đỉnh của stack và loại bỏ (remove) nó khỏi stack.
      if(empty()){
        System.out.println("Stack is empty");
      }
      return elements[--size];
    }
    public int getSize(){ //trả lại số phần tử còn trong stack
      return size;
    }
  }
}
