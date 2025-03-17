import java.util.ArrayList;

public class Cau18 {
  //Câu 18. Hãy thiết kế và cài đặt một lớp Course thỏa mãn các yêu cầu sau:
  //-	Một biến kiểu chuỗi tên name lưu giữ tên của khóa học.
  //-	Một biến kiểu dãy các chuỗi tên students lưu giữ tên của các sinh viên tham gia khóa học.
  //-	Một biến kiểu nguyên tên numberOfStudents lưu giữ số lượng sinh viên của khóa học.
  //-	Một phương thức khởi tạo để tạo một đối tượng thuộc lớp Course với tên khóa học được định rõ (qua tham số).
  //-	Một phương thức tên getName để lấy tên của khóa học.
  //-	Một phương thức tên setName để đặt (lại) tên của khóa học.
  //-	Một phương thức tên addStudent để thêm một sinh viên vào khóa học.
  //-	Một phương thức tên getStudents để trả lại danh sách các sinh viên của khóa học.
  //-	Một phương thức tên getNumberOfStudents để trả lại số lượng sinh viên hiện tại của khóa học.
  //Viết chương trình để test lớp Course vừa tạo với các yêu cầu chính như: tạo ít nhất hai đối tượng (chỉ hai khóa học khác nhau) của lớp Course, thêm các sinh viên vào hai khóa học đó, hiển thị số lượng sinh viên của từng khóa học và danh sách các sinh viên tham gia khóa học.
  public static void main(String[] args) {
    Course c1 = new Course("Toán rời rạc");
    Course c2 = new Course("Cơ sở dữ liệu");
    c1.addStudent("Duy");
    c1.addStudent("Lực");
    c1.addStudent("Hoàng");
    c2.addStudent("Khánh");
    c2.addStudent("Bình");
    System.out.println("Số lượng sinh viên khóa học "+c1.getName()+" là: " + c1.getNumberOfStudents());
    System.out.println("Số lượng sinh viên khóa học "+c2.getName()+" là: " + c2.getNumberOfStudents());
    System.out.println("\nDanh sách các sinh viên tham gia khóa học");
    ArrayList<String> allStudents = new ArrayList<>();
    allStudents.addAll(c1.getStudent());
    allStudents.addAll(c2.getStudent());

    for (String student : allStudents) {
      System.out.println("- " + student);
    }

  }
  public static class Course{
    private String name; // lưu giữ tên của khóa học
    private ArrayList<String> students = new ArrayList<>(); //lưu giữ tên sinh viên tham gia khóa học
    private int numberOfStudents; // lưu giữ số lượng sinh viên khóa học
    public Course(String name) {
      this.name = name;
      this.students = new ArrayList<>();
      this.numberOfStudents = 0;
    }

    public String getName() {
      return name;
    }

    public void setName(String name) {
      this.name = name;
    }

    public ArrayList<String> getStudent() {
      return students;
    }

    public void addStudent(String student) {
      students.add(student);
      numberOfStudents++;
    }
    public int getNumberOfStudents() {
      return numberOfStudents;
    }
  }
}
