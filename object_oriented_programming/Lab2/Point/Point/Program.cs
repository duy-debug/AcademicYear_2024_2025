using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Point
{
    /*
  1. Cài đặt lớp Point mô tả các điểm trong mặt phẳng với các thuộc tính, phương thức sau
- Thuộc tính:
+ x,y: tọa độ của điểm
- Phương thức:
+ Hàm thiết lập khởi tạo tọa độ và màu cho điểm.
+ Hàm Move(double dx, double xy) di chuyển điểm với khoảng cách tương ứng dx, dy.

2. Chương trình chính:
- Khai báo một danh sách đối tượng điểm.
- In ra tọa độ của các điểm.
- Tìm điểm cách xa gốc tọa độ nhất.
- Tìm cặp điểm gần nhau nhất.
     */
    public class Point
    {
        private double x;
        private double y;
        // lấy tọa độ điểm x
        public double GetX()
        {
            return x;
        }
        // lấy tọa độ điểm y
        public double GetY()
        {
            return y;
        }
        // hàm khởi tạo constructor
        public Point(double x, double y)
        {
            this.x = x;
            this.y = y;
        }
        public void Move(double dx, double dy)
        {
            x += dx;
            y += dy;
        }
    }
    internal class Program
    {
        static void Main(string[] args)
        {
            int n;
            // Nhập danh sách điểm tọa độ
            do
            {
                Console.Write("Nhap so luong diem: ");
                n = int.Parse(Console.ReadLine());
            } while (n <= 1);
            Point[] points = new Point[n];
            for (int i = 0; i < n; i++)
            {
                Console.Write("Nhap toa do x: ");
                double x = double.Parse(Console.ReadLine());
                Console.Write("Nhap toa do y: ");
                double y = double.Parse(Console.ReadLine());
                points[i] = new Point(x, y);
            }
            // In ra tọa độ của các điểm
            Console.WriteLine("In toa do cua cac diem: ");
            for(int i = 0; i < points.Length; i++)
            {
                Console.WriteLine("({0},{1})", points[i].GetX(), points[i].GetY());
            }
            // Tìm điểm cách xa gốc tọa độ nhất
            double max = Math.Sqrt(points[0].GetX() * points[0].GetX() + points[0].GetY() * points[0].GetY());
            int index = 0;
            for(int i = 1; i < points.Length; i++)
            {
                double tem = Math.Sqrt(points[i].GetX() * points[i].GetX() + points[i].GetY()  * points[i].GetY());
                if(tem > max)
                {
                    max = tem;
                    index = i;
                }    
            }
            Console.WriteLine("Diem cach xa toa do nhat: ({0},{1})", points[index].GetX(), points[index].GetY());
            // Tìm cặp điểm gần nhau nhất
            double min = Math.Sqrt(Math.Pow(points[0].GetX() - points[1].GetX(), 2) + Math.Pow(points[0].GetY() - points[1].GetY(), 2));
            int index1 = 0;
            int index2 = 1;
            for (int i = 1; i < points.Length-1; i++)
            {
                for (int j = i + 1; j < points.Length; j++)
                {
                    double tem = Math.Sqrt(Math.Pow(points[i].GetX() - points[j].GetX(), 2) + Math.Pow(points[i].GetY() - points[j].GetY(), 2));
                    if (tem < min)
                    {
                        min = tem;
                        index1 = i;
                        index2 = j;
                    }
                }
            }
            Console.WriteLine("Cap diem gan nhau nhat: ({0},{1}) , ({2},{3})", points[index1].GetX(), points[index1].GetY(), points[index2].GetX(), points[index2].GetY());
        }
    }
}
