using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bai1._3
{
    internal class Program
    {
        //public static int ViTrung(int soVitrung, int soGio)
        //{
        //    if(soGio == 0)
        //            return soVitrung;
        //    else return ViTrung(soVitrung, soGio - 1) * 2;
        //}
        static void Main(string[] args)
        {
            int soVitrung, soGio;
            Console.Write("Nhap so vi tri trung: ");
            soVitrung = int.Parse(Console.ReadLine());
            Console.Write("Nhap so gio: ");
            soGio = int.Parse(Console.ReadLine());
            //Console.WriteLine("So luong vi trung: {0}", ViTrung(soVitrung, soGio));
            soVitrung = soVitrung * (int)Math.Pow(2, soGio);
            Console.WriteLine("So luong vi trung: {0}", soVitrung);
        }
    }
}
