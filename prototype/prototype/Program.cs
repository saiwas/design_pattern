using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace prototype
{
    class Program
    {
        static void Main(string[] args)
        {
            Resume a = new Resume("测试用户");
            a.SetPersonalInfo("男", "21");
            a.SetWorkExperience("1998-2000", "XX公司");

            Resume b = (Resume)a.Clone();
            b.SetWorkExperience("1998-2006", "YY公司");

            Resume c = (Resume)a.Clone();
            c.SetPersonalInfo("男", "24");
            c.SetWorkExperience("1998-2003", "zz公司");

            a.Display();
            b.Display();
            c.Display();

            Console.Read();
        }
    }
}
