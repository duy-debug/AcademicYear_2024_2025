using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace XeHoi
{
    public class XeHoi
    {
        private string bienSo;
        private string tenHangModel;
        private int namSanXuat;
        public XeHoi(string bienSo, string tenHangModel, int namSanXuat)
        {
            this.bienSo = bienSo;
            this.tenHangModel = tenHangModel;
            this.namSanXuat = namSanXuat;
        }
        public string BienSo
        {
            get { return bienSo; }
            set {
                if (value.Length == 8)
                    bienSo = value;
                else
                    throw new Exception("Biển số không hợp lệ");
            }
        }
        public string TenHangModel
        {
            get { return tenHangModel; }
            set
            {
                if (value.Length > 10)
                    tenHangModel = value;
                else
                    throw new Exception("Tên hãng model không hợp lệ");
            }
        }
        public int NamSanXuat
        {
            get { return namSanXuat; }
            set {
                if (value >= 1900 && value <= DateTime.Now.Year)
                    namSanXuat = value;
                else
                    throw new Exception("Năm sản xuất không hợp lệ");
            }
        }
        public void Nhap()
        {
            while (true)
            {
                Console.Write("Nhập biển số: ");
                try
                {
                    BienSo = Console.ReadLine();
                    break;
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Lỗi: {0}", ex.Message);
                }
            }

            while (true)
            {
                Console.Write("Nhập tên hãng model: ");
                try
                {
                    TenHangModel = Console.ReadLine();
                    break;
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Lỗi: {0}", ex.Message);
                }
            }

            // Nhập điểm trung bình
            while (true)
            {
                Console.Write("Nhập năm sản xuất: ");
                try
                {
                    NamSanXuat = int.Parse(Console.ReadLine());
                    break;
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Lỗi: {0}", ex.Message);
                }
            }
        }
        public void Xuat()
        {
            Console.WriteLine("Biển số: {0}, Tên hãng model: {1}, Năm sản xuất: {2}", bienSo, tenHangModel, namSanXuat);
        }
    }
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.OutputEncoding = Encoding.UTF8;
            List<XeHoi> danhSach = new List<XeHoi>();
            int n;
            while (true)
            {
                try
                {
                    Console.Write("Nhập số lượng xe: (0<n<100): ");
                    n = int.Parse(Console.ReadLine());
                    if (n > 0 && n < 100)
                        break;
                }
                catch
                {
                    Console.WriteLine("Lỗi! Nhập lại.");
                }
            }
            for (int i = 0; i < n; i++)
            {
                XeHoi xe = new XeHoi("", "", 0);
                Console.WriteLine("Nhập thông tin xe thứ {0}", i + 1);
                xe.Nhap();
                danhSach.Add(xe);
            }
            Console.WriteLine("Thông tin danh sách xe");
            foreach(XeHoi xe in danhSach)
                xe.Xuat();
            Console.WriteLine("Thông tin xe có thời gian lưu hành trên mười năm: ");
            for(int i=0; i<danhSach.Count; i++)
            {
                if(DateTime.Now.Year - danhSach[i].NamSanXuat > 10)
                    danhSach[i].Xuat();
            }
            danhSach.Sort((xe2,xe3) => xe2.NamSanXuat.CompareTo(xe3.NamSanXuat));
            Console.WriteLine("Danh sách xe được sắp xếp theo năm sản xuất: ");
            foreach (XeHoi xe in danhSach)
                xe.Xuat();



            Console.WriteLine("Lọc danh sách xe hơi trùng tên: ");
            HashSet<string> maSinhVienDaGap = new HashSet<string>();
            List<XeHoi> danhSachLoc = new List<XeHoi>();

            foreach (XeHoi xe in danhSach)
            {
                if (!maSinhVienDaGap.Contains(xe.TenHangModel))
                {
                    maSinhVienDaGap.Add(xe.TenHangModel);
                    danhSachLoc.Add(xe);
                }
            }
            foreach (XeHoi sv4 in danhSachLoc)
            {
                sv4.Xuat();
            }
        }
    }
}
