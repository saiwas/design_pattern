using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace prototype
{
    /// <summary>
    /// 简历类
    /// </summary>
    class Resume : ICloneable
    {
        private string name;
        private string sex;
        private string age;

        private WorkExperience work=new WorkExperience();

        public Resume(string name)
        {
            this.name = name;
        }

        private Resume(WorkExperience work)
        {
            this.work = (WorkExperience)work.Clone();
        }
        /// <summary>
        /// 设置个人信息
        /// </summary>
        /// <param name="sex"></param>
        /// <param name="age"></param>
        public void SetPersonalInfo(string sex, string age)
        {
            this.age = age;
            this.sex = sex;
        }

        /// <summary>
        /// 设置工作经历
        /// </summary>
        /// <param name="timeArea"></param>
        /// <param name="company"></param>
        public void SetWorkExperience(string timeArea, string company)
        {
            work.WorkDate = timeArea;
            work.Company = company;
        }

        /// <summary>
        /// 显示
        /// </summary>
        public void Display()
        {
            Console.WriteLine("{0} {1} {2} ", name, sex, age);
            Console.WriteLine("工作经历： {0} {1}", work.WorkDate, work.Company);
        }

        public object Clone()
        {
            Resume obj = new Resume(this.work);
            obj.name = this.name;
            obj.sex = this.sex;
            obj.age = this.age;
            return obj;
        }
    }

    /// <summary>
    /// 工作经历类
    /// </summary>
    class WorkExperience : ICloneable
    {
        private string work_date;
        private string company;

        public string Company
        {
            get { return company; }
            set { company = value; }
        }
        public string WorkDate
        {
            get { return work_date; }
            set { work_date = value; }
        }


        public object Clone()
        {
            return (object)this.MemberwiseClone();
            //throw new NotImplementedException();
        }
    }
}
