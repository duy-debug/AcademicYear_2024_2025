using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Employees
{
    public class Employees
    {
        private String fullName;
        private String date;
        private Double? salary;
        public Employees()
        {
            fullName = null;
            date = null;
            salary = null;
        }
        public Employees(string hoTen, string date, double? luong)
        {
            this.fullName = hoTen;
            this.date = date;
            this.salary = luong;
        }
        public Double? Salary
        {
            get { return salary; }
            set { salary = value; }
        }
    }
    public class Employees_Office: Employees
    {

    } 
    internal class Program
    {
        static void Main(string[] args)
        {
        }
    }
}
