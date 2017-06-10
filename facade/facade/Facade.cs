using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Facade
{
    class SubSystemOne
    {
        public void MethodOne()
        {
            Console.WriteLine(" 子系统方法1");
        }
    }

    class SubSystemTwo
    {
        public void MethodTwo()
        {
            Console.WriteLine(" 子系统方法2");
        }
    }
    class SubSystemThree
    {
        public void MethodThree()
        {
            Console.WriteLine(" 子系统方法3");
        }
    }
    class SubSystemFour
    {
        public void MethodFour()
        {
            Console.WriteLine(" 子系统方法4");
        }
    }

    /// <summary>
    /// 外观类
    /// </summary>
    class Facade
    {
        SubSystemOne one;
        SubSystemTwo two;
        SubSystemThree three;
        SubSystemFour four;

        public Facade()
        {
            one = new SubSystemOne();
            two = new SubSystemTwo();
            three = new SubSystemThree();
            four = new SubSystemFour();
        }

        public void MethodA()
        {
            Console.WriteLine("\n 方法组A() ---- ");

            one.MethodOne();
            two.MethodTwo();
            four.MethodFour();
        }

        public void MethodB()
        {
            Console.WriteLine("\n 方法组B() ---- ");

            two.MethodTwo();
            three.MethodThree();
        }
    }
}
