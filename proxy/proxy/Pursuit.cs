using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace proxy
{
    /// <summary>
    /// 被追求者类
    /// </summary>
    class SchoolGirl
    {
        private string name;

        public string Name
        {
            get { return name; }
            set { name = value; }
        }
    }

    /// <summary>
    /// 代理接口
    /// </summary>
    interface IGiveGift
    {
        void GiveDolls();
        void GiveFlowers();
        void GiveChocolate();
    }

    /// <summary>
    /// 追求者类
    /// </summary>
    class Pursuit : IGiveGift
    {
        SchoolGirl mm;
        public Pursuit(SchoolGirl mm)
        {
            this.mm = mm;
        }
        public void GiveDolls()
        {
            Console.WriteLine(" 送{0}洋娃娃",mm.Name);
        }

        public void GiveFlowers()
        {
            Console.WriteLine(" 送{0}鲜花", mm.Name);
        }

        public void GiveChocolate()
        {
            Console.WriteLine(" 送{0}巧克力", mm.Name);
        }
    }

    /// <summary>
    /// 代理类
    /// </summary>
    class Proxy : IGiveGift
    {
        Pursuit gg;

        public Proxy(SchoolGirl mm)
        {
            gg = new Pursuit(mm);
        }

        public void GiveDolls()
        {
            gg.GiveDolls();
        }

        public void GiveFlowers()
        {
            gg.GiveFlowers();
        }

        public void GiveChocolate()
        {
            gg.GiveChocolate();
        }
    }
}
