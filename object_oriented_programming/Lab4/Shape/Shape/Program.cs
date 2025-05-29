using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Shape
{
    // Lớp hình vẽ
    public abstract class Shape
    {
        public abstract double Area();
    }
    // Lớp hình chữ nhật kế thừa từ lớp hình vẽ
    public class Retangle : Shape
    {
        protected double width;
        protected double height;
        public Retangle(double width, double height)
        {
            this.width = width;
            this.height = height;
        }
        public override double Area()
        {
            return width * height;
        }
    }
    // Lớp hình vuông kế thừa từ lớp hình chữ nhật
    public class Square : Retangle
    {
        public Square(double size) : base(size, size)
        {

        }
    }
    // Lớp hình tròn kế thừa từ lớp hình vẽ
    public class Circle : Shape
    {
        private double radius;
        public Circle(double radius)
        {
            this.radius = radius;
        }
        public override double Area()
        {
            return radius * radius * Math.PI;
        }
    }
    // Lớp hình tam giác kế thừa từ lớp hình vẽ
    public class Triangle : Shape
    {
        private double a;
        private double b;
        private double c;
        public Triangle(double a, double b, double c)
        {
            this.a = a;
            this.b = b;
            this.c = c;
        }
        public override double Area()
        {
            double p = (a + b + c) / 2; // tính chu vi
            return Math.Sqrt(p * (p - a) * (p - b) * (p - c)); // công thức tính diện tích tam giác he-rong
        }
    }
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.OutputEncoding = Encoding.UTF8;
            List<Shape> shapes = new List<Shape>();

            Console.Write("Nhập số lượng hình vẽ: ");
            int n = int.Parse(Console.ReadLine());

            for (int i = 0; i < n; i++)
            {
                Console.WriteLine($"\nHình thứ {i + 1}:");
                Console.WriteLine("1. Hình chữ nhật");
                Console.WriteLine("2. Hình vuông");
                Console.WriteLine("3. Hình tròn");
                Console.WriteLine("4. Hình tam giác");
                Console.Write("Chọn loại hình (1-4): ");
                int choice = int.Parse(Console.ReadLine());

                switch (choice)
                {
                    case 1:
                        Console.Write("Nhập chiều rộng: ");
                        double w = double.Parse(Console.ReadLine());
                        Console.Write("Nhập chiều cao: ");
                        double h = double.Parse(Console.ReadLine());
                        shapes.Add(new Retangle(w, h));
                        break;
                    case 2:
                        Console.Write("Nhập cạnh hình vuông: ");
                        double size = double.Parse(Console.ReadLine());
                        shapes.Add(new Square(size));
                        break;
                    case 3:
                        Console.Write("Nhập bán kính hình tròn: ");
                        double r = double.Parse(Console.ReadLine());
                        shapes.Add(new Circle(r));
                        break;
                    case 4:
                        Console.Write("Nhập cạnh a: ");
                        double a = double.Parse(Console.ReadLine());
                        Console.Write("Nhập cạnh b: ");
                        double b = double.Parse(Console.ReadLine());
                        Console.Write("Nhập cạnh c: ");
                        double c = double.Parse(Console.ReadLine());
                        shapes.Add(new Triangle(a, b, c));
                        break;
                    default:
                        Console.WriteLine("Lựa chọn không hợp lệ.");
                        i--; // làm lại vòng lặp
                        break;
                }
            }
            // Tìm hình có diện tích lớn nhất
            Shape maxShape = shapes[0];
            foreach (Shape s in shapes)
            {
                if (s.Area() > maxShape.Area())
                    maxShape = s;
            }
            Console.WriteLine(maxShape);
            // Sắp xếp danh sách theo diện tích giảm dần
            shapes.Sort((s1, s2) => s2.Area().CompareTo(s1.Area()));
            PrintShapeList(shapes);
        }
          // Phương thức hiển thị danh sách hình vẽ
        static void PrintShapeList(List<Shape> shapes)
        {
            if (shapes.Count == 0)
            {
                Console.WriteLine("Danh sách rỗng!");
                return;
            }
            
            for (int i = 0; i < shapes.Count; i++)
            {
                Console.WriteLine($"{i + 1}. {shapes[i]}");
            }
        }
    }
}
