using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QLNET
{
    public partial class Main : Form
    {
        public Main()
        {
            InitializeComponent();
        }
        String username;
        public Main(String s)
        {
            InitializeComponent();
            username = s;
        }

        

        private void Main_Load(object sender, EventArgs e)
        {

        }


        private void AddForm(Form f)
        {
            this.panel1.Controls.Clear();
            f.TopLevel = false;
            f.AutoScroll = false;
            f.FormBorderStyle = FormBorderStyle.None;
            f.Dock = DockStyle.Fill;
            this.panel1.Controls.Add(f);
            f.Show();
        }

        private void nhânViênToolStripMenuItem_Click(object sender, EventArgs e)
        {
            
            NhanVien nv = new NhanVien(username);
            
            AddForm(nv);
        }

        private void kháchHàngToolStripMenuItem_Click(object sender, EventArgs e)
        {
            KhachHang kh = new KhachHang(username);
            AddForm(kh);
        }

        private void kháchHàngVãngLaiToolStripMenuItem_Click(object sender, EventArgs e)
        {
            KHVL khvl = new KHVL(username);
            AddForm(khvl);
        }

        private void kháchHàngThườngXuyênToolStripMenuItem_Click(object sender, EventArgs e)
        {
            KHTX khtx = new KHTX(username);
            AddForm(khtx);
        }

        private void tàiKhoảnToolStripMenuItem_Click(object sender, EventArgs e)
        {
            TaiKhoan tk = new TaiKhoan(username);
            AddForm(tk);
        }

        private void máyTrạmToolStripMenuItem_Click(object sender, EventArgs e)
        {
            MayTinh mt = new MayTinh();
            AddForm(mt);
        }

        private void nhậtKýHoạtĐộngToolStripMenuItem_Click(object sender, EventArgs e)
        {
            QLCV qt = new QLCV();
            AddForm(qt);
        }

        private void đồĂnThứcUốngToolStripMenuItem_Click(object sender, EventArgs e)
        {
            ThucDon td = new ThucDon();
            AddForm(td);
        }

        private void toolStripComboBox1_Click(object sender, EventArgs e)
        {

        }

        private void vaiTròCôngViệcToolStripMenuItem_Click(object sender, EventArgs e)
        {
            VaiTroCongViec vtcv = new VaiTroCongViec();
            AddForm(vtcv);
        }

        private void quảnLýCôngViệcToolStripMenuItem_Click(object sender, EventArgs e)
        {
            QuanTri qlcv = new QuanTri();
            AddForm(qlcv);
        }

        private void bảngLươngToolStripMenuItem_Click(object sender, EventArgs e)
        {
            BangLuong bl = new BangLuong(username);
            AddForm(bl);
        }

        private void đăngXuấtToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Login lg = new Login();
            this.Hide();
            lg.ShowDialog();
            this.Close();
        }

        private void thốngKêToolStripMenuItem_Click(object sender, EventArgs e)
        {
            ThongKe tk = new ThongKe();
            tk.ShowDialog();
        }
    }
}
