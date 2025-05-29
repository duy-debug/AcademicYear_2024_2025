using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Stack
{
    public class Stack
    {
        protected int top;
        protected int Max;
        protected int[] stack;
        public Stack(int size)
        {
            Max = size;
            stack = new int[size];
            top = -1; // ngăn xếp rỗng
        }
        // Thêm phần tử vào stack
        public void Push(int data)
        {
            if (top >= Max - 1)
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
        public virtual void Print()
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
    public class PrimeStack : Stack
    {
        private int originalNumber; // số nguyên ban đầu
        public PrimeStack(int size, int number) : base(size)
        {
            originalNumber = number;
        }
        public override void Print() // ghi đè phương thức
        {
            if(IsEmpty())
            {
                Console.WriteLine("Stack rỗng!");
                return;
            }
            Console.WriteLine("Các số nguyên tố của là {0}: ", originalNumber);
            int tempTop = top;
            int[] tempArray = new int[top + 1];

            for (int i = 0; i <= top; i++)
            {
                tempArray[i] = stack[i];
            }
            for (int i = tempTop; i >= 0; i--)
            {
                Console.Write(tempArray[i]);
                if (i > 0) Console.Write(" * ");
            }
            Console.WriteLine();
        }
    }
    // Lớp dẫn xuất HexaStack cho chuyển đổi sang hệ thập lục phân
    public class HexaStack : Stack
    {
        private int originalNumber;
        private string hexDigits = "0123456789ABCDEF";

        public HexaStack(int size, int number) : base(size)
        {
            originalNumber = number;
        }

        // Ghi đè phương thức Print để in ra biểu diễn hex
        public override void Print()
        {
            if (IsEmpty())
            {
                Console.WriteLine("{0} (10) = 0 (16)", originalNumber);
                return;
            }

            Console.Write("{0} (10) = ", originalNumber);

            int tempTop = top;
            int[] tempArray = new int[top + 1];

            // Lưu lại các phần tử để không làm thay đổi Stack gốc
            for (int i = 0; i <= top; i++)
            {
                tempArray[i] = stack[i];
            }

            // In ra các chữ số hex từ trái sang phải
            for (int i = tempTop; i >= 0; i--)
            {
                Console.Write(hexDigits[tempArray[i]]);
            }

            Console.WriteLine(" (16)");
        }
    }

    internal class Program
    {
        // Phân tích thừa số nguyên tố
        static void PrimeFactorization(int n)
        {
            PrimeStack stack = new PrimeStack(50, n); // Giới hạn tối đa 50 phần tử
            int num = n;

            for (int i = 2; i <= num; i++)
            {
                while (num % i == 0)
                {
                    stack.Push(i);
                    num /= i;
                }
            }

            stack.Print(); // Sử dụng phương thức Print ghi đè
        } 
        // Chuyển đổi số nguyên sang hệ thập lục phân
        static void ConvertToHexadecimal(int n)
        {
            if (n == 0)
            {
                Console.WriteLine("0 (10) = 0 (16)");
                return;
            }

            HexaStack stack = new HexaStack(20, n);
            int num = n;

            while (num > 0)
            {
                stack.Push(num % 16);
                num /= 16;
            }

            stack.Print(); // Sử dụng phương thức Print ghi đè
        }
        static void Main(string[] args)
        {
            Console.OutputEncoding = Encoding.UTF8;
            Console.Write("Nhập số nguyên: ");
            int number = int.Parse(Console.ReadLine());
            // Phân tích số nguyên tố
            PrimeFactorization(number);
            // Chuyển đổi sang hệ thập lục phân
            ConvertToHexadecimal(number);
        }
    }
}
