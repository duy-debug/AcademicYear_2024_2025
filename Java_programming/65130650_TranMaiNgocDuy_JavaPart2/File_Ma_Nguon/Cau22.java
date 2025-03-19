public class Cau22 {
  //Câu 22. Thiết kế và cài đặt các lớp theo yêu cầu sau:
  //-	Một lớp tên Person và hai lớp con của nó có tên là Student và Employee. Faculty và Staff là các lớp con của Employee.
  //-	Một người (person) có tên, địa chỉ, số điện thoại, và địa chỉ email.
  //-	Một sinh viên (student) có cấp bậc lớp (freshman, sophomore, junior và senior). Định nghĩa cấp bậc như là một hằng.
  //-	Một người lao động (employee) có một chức vụ, tiền lương và ngày được tuyển dụng.
  //-	Định nghĩa một lớp tên MyDate chứa các trường year, month, và day.
  //-	Một thành viên của khoa (faculty) có trường lưu giữ các giờ làm việc ở văn phòng (dưới dạng chuỗi) và một cấp bậc (lecturer, assistant professor, asscociate professor, professor).
  //-	Một nhân viên (staff) có một chức vụ.
  //-	Viết đè phương thức toString() trong mỗi lớp để hiển thị tên lớp.
  //Viết một chương trình để test bằng cách tạo một đối tượng của mỗi lớp Person, Student, Employee, Faculty, và Staff, và gọi phương thức toString() của chúng.
  public static void main(String[] args) {
    Person person = new Person("Duy", "02 Nguyễn Đình Chiểu", "0123456789", "duy@gmail.com");
    Student student = new Student("Khánh", "2B/4 Mai Xuân Thưởng", "0987654321", "khanh@gmail.com", StudentLevel.junior);
    Employee employee = new Employee("Bình", "31/B Đoàn Trần Nghiệp", "0345678901", "binh@gmail.com", "Manager", 50000000, new Mydate(2025,10,30));
    Faculty faculty = new Faculty("An", "26 Nguyễn Thị Minh Khai", "0765432109", "An@gmail.com", "Professor", 80000, new Mydate(2016,2,20), "9AM-5PM", "Professor");
    Staff staff = new Staff("Hoàng", "86B Trần Phú", "0456789012", "jane@example.com", "HR Assistant", 40000, new Mydate(2018, 3, 10), "HR Manager");
    System.out.println(person);
    System.out.println(student);
    System.out.println(employee);
    System.out.println(faculty);
    System.out.println(staff);
  }
  public static class Person {
    private String name;
    private String address;
    private String phone;
    private String email;
    public Person(String name, String address, String phone, String email) {
      this.name = name;
      this.address = address;
      this.phone = phone;
      this.email = email;
    }
    @Override
    public String toString() {
      return "Name: " + name + ", Address: " + address + ", Phone: " + phone + ", Email: " + email;
    }
  }
  enum StudentLevel{
    freshman, sophomore, junior, senior;
  }
  public static class Student extends Person {
    private StudentLevel level;
    public Student(String name, String address, String phone, String email, StudentLevel level) {
      super(name, address, phone, email);
      this.level = level;
    }
    @Override
    public String toString() {
      return super.toString() + ", level: " + level;
    }
  }
  public static class Employee extends Person {
    private String duty; // chức vụ
    private int salary; // tiền lương
    private Mydate dateofRecruitment; // ngày được tuyển dụng
    public Employee(String name, String address, String phone, String email, String duty, int salary, Mydate dateofRecruitment) {
      super(name, address, phone, email);
      this.duty = duty;
      this.salary = salary;
      this.dateofRecruitment = dateofRecruitment;
    }
    @Override
    public String toString() {
      return super.toString() + ", duty: " + duty + ", salary: " + salary + ", dateofRecruitment: " + dateofRecruitment;
      }
    }
  public static class Faculty extends Employee {
    private String officeHours;
    private String rank;
    public Faculty(String name, String address, String phone, String email, String duty, int salary, Mydate dateofRecruitment, String officeHours, String rank) {
      super(name,address,phone,email,duty,salary,dateofRecruitment);
      this.officeHours = officeHours;
      this.rank = rank;
    }
    @Override
    public String toString() {
      return super.toString() + ", officeHours: " + officeHours + ", rank: " + rank;
    }
  }
  public static class Staff extends Employee {
    private String title;
    public Staff(String name, String address, String phone, String email, String duty, int salary, Mydate dateofRecruitment, String title) {
      super(name,address,phone,email,duty,salary,dateofRecruitment);
      this.title = title;
    }
    @Override
    public String toString() {
      return super.toString() + ", title: " + title;
    }
  }
  public static class Mydate {
    private int year;
    private int month;
    private int day;

    public Mydate(int year, int month, int day) {
      this.year = year;
      this.month = month;
      this.day = day;
    }
    @Override
    public String toString() {
      return "Mydate: " + year + "-" + month + "-" + day;
    }
  }
}
