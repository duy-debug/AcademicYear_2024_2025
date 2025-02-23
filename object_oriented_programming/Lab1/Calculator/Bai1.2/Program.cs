using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
/*
Viết chương trình nhập từ bàn phím hai số nguyên a, b và một ký tự ch.
Nếu:
- ch là "+" thì thực hiện phép tính a + b và in kết quả lên màn hình.
- ch là "–" thì thực hiện phép tính a - b và in kết quả lên màn hình.
- ch là "*" thì thực hiện phép tính a * b và in kết quả lên màn hình.
- ch là "/" thì thực hiện phép tính a / b và in kết quả lên màn hình. 
Lưu ý kiểm tra điều kiện của phép chia. Nếu b == 0 thì in ra thông báo "Error!"
*/
namespace Bai1._2
{
    internal class Program
    {
        static void Main(string[] args)
        {
            int a, b;
            char phepToan;
            double ketQua = 0;
            Console.Write("Nhap so a: ");
            a = int.Parse(Console.ReadLine());
            Console.Write("Nhap so b: ");
            b = int.Parse(Console.ReadLine());
            Console.Write("Nhap phep toan (+,-,*,/): ");
            phepToan = char.Parse(Console.ReadLine());
            switch (phepToan)
            {
                case '+':
                    ketQua = a + b;
                    Console.WriteLine("Ket qua: {0}", ketQua);
                    break;
                case '-':
                    ketQua = a - b;
                    Console.WriteLine("Ket qua: {0}", ketQua);
                    break;
                case '*':
                    ketQua = a * b;
                    Console.WriteLine("Ket qua: {0}", ketQua);
                    break;
                case '/':
                    if (b == 0)
                    {
                        Console.WriteLine("Error!");
                    }
                    else
                    {
                        ketQua = (double)a / b;
                        Console.WriteLine("Ket qua: {0}", ketQua);
                    }
                    break;
                default:
                    Console.WriteLine("Phep toan khong hop le!");
                    break;
            }
        }
    }
}
