using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
/*
 1. Cài đặt lớp Circle mô tả các hình tròn, với các thuộc tính, phương thức sau
- Thuộc tính:
+ r: bán kính
+ c: tâm hình tròn, với c là đối tượng của lớp Point đã cài đặt ở Bài 2.3
- Phương thức:
+ Hàm thiết lập khởi tạo hình tròn.
+ Hàm Area() tính diện tích hình tròn.
+ Hàm Move(double dx, double xy) di chuyển hình tròn với khoảng cách tương ứng dx, dy.

2. Chương trình chính
- Khởi tạo một vài đối tượng hình tròn và sử dụng các phương thức đã cài đặt để kiểm tra kết quả.
*/

namespace Circle
{
    public class Point
    {
        public double x { get; set; }
        public double y { get; set; }
        public Point(double x, double y) // hàm khởi tạo có tham sỐ
        {
            this.x = x;
            this.y = y;
        }

    }
    public class Circle
    {
        private double radius { get; set; }
        private Point center { get; set; } // sử dụng đối tượng của lớp Point
        public Circle(double radius, double x, double y) // hàm khởi tạo
        {
            this.radius = radius;
            this.center = new Point(x, y);
        }
        public void Area() // phương thức tính diện tích hình tròn
        {
            Console.WriteLine("Diện tích hình tròn: {0}", Math.PI * Math.Pow(radius,2));
        }
        public void Move(double dx, double dy)
        {
            center.x += dx;
            center.y += dy;
            Console.WriteLine("Sau khi di chuyển: [{0},{1}]", center.x, center.y);
        }
    }
        internal class Program
    {
        static void Main(string[] args)
        {
            Console.OutputEncoding = Encoding.UTF8;
            Circle c = new Circle(3, 2, 1);
            c.Area();
            c.Move(2, 3); // Sau khi di chuyển
            
        }
    }
}
