using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DSPhanSo
{
    // khai báo lớp phân số
    public class PhanSo
    {
        private int _tuSo;
        private int _mauSo;
        public PhanSo(int tuSo, int mauSo)
        {
            _tuSo = tuSo;
            _mauSo = mauSo;
        }
        public int gettuSo()
        {
            return _tuSo;
        }
        public int getmauSo()
        {
            return _mauSo;
        }
    }
    public class DSPhanSo
    {
        private PhanSo[] _dsPS;
        private int _size;
        public DSPhanSo(int size)
        {
            _size = size;
            _dsPS = new PhanSo[_size];
        }
        public void NhapDanhSach()
        {
            for (int i = 0; i < _size; i++)
            {
                Console.Write("Nhap phan so thu {0}: ", i + 1);
                int tuSo = int.Parse(Console.ReadLine());
                int mauSo;
                do
                {
                    Console.Write("Nhap mau so thu {0}: ", i + 1);
                    mauSo = int.Parse(Console.ReadLine());
                } while (mauSo == 0);
                _dsPS[i] = new PhanSo(tuSo, mauSo);
            }
        }
        public void InDanhSach()
        {
            for (int i = 0; i < _size; i++)
            {
                Console.WriteLine("Phan so thu {0}: {1}/{2}", i + 1, _dsPS[i].gettuSo(), _dsPS[i].getmauSo());
            }
        }
        public PhanSo TimMax()
        {
            PhanSo max = _dsPS[0];
            for (int i = 0; i < _size; i++)
            {
                if ((double)_dsPS[i].gettuSo() / _dsPS[i].getmauSo() > (double)max.gettuSo() / max.getmauSo());
                {
                    max = _dsPS[i];
                }
            }
            return max;
        }
        public void SapXepTang()
        {
            for (int i = 0; i < _size - 1; i++)
            {
                for (int j = i + 1; j < _size; j++)
                {
                    if ((double)_dsPS[i].gettuSo() / _dsPS[i].getmauSo() > (double)_dsPS[j].gettuSo() / _dsPS[j].getmauSo())
                    {
                        PhanSo temp = _dsPS[i];
                        _dsPS[i] = _dsPS[j];
                        _dsPS[j] = temp;
                    }
                }
            }
        }
    }
        internal class Program
    {
        static void Main(string[] args)
        {
            DSPhanSo ds = new DSPhanSo(3);
            ds.NhapDanhSach();
            ds.InDanhSach();
            PhanSo max = ds.TimMax();
            Console.WriteLine("Phan so lon nhat la: {0}/{1}", max.gettuSo(), max.getmauSo());
            Console.WriteLine("Danh sach phan so theo thu tu tang dan: ");
            ds.SapXepTang();
            ds.InDanhSach();
            Console.ReadKey();
        }
    }
}
