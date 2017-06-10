using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace proxy
{
    class Program
    {
        static void Main(string[] args)
        {
            SchoolGirl test_mm = new SchoolGirl();

            test_mm.Name = "测试用户mm";

            Proxy daili = new Proxy(test_mm);

            daili.GiveDolls();
            daili.GiveFlowers();
            daili.GiveChocolate();

            Console.Read();
        }
    }
}
