using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace strategy2
{
    /// <summary>
    /// 现金收费抽象类
    /// </summary>
    abstract class CashSuper
    {
        public abstract double AcceptCash(double money);
    }

    /// <summary>
    /// 正常收费子类
    /// </summary>
    class CashNormal : CashSuper
    {
        public override double AcceptCash(double money)
        {
            return money;
            //throw new NotImplementedException();
        }
    }

    /// <summary>
    /// 打折收费子类
    /// </summary>
    class CashRebate : CashSuper
    {
        private double moneyRebate = 1d;
        public CashRebate(string moneyRebate)
        {
            this.moneyRebate = double.Parse(moneyRebate);
        }

        public override double AcceptCash(double money)
        {
            return money * moneyRebate;
            //throw new NotImplementedException();
        }
    }

    /// <summary>
    /// 返利收费子类
    /// </summary>
    class CashReturn : CashSuper
    {
        private double moneyCondition = 0.0d;
        private double moneyReturn = 0.0d;

        public CashReturn(string moneyCondition, string moneyReturn)
        {
            this.moneyCondition = double.Parse(moneyCondition);
            this.moneyReturn = double.Parse(moneyReturn);
        }

        public override double AcceptCash(double money)
        {
            double result = money;
            if (money >= moneyCondition)
                result = money - Math.Floor(money / moneyCondition) * moneyReturn;
            return result;
            //throw new NotImplementedException();
        }
    }

    class CashContext
    {
        private CashSuper cs = null;

        public CashContext(string type)
        {
            switch (type)
            {
                case "正常收费":
                    this.cs = new CashNormal();
                    break;
                case "满300 返100":
                    this.cs = new CashReturn("300", "100");
                    break;
                case "打8折":
                    this.cs = new CashRebate("0.8");
                    break;
                default:
                    break;
            }
        }

        public double GetResult(double money)
        {
            return cs.AcceptCash(money);
        }
    }
}
