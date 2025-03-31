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
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.OutputEncoding = Encoding.UTF8;
            Console.WriteLine("---Chọn loại hình---");
            Console.WriteLine("1. Hình chữ nhật");
            Console.WriteLine("2. Hình vuông");
            Console.WriteLine("3. Hình tròn");
            Console.Write("Chọn: ");
            int choice = int.Parse(Console.ReadLine());
            switch (choice)
            {
                case 1:
                    Console.Write("Nhập chiều dài: ");
                    double width = double.Parse(Console.ReadLine());
                    Console.Write("Nhập chiều rộng: ");
                    double height = double.Parse(Console.ReadLine());
                    Retangle retangle = new Retangle(width, height);
                    Console.WriteLine("Diện tích hình chữ nhật: " + retangle.Area());
                    break;
                case 2:
                    Console.Write("Nhập cạnh: ");
                    double size = double.Parse(Console.ReadLine());
                    Square square = new Square(size);
                    Console.WriteLine("Diện tích hình vuông: " + square.Area());
                    break;
                case 3:
                    Console.Write("Nhập bán kính: ");
                    double radius = double.Parse(Console.ReadLine());
                    Circle circle = new Circle(radius);
                    Console.WriteLine("Diện tích hình tròn: " + circle.Area());
                    break;
            }
        }
    }
}
