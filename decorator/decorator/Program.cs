using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace decorator
{
    class Program
    {
        static void Main(string[] args)
        {
            Person xc = new Person("测试用户");

            Console.WriteLine("\n 第一种装扮：");

            Sneakers pqx = new Sneakers();
            BigTrouser kk = new BigTrouser();
            TShirt dtx = new TShirt();

            pqx.Decorate(xc);
            kk.Decorate(pqx);
            dtx.Decorate(kk);

            dtx.Show();

            Console.Read();
        }
    }
}
