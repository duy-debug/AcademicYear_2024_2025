using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
/*
 * Viết chương trình C# thực hiện các công việc sau (mỗi chức năng xây dựng thành một hàm):
a) Nhập một mảng n số nguyên từ bàn phím.
b) In các phần tử của mảng lên màn hình.
c) Trả về phần tử lớn nhất của mảng.
d) Trả về kiểu boolean kiểm tra mảng đã được sắp xếp tăng dần chưa.
e) Sắp xếp mảng theo thứ tự tăng dần.
f) Tách mảng thành 2 mảng con: một mảng chứa các phần tử chẵn, mảng còn lại chứa các phần tử lẻ.
 */
namespace Bai1._4
{
    internal class Program
    {
        public static void InArr(int[] a, int n)
        {
            for (int i = 0; i < n; i++)
            {
                Console.Write("a[{0}] = ", i);
                a[i] = int.Parse(Console.ReadLine());
            }
        }
        public static void OutArr(int[] a, int n)
        {
            for (int i = 0; i < n; i++)
            {
                Console.Write("{0} ", a[i]);
            }
        }
        public static int MaxArr(int[] a, int n)
        {
            int max = a[0];
            foreach (int x in a)
            {
                if (x > max)
                    max = x;
            }
            return max;
        }
        public static bool IsSort(int[] a, int n)
        {
            for (int i = 0; i < n - 1; i++)
            {
                if (a[i] > a[i + 1])
                    return false;
            }
            return true;
        }
        public static void SortArr(int[] a, int n)
        {
            for (int i = 0; i < n - 1; i++)
            {
                int min = i;
                for (int j = i + 1; j < n; j++)
                {
                    if (a[j] < a[min])
                        min = j;
                }
                int temp = a[i];
                a[i] = a[min];
                a[min] = temp;
            }
        }
        public static void SplitArr(int[] a, int n, out List<int> even, out List<int> odd)
        {
            even = new List<int>();
            odd = new List<int>();
            for (int i = 0; i < n; i++)
            {
                if (a[i] % 2 == 0)
                    even.Add(a[i]);
                else
                    odd.Add(a[i]);
            }
        }
        public static void Main()
        {
            int[] a = new int[100];
            int n;
            Console.Write("Nhap n: ");
            n = int.Parse(Console.ReadLine());
            InArr(a, n);
            Console.WriteLine("Mang vua nhap la: ");
            OutArr(a, n);
            // int max = MaxArr(a, n);
            Console.WriteLine("\nPhan tu lon nhat: {0}", MaxArr(a, n));
            // bool isSort = IsSort(a, n);
            if (IsSort(a, n))
                Console.WriteLine("Mang da xap xep tang dan!");
            else
                Console.WriteLine("Mang chua xap xep tang dan!");
            // Array.Sort(a);
            Console.WriteLine("Mang sau khi sap xep tang dan: ");
            SortArr(a, n);
            OutArr(a, n);
            Console.WriteLine("\nTach mang thanh 2 mang con:");
            SplitArr(a, n, out List<int> even, out List<int> odd);
            Console.WriteLine("Mang chan: ");
            foreach (int x in even)
            {
                Console.Write("{0} ", x);
            }
            Console.WriteLine("\nMang le: ");
            foreach (int x in odd)
            {
                Console.Write("{0} ", x);
            }
        }
    }
}
