using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Point
{
    public class Poin
    {
        private double x { get; set; }
        private double y { get; set; }
        private string color { get; set; }
        public Poin(double x, double y, string color)
        {
            this.x = x;
            this.y = y;
            this.color = color;
        }
        public void Move(double dx, double dy)
        {
            x += dx;
            y += dy;
        }
    }
        internal class Program
    {
        static void Main(string[] args)
        {
        }
    }
}
