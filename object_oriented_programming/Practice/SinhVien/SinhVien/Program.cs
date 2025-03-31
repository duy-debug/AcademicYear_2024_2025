using System;
using System.Collections.Generic;
using System.Text;

namespace SinhVien
{
    public class SinhVien
    {
        private string maSinhVien;
        private string hoTen;
        private float diemTrungBinh;
        public SinhVien(string maSinhVien = "", string hoTen = "", float diemTrungBinh = 0)
        {
            this.maSinhVien = maSinhVien;
            this.hoTen = hoTen;
            this.diemTrungBinh = diemTrungBinh;
        }
        public string MaSinhVien
        {
            get { return maSinhVien; }
            set
            {
                if (value.Length > 0)
                    maSinhVien = value;
                else
                    throw new Exception("Mã sinh viên phải có độ dài lớn hơn 0.");
            }
        }
        public string HoTen
        {
            get { return hoTen; }
            set
            {
                if (value.Length > 0)
                    hoTen = value;
                else
                    throw new Exception("Họ và tên phải có độ dài lớn hơn 0.");
            }
        }

        public float DiemTrungBinh
        {
            get { return diemTrungBinh; }
            set
            {
                if (value >= 0 && value <= 10)
                    diemTrungBinh = value;
                else
                    throw new Exception("Điểm trung bình phải nằm trong khoảng [0,10].");
            }
        }

        public void Nhap()
        {
            while (true)
            {
                Console.Write("Nhập mã số sinh viên: ");
                try
                {
                    MaSinhVien = Console.ReadLine();
                    break; // Thoát vòng lặp nếu nhập đúng
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Lỗi: {0}", ex.Message);
                    // Quay lại nhập mã sinh viên
                }
            }

            // Nhập họ tên
            while (true)
            {
                Console.Write("Nhập họ và tên: ");
                try
                {
                    HoTen = Console.ReadLine();
                    break; // Thoát vòng lặp nếu nhập đúng
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Lỗi: {0}", ex.Message);
                    // Quay lại nhập họ tên
                }
            }

            // Nhập điểm trung bình
            while (true)
            {
                Console.Write("Nhập điểm trung bình [0,10]: ");
                try
                {
                    DiemTrungBinh = float.Parse(Console.ReadLine());
                    break; // Thoát vòng lặp nếu nhập đúng
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Lỗi: {0}", ex.Message);
                    // Quay lại nhập điểm
                }
            }
        }

        public void Xuat()
        {
            Console.WriteLine("Mã SV: {0}, Họ tên: {1}, Điểm TB: {2}", maSinhVien, hoTen, diemTrungBinh);
        }
    }

internal class Program
    {
        static void Main(String[] args)
        {
            Console.OutputEncoding = Encoding.UTF8;
            List<SinhVien> danhSach = new List<SinhVien>();

            int n;
            do
            {
                Console.Write("Nhập số lượng sinh viên: ");
                n = int.Parse(Console.ReadLine());
            } while (n <= 0 || n >= 100);

            for (int i = 0; i < n; i++)
            {
                Console.WriteLine("Nhập thông tin sinh viên thứ {0}:", i+1);
                SinhVien sv = new SinhVien();
                sv.Nhap();
                danhSach.Add(sv);
            }

            Console.WriteLine("\nDanh sách sinh viên:");
            foreach (SinhVien sv in danhSach)
                sv.Xuat();
            SinhVien sv1 = danhSach[0];
            for(int i=1; i<danhSach.Count; i++)
            {
                if(danhSach[i].DiemTrungBinh > sv1.DiemTrungBinh)
                    sv1 = danhSach[i];
            }
            Console.WriteLine("\nSinh viên có điểm trung bình cao nhất:");
            sv1.Xuat();
            danhSach.Sort((sv2, sv3) => sv3.DiemTrungBinh.CompareTo(sv2.DiemTrungBinh));
            Console.WriteLine("\nDanh sách sinh viên sau khi sắp xếp theo điểm trung bình:");
            foreach (SinhVien sv in danhSach)
                sv.Xuat();
            // Lọc danh sách sinh viên
            Console.WriteLine("Lọc danh sách sinh viên trùng tên: ");
            HashSet<string> maSinhVienDaGap = new HashSet<string>();
            List<SinhVien> danhSachLoc = new List<SinhVien>();

            foreach (SinhVien sv in danhSach)
            {
                if (!maSinhVienDaGap.Contains(sv.MaSinhVien))
                {
                    maSinhVienDaGap.Add(sv.MaSinhVien);
                    danhSachLoc.Add(sv);
                }
            }
            foreach(SinhVien sv in danhSachLoc)
            {
                sv.Xuat();
            }
        }
    }
}
