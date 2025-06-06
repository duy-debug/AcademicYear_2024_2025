using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp1
{
    public class Computer
    {
        protected string hangSanXuat;
        protected int namSanXuat;
        protected double gia;
        public Computer(string hangSanXuat = "", int namSanXuat = 0, double gia = 0)
        {
            this.hangSanXuat = hangSanXuat;
            this.namSanXuat = namSanXuat;
            this.gia = gia;
        }
        public string HangSanXuat
        {
            get { return hangSanXuat; }
            set { hangSanXuat = value; }
        }
        public int NamSanXuat
        {
            get { return namSanXuat; }
            set { namSanXuat = value; }
        }
        public double Gia
        {
            get { return gia; }
            set { gia = value; }
        }
        public void Nhap()
        {
            Console.Write("Nhap hang san xuat: ");
            HangSanXuat = Console.ReadLine();
            Console.Write("Nhap nam san xuat: ");
            namSanXuat = int.Parse(Console.ReadLine());
            Console.Write("Nhap gia: ");
            Gia = double.Parse(Console.ReadLine());
        }
        public void Xuat()
        {
            Console.Write("Hang san xuat: {0}, Nam san xuat: {1}, Gia: {2}", hangSanXuat, namSanXuat, gia);
        }
        public virtual int ThoiHanBaoHanh()
        {
            int thoiHan = 0;
            return thoiHan;
        }
    }
    public class Desktop : Computer
    {
        private string tenModel;
        public Desktop(string hangSanXuat = "", int namSanXuat = 0, double gia = 0, string tenModel = "") : base(hangSanXuat, namSanXuat, gia)
        {
            this.tenModel = tenModel;
        }
        public string TenModel
        {
            get { return tenModel; }
            set { tenModel = value; }
        }
        public void Nhap()
        {
            base.Nhap();
            Console.Write("Nhap ten model: ");
            TenModel = Console.ReadLine();
        }
        public void Xuat()
        {
            base.Xuat();
            Console.WriteLine(", Ten model: {0}", tenModel);
        }
        public override int ThoiHanBaoHanh()
        {
            int thoiHan = 5 - (DateTime.Now.Year - namSanXuat);
            return thoiHan;
        }
        internal class Program
        {
            static void Main(string[] args)
            {
                List<Desktop> listdesktops = new List<Desktop>();
                int n;
                Console.Write("Nhap so luong may tinh: ");
                do
                {
                    n = int.Parse(Console.ReadLine());
                } while (n <= 0 || n >= 100);
                for(int i=0; i<n; i++)
                {
                    Console.WriteLine("Nhap thong tin may tinh thu: {0}", i+1);
                    Desktop desktop = new Desktop();
                    desktop.Nhap();
                    listdesktops.Add(desktop);
                }
                Console.WriteLine("Danh sach may tinh:");
                for (int i = 0; i < n; i++)
                {
                    listdesktops[i].Xuat();
                    int thoiHan = listdesktops[i].ThoiHanBaoHanh();
                    Console.Write("Thoi han bao hanh cua may tinh {0} la: {1} nam",i+1, thoiHan);
                    Console.WriteLine();
                }
                    // xóa máy tính có thời hạn bảo hành < 0 
                    for (int i=listdesktops.Count-1; i>=0; i--)
                {
                    if (listdesktops[i].ThoiHanBaoHanh() < 0)
                    {
                        listdesktops.RemoveAt(i);
                    }
                }
                Console.WriteLine("\nDanh sach may tinh sau khi xoa:");
                for (int i = 0; i < n; i++)
                {
                    listdesktops[i].Xuat();
                    int thoiHan = listdesktops[i].ThoiHanBaoHanh();
                    Console.Write("Thoi han bao hanh cua may tinh {0} la: {1} nam", i + 1, thoiHan);
                    Console.WriteLine();
                }
                // Sắp xếp danh sách theo năm sản xuất giảm dần
                for (int i=0; i<listdesktops.Count-1; i++) {
                    for(int j=i+1; j<listdesktops.Count; j++)
                    {
                        if (listdesktops[i].NamSanXuat < listdesktops[j].NamSanXuat)
                        {
                            Desktop temp = listdesktops[i];
                            listdesktops[i] = listdesktops[j];
                            listdesktops[j] = temp;
                        }
                    }
                }
                Console.WriteLine("\nDanh sach may tinh sau khi sap xep theo nam san xuat giam dan:");
                for (int i = 0; i < listdesktops.Count; i++)
                {
                    listdesktops[i].Xuat();
                    int thoiHan = listdesktops[i].ThoiHanBaoHanh();
                    Console.Write("Thoi han bao hanh cua may tinh {0} la: {1} nam", i + 1, thoiHan);
                    Console.WriteLine();
                }
            }
        }
    }
}
