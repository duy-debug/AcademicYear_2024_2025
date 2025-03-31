using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Employees
{
    public class Employees
    {
        protected string fullName; // họ và tên
        protected string date; // ngày tháng năm sinh
        protected double? salary; // lương
        public Employees(string hoTen, string date, double? salary)
        {
            this.fullName = hoTen;
            this.date = date;
            this.salary = salary;
        }
        public Employees()
        {
            fullName = null;
            date = null;
            salary = null;
        }
        public Double? Salary
        {
            get { return salary; }
            set { salary = value; }
        }
        public virtual void In()
        {
            Console.Write("Nhập họ và tên: ");
            fullName = Console.ReadLine();
            Console.Write("Nhập ngày tháng năm sinh: ");
            date = Console.ReadLine();
        }
        public virtual void Out()
        {
            Console.WriteLine("Họ và tên: {0}, Ngày tháng năm sinh: {1}", fullName, date);
        }
    }
    public class EmployeesProduct : Employees
    {
        private double? baseSalary; // lương căn bản
        private int? numberProduct; // số sản phẩm

        public EmployeesProduct(string hoTen, string date, double? salary, double baseSalary, int numberProduct) : base(hoTen, date, salary)
        {
            this.baseSalary = baseSalary;
            this.numberProduct = numberProduct;
        }
        public EmployeesProduct() : base()
        {
            baseSalary = null;
            numberProduct = null;
        }
        public override void In()
        {
            base.In();
            Console.Write("Nhập lương căn bản: ");
            baseSalary = double.Parse(Console.ReadLine());
            Console.Write("Nhập số sản phẩm: ");
            numberProduct = int.Parse(Console.ReadLine());
            this.salary = baseSalary + numberProduct * 5000;
        }
        public override void Out()
        {
            base.Out();
            Console.WriteLine("Lương = {0} + {1} * 5000  = {2}", baseSalary, numberProduct, salary);
        }
    }
    public class OfficeEmployees : Employees
    {
        private int? numberOfWorkingDays; // số ngày làm việc
        public OfficeEmployees(string hoTen, string date, double? salary, int numberOfWorkingDays) : base(hoTen, date, salary)
        {
            this.numberOfWorkingDays = numberOfWorkingDays;
        }
        public OfficeEmployees()
        {
            numberOfWorkingDays = null;
        }
        public override void In()
        {
            base.In();
            Console.Write("Nhập số ngày làm việc: ");
            numberOfWorkingDays = int.Parse(Console.ReadLine());
            this.salary = numberOfWorkingDays * 100000;
        }
        public override void Out()
        {
            base.Out();
            Console.WriteLine("Lương = {0} * 100000 = {1}", numberOfWorkingDays, Salary);
        }
    }
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.OutputEncoding = Encoding.UTF8;
            List<Employees> employeesList = new List<Employees>();
            int n;
            Console.Write("Nhập số lượng danh sách nhân viên: ");
            n = int.Parse(Console.ReadLine());
            for (int i = 0; i < n; i++)
            {
                if (i % 2 == 0)
                {
                    Console.WriteLine("Nhập thông tin nhân viên thứ {0} ", i + 1);
                    EmployeesProduct employees1 = new EmployeesProduct();
                    employees1.In();
                    employeesList.Add(employees1);
                }
                else
                {
                    Console.WriteLine("Nhập thông tin nhân viên thứ {0} ", i + 1);
                    OfficeEmployees employees2 = new OfficeEmployees();
                    employees2.In();
                    employeesList.Add(employees2);
                }
            }
            Console.WriteLine("---------Thông tin nhân viên----------");
            for(int i=0; i<employeesList.Count; i++)
            {
                employeesList[i].Out();
            }
            for(int i=0; i<employeesList.Count-1; i++)
            {
                for(int j=i+1; j<employeesList.Count; j++)
                {
                    if (employeesList[i].Salary < employeesList[j].Salary)
                    {
                        Employees tem = employeesList[i];
                        employeesList[i] = employeesList[j];
                        employeesList[j] = tem;
                    }
                }
            }
            Console.WriteLine("----------Sắp xếp danh sách nhân viên theo thứ tự giảm dần-----------");
            for(int i=0; i<employeesList.Count; i++)
            {
                employeesList[i].Out();
            }
            Console.ReadLine();
        }
    }
}
