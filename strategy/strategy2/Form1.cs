using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace strategy2
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private double total = 0.0d; //用于总计
        private void button1_Click(object sender, EventArgs e)
        {
            if (comboBox1.SelectedItem != null)
            {
                CashContext cc = new CashContext(comboBox1.SelectedItem.ToString());
                double totalPrices = 0d;
                totalPrices = cc.GetResult(Convert.ToDouble(textBox1.Text.Trim()) * Convert.ToDouble(textBox2.Text.Trim()));

                total += totalPrices;

                listBox1.Items.Add("单价：" + textBox1.Text.Trim() + " 数量：" + textBox2.Text.Trim() + " " + comboBox1.SelectedItem.ToString() + " 合计：" + totalPrices);
                label4.Text = "合计：" + total;
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            total = 0.0d;
            label4.Text = "合计：";
            listBox1.Items.Clear();
            textBox2.Clear();
            textBox1.Clear();
            comboBox1.SelectedIndex = -1;
            textBox1.Focus();
        }
    }
}
