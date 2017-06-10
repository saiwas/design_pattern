using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace decorator
{
    /// <summary>
    /// Person类(ConcreteComponent)
    /// </summary>
    class Person
    {
        public Person()
        {

        }

        private string name;
        public Person(string name)
        {
            this.name = name;
        }

        public virtual void Show()
        {
            Console.WriteLine("装扮的{0}", name);
        }
    }

    /// <summary>
    /// 服饰类(Decorator)
    /// </summary>
    class Finery : Person
    {
        protected Person component;

        public void Decorate(Person component)
        {
            this.component = component;
        }

        public override void Show()
        {
            if (component != null)
                component.Show();
            //base.Show();
        }
    }

    //具体服侍类（ConcerteDecorator）
    class TShirt : Finery
    {
        public override void Show()
        {
            Console.Write(" 大T ");
            base.Show();
        }
    }

    class BigTrouser : Finery
    {
        public override void Show()
        {
            Console.Write(" 跨裤 ");
            base.Show();
        }
    }

    class Sneakers : Finery
    {
        public override void Show()
        {
            Console.Write(" 破球鞋 ");
            base.Show();
        }
    }
}
