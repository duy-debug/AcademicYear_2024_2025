using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Printer
{
    public class Printer
    {
        protected string product; // nhà sản xuất;
        protected double price; // giá bán
        public Printer(string product, double price)
        {
            this.product = product;
            this.price = price;
        }
        public Printer()
        {

        }
        public string Product
        {
            get { return product; }
            set { product = value; }
        }
        public double Price
        {
            get { return price; }
            set { price = value; }
        }
        public void In()
        {
            Console.Write("Nhập nhà sản xuất: ");
            product = Console.ReadLine();
            Console.Write("Nhập giá: ");
            price = double.Parse(Console.ReadLine());
        }
        public void Out()
        {
            Console.WriteLine("Nhà sản xuất: {0}, Gía: {1}", product, price);
        }
    }
    public class LaserPrinter: Printer
    {
        private string resolution; // độ phân giải
        public LaserPrinter(string product, double price, string resolution) : base(product, price)
        {
            this.resolution = resolution;
        }
        public LaserPrinter()
        {

        }
        public new void In()
        {
            base.In();
            Console.Write("Nhập độ phân giải: ");
            resolution = Console.ReadLine();
        }
        public new void Out()
        {
            base.Out();
            Console.WriteLine("Độ phân giải: {2}", product, price, resolution);
        }
    }
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.OutputEncoding = Encoding.UTF8;
            List<LaserPrinter> laserPrintersList = new List<LaserPrinter>(); // danh sách list lưu các đối tượng
            int n;
            Console.Write("Nhập danh sách máy in: ");
            n = int.Parse(Console.ReadLine());
            for(int i =0; i<n; i++)
            {
                Console.WriteLine("Nhập thông tin máy in thứ {0}", i+1);
                LaserPrinter laserPrinter = new LaserPrinter();
                laserPrinter.In();
                laserPrintersList.Add( laserPrinter); // lưu đối tượng vào list
            }
            Console.WriteLine("-----In danh sách------");
            for(int i=0; i<laserPrintersList.Count; i++) 
            {
                laserPrintersList[i].Out();
            }
            LaserPrinter priceMin = laserPrintersList[0];
            LaserPrinter priceMax = laserPrintersList[0];
            for(int i=1; i<laserPrintersList.Count; i++)
            {
                if (priceMin.Price > laserPrintersList[i].Price)
                    priceMin = laserPrintersList[i];
                if(priceMax.Price < laserPrintersList[i].Price)
                    priceMax = laserPrintersList[i];
            }
            Console.WriteLine("---------------");
            Console.WriteLine("Máy in có giá thấp nhất: ");
            priceMin.Out();
            Console.WriteLine("Máy in có giá cao nhất: ");
            priceMax.Out();
            string str;
            Console.Write("Nhập tên hãng để lọc máy in: ");
            str= Console.ReadLine();
            bool b = false;
            for(int i=0; i<laserPrintersList.Count; i++)
            {
                if (str.Contains(laserPrintersList[i].Product)) // kiểm tra str có trong chuỗi không
                {
                    laserPrintersList[i].Out();
                    b = true;
                }
            }
            if(b==false)
                Console.WriteLine("Không có máy in nào thuộc hãng này!");
            Console.ReadLine();
        }
    }
}
