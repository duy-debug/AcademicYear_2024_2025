using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PhanSo
{
    public class PhanSo
    {
        private int _tuSo;
        private int _mauSo;
        public PhanSo(int ts, int ms)
        {
            _tuSo = ts;
            _mauSo = ms;
        }

        public PhanSo(PhanSo p)
        {
            _tuSo = p._tuSo;
            _mauSo = p._mauSo;
        }
        public void Nhap()
        {
            Console.Write("Nhap tu so: ");
            _tuSo = int.Parse(Console.ReadLine());
            do
            {
                Console.Write("Nhap mau so (!=0): ");
                _mauSo = int.Parse(Console.ReadLine());
            } while (_mauSo == 0);
        }
        public void Xuat()
        {
            Console.WriteLine("{0}/{1}", _tuSo, _mauSo);
        }
        public void ToiGian()
        {
            int a = _tuSo;
            int b = _mauSo;
            while (b!=0)
            {
                int r = a % b;
                a = b;
                b = r;
            }
            _tuSo /= a;
            _mauSo /= a;

        }
        public PhanSo Cong(PhanSo p)
        {
            int _tuMoi = _tuSo * p._mauSo + p._tuSo * _mauSo;
            int _mauMoi = _mauSo * p._mauSo;
            return new PhanSo(_tuMoi, _mauMoi);
        }
        public PhanSo Tru(PhanSo p)
        {
            int _tuMoi = _tuSo * p._mauSo - p._tuSo * _mauSo;
            int _mauMoi = _mauSo * p._mauSo;
            return new PhanSo(_tuMoi, _mauMoi);
        }
    }
    internal class Program
    {
        static void Main(string[] args)
        {
            PhanSo p1 = new PhanSo(1, 1);
            PhanSo p2 = new PhanSo(1, 1);
            p1.Nhap();
            p2.Nhap();
            p1.Xuat();
            p2.Xuat();
            Console.WriteLine("Phan so sau khi toi gian la: ");
            p1.ToiGian();
            p2.ToiGian();
            p1.Xuat();
            p2.Xuat();
            Console.WriteLine("Ket qua cong hai phan so: ");
            p1.Cong(p2).Xuat();
            Console.WriteLine("Ket qua tru hai phan so: ");
            p1.Tru(p2).Xuat();
            Console.ReadKey();
        }
    }
}
