using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Vehicle
{
    public class Vehicle
    {
        protected String bienSo;  // biển số xe
        protected int? namSanXuat;  // năm sản xuất
        protected double? gia; // giá đơn vị tính triệu đồng
        public Vehicle(String bienSo, int? namSanXuat, double? gia)
        {
            this.bienSo = bienSo;
            this.namSanXuat = namSanXuat;
            this.gia = gia;
        }
        public Vehicle()
        {
            bienSo = null;
            namSanXuat = null;
            gia = null;
        }
        public virtual void In()
        {
            do
            {
                Console.Write("Nhập bản số xe: ");
                bienSo = Console.ReadLine();
            } while (bienSo.Length != 8);
            int namHienTai = DateTime.Now.Year;
            do
            {
                Console.Write("Nhập năm sản xuất: ");
                namSanXuat = int.Parse(Console.ReadLine());
            } while (namSanXuat < 1900 || namSanXuat > namHienTai);
            Console.Write("Nhập giá (triệu đồng): ");
            gia = double.Parse(Console.ReadLine());
        }
        public virtual void Out()
        {
            Console.WriteLine("Bản số xe: {0}, Năm xản xuất: {1}, Giá: {2}", bienSo, namSanXuat, gia);

        }
        public double? Gia
        {
            get { return gia; } // Chỉ cho phép đọc
            private set { gia = value; } // Chỉ có thể gán giá trị trong class này
        }   
        public String BienSo
        {
            get { return bienSo; } // chỉ cho phép đọc
            private set { bienSo = value; } // chỉ có thể gián giá trị trong class này
        }
        public int? NamSanXuat
        {
            get { return namSanXuat; } // chỉ cho phép đọc
            private set { namSanXuat = value; } // chỉ có thể gán giá trị trong class này
        }
    }
    public class Car: Vehicle
    {
        private int? soChoNgoi { get; set; }  // số chỗ ngồi
        private String loaiXe { get; set; }  // loại xe
        public Car() : base()
        {
            soChoNgoi = null;
            loaiXe = null;
        }
        public Car(String bienSo, int? namSanXuat, double? gia, int? soChoNgoi, String loaiXe) : base(bienSo,namSanXuat,gia)
        {
            this.soChoNgoi = soChoNgoi;
            this.loaiXe = loaiXe;
        }
        public override void In()
        {
            base.In();
            Console.Write("Nhập số chỗ ngồi: ");
            soChoNgoi = int.Parse(Console.ReadLine());
            do
            {
                Console.Write("Nhập loại xe: ");
                loaiXe = Console.ReadLine();
            } while (loaiXe.Length <= 10);
        }
        public override void Out()
        {
            base.Out();
            Console.WriteLine("Số chỗ ngồi: {0}, Loại xe: {1}", soChoNgoi, loaiXe);
        }
    }
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.OutputEncoding = Encoding.UTF8;
            List<Car> danhSach = new List<Car>();
            int n;
            Console.Write("Nhập số lượng danh sách xe: ");
            n = int.Parse(Console.ReadLine());
            for(int i=0; i<n; i++)
            {
                Console.WriteLine("Nhập thông tin xe thứ: {0}", i+1);
                Car car = new Car();
                car.In();
                danhSach.Add(car);
                
            }
            Console.WriteLine("----Danh sách xe----");
            for(int i=0; i<n; i++)
            {
                Console.WriteLine("Thông tin xe thứ: {0}", i+1);
                danhSach[i].Out();
            }
            Console.WriteLine("------------------------");
            Car xeGiaThapNhat = danhSach[0];
            Car xeGiaCaoNhat = danhSach[0];
            for(int i=1; i<danhSach.Count; i++)
            {
                if(xeGiaThapNhat.Gia > danhSach[i].Gia)
                    xeGiaThapNhat = danhSach [i];
                if(xeGiaCaoNhat.Gia < danhSach[i].Gia)
                    xeGiaCaoNhat= danhSach [i];
            }
            Console.WriteLine("Thông tin của xe có giá thấp nhất: ");
            xeGiaThapNhat.Out();
            Console.WriteLine("Thông tin của xe có giá cao nhất: ");
            xeGiaCaoNhat.Out();
            String str; // Mã tỉnh;
            Console.WriteLine("-------------------");
            Console.Write("Nhập mã tỉnh: ");
            str = Console.ReadLine();
            bool b = false;
            for(int i=0; i<danhSach.Count; i++)
            {
                if (str.Contains(danhSach[i].BienSo))
                {
                    danhSach[i].Out();
                    b = true;
                }
            }
            if(b==false)
                Console.WriteLine("Không có thông tin xe có mã tỉnh: {0}", str);
            for(int i=0; i<danhSach.Count-1; i++)
            {
                for(int j=i+1; j<danhSach.Count; j++)
                {
                    if (danhSach[i].NamSanXuat > danhSach[j].NamSanXuat)
                    {
                        Car tem = danhSach[i];
                        danhSach[i] = danhSach[j];
                        danhSach[j] = tem;
                    }
                }
            }
            Console.WriteLine("--------------------------");
            for(int i=0; i< danhSach.Count; i++)
            {
                danhSach[i].Out();
            }
            Console.ReadLine();
        }
    }
}
