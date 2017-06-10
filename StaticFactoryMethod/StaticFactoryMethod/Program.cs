using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StaticFactoryMethod
{
    class Program
    {
        static void Main(string[] args)
        {
            try
            {
                Console.WriteLine("请输入第一个数：");
                double numberA = double.Parse(Console.ReadLine());
                Console.WriteLine("请输入第二个数：");
                double numberB = double.Parse(Console.ReadLine());
                Console.WriteLine("请输入操作符号：");
                string operate = Console.ReadLine();

                Operation oper = OperationFactory.CreateOperate(operate);
                oper.NumberA = numberA;
                oper.NumberB = numberB;
                double result = oper.GetResult();

                Console.WriteLine(numberA + operate + numberB + "=" + result);
                Console.ReadLine();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
