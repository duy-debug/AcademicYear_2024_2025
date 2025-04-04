using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Xe
{
    public class Xe
    {
        protected string tenXe;
        public Xe(string tenXe = "")
        {
            this.tenXe = tenXe;
        }
        public string TenXe
        {
            get { return tenXe; }
            set {
                if (value.Length > 0)
                    tenXe = value;
                else
                    throw new Exception("Ten xe nhap khong dung");
            }
        }
        public void Nhap()
        {
            while (true)
            {
                Console.Write("Nhap ten xe: ");
                try
                {
                    TenXe = Console.ReadLine();
                    break;
                }
                catch(Exception e)
                {
                    Console.WriteLine("Loi! {0}", e.Message);
                }
            }
        }
        public void Xuat()
        {
            Console.Write("Ten xe: {0}", tenXe);
        }
    }
    public class XeMay : Xe
    {
        protected int namSanXuat;
        public XeMay(string tenXe="", int namSanXuat = 0) : base(tenXe)
        {
            this.namSanXuat = namSanXuat;
        }
        public int NamSanXuat
        {
            get { return namSanXuat; }
            set
            {
                if (value <= DateTime.Now.Year)
                    namSanXuat = value;
                else
                    throw new Exception("Nam san xuat khong hop le");
            }
        }
        public new void Nhap()
        {
            base.Nhap();
            while (true)
            {
                Console.Write("Nhap nam san xuat: ");
                try
                {
                    NamSanXuat = int.Parse(Console.ReadLine());
                    break;
                }
                catch (Exception e)
                {
                    Console.WriteLine("Loi! {0}", e.Message);
                }
            }
        }
        public new void Xuat()
        {
            base.Xuat();
            Console.WriteLine(", Nam san xuat: {0}", namSanXuat);
        }
    }
    internal class Program
    {
        static void Main(string[] args)
        {
            List<XeMay> danhSach = new List<XeMay>();
            int n;
            do
            {
                Console.Write("Nhap so luong xe: ");
                n = int.Parse(Console.ReadLine());
            } while (n <= 0);
            for(int i=0; i<n; i++)
            {
                Console.WriteLine("Nhap thong tin xe thu: {0}", i+1);
                XeMay xe = new XeMay();
                xe.Nhap();
                danhSach.Add(xe);
            }
            foreach (XeMay xe in danhSach)
                xe.Xuat();
            Console.ReadLine();
        }
    }
}
