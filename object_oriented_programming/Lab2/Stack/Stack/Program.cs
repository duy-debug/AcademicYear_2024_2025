using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Stack
{
    public class Stack
    {
        private int top;
        private int Max;
        private int[] stack;
        public Stack(int size) {
            Max = size;
            stack = new int[size];
            top = -1; // ngăn xếp rỗng
        }
        // Thêm phần tử vào stack
        public void Push(int data)
        {
            if(top >= Max - 1)
            {
                Console.WriteLine("Stack đầy! Không thể thêm phần tử.");
                return;
            }
            stack[++top] = data;
        }
        // Lấy ra phần tử trên cùng
        public int Pop()
        {
            if (IsEmpty())
            {
                Console.WriteLine("Stack rỗng! Không thể lấy phần tử");
                return -1;
            }
            return stack[top--];
        }
        // Xem phần tử trên cùng (Peek)
        public int Peek()
        {
            if (IsEmpty())
            {
                Console.WriteLine("Stack rỗng!");
                return -1;
            }
            return stack[top];
        }
        public bool IsEmpty()
        {
            return top == -1;
        }
        // In các phần tử trong Stack
        public void Print()
        {
            if (IsEmpty())
            {
                Console.WriteLine("Stack rỗng!");
                return;
            }
            for (int i = top; i >= 0; i--)
            {
                Console.Write(stack[i] + " ");
            }
            Console.WriteLine();
        }
    }
    internal class Program
    {
        static void PrimeFactorization(int n)
        {
            Stack stack = new Stack(50); // Giới hạn tối đa 50 phần tử
            int num = n;

            for (int i = 2; i <= num; i++)
            {
                while (num % i == 0)
                {
                    stack.Push(i);
                    num /= i;
                }
            }

            Console.Write($"{n} = ");
            while (!stack.IsEmpty())
            {
                Console.Write(stack.Pop());
                if (!stack.IsEmpty()) Console.Write(" * ");
            }
            Console.WriteLine();
        }

        // Chuyển đổi số nguyên sang hệ nhị phân
        static void ConvertToBinary(int n)
        {
            Stack stack = new Stack(32); // Giới hạn 32 bit

            int num = n;
            while (num > 0)
            {
                stack.Push(num % 2);
                num /= 2;
            }

            Console.Write($"{n} (10) = ");
            while (!stack.IsEmpty())
            {
                Console.Write(stack.Pop());
            }
            Console.WriteLine(" (2)");
        }

        // Chuyển đổi số nguyên sang hệ thập lục phân
        static void ConvertToHexadecimal(int n)
        {
            Stack stack = new Stack(20);
            string hexDigits = "0123456789ABCDEF";

            int num = n;
            while (num > 0)
            {
                stack.Push(num % 16);
                num /= 16;
            }

            Console.Write($"{n} (10) = ");
            while (!stack.IsEmpty())
            {
                Console.Write(hexDigits[stack.Pop()]);
            }
            Console.WriteLine(" (16)");
        }

        static void Main(string[] args)
        {
            Console.OutputEncoding = Encoding.UTF8;
            Console.Write("Nhập số nguyên: ");
            int number = int.Parse(Console.ReadLine());

            // Phân tích số nguyên tố
            PrimeFactorization(number);

            // Chuyển đổi sang hệ nhị phân
            ConvertToBinary(number);

            // Chuyển đổi sang hệ thập lục phân
            ConvertToHexadecimal(number);
        }
    }
}
