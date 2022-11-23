using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QLNET
{
    public partial class UuDai : Form
    {
        SqlCommand cmd = null;
        SqlDataAdapter adapter = null;
        DataTable dt = null;
        SqlConnection conn = null;
        public UuDai()
        {
            InitializeComponent();
        }
        string connection = "Data Source=DESKTOP-DHKSD76;Initial Catalog=QLNET_OFFICIAL;Persist Security Info=True;User ID=sa;Password=123456";

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void loadUD()
        {
            conn = new SqlConnection(connection);
            string sql = "select * from view_UuDai";
            conn.Open();
            cmd = new SqlCommand(sql, conn);
            adapter = new SqlDataAdapter(cmd);
            dt = new DataTable();
            adapter.Fill(dt);
            dataGridView1.DataSource = dt;
            txtMUD.DataBindings.Clear();
            txtMUD.DataBindings.Add("Text", dataGridView1.DataSource, "MaUuDai");
            txtPTG.DataBindings.Clear();
            txtPTG.DataBindings.Add("Text", dataGridView1.DataSource, "PhanTramTangThem");
            txtGC.DataBindings.Clear();
            txtGC.DataBindings.Add("Text", dataGridView1.DataSource, "GhiChu");
            conn.Close();
        }

        private void UuDai_Load(object sender, EventArgs e)
        {
            loadUD();
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            cmd = new SqlCommand("sp_ThemUuDai", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@maUuDai", SqlDbType.VarChar).Value = txtMUD.Text;
            cmd.Parameters.Add("@phanTramTangThem", SqlDbType.Real).Value = float.Parse(txtPTG.Text);
            cmd.Parameters.Add("@ghiChu", SqlDbType.VarChar).Value = txtGC.Text;
            adapter = new SqlDataAdapter(cmd);
            adapter.Fill(dt);
            loadUD();
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            cmd = new SqlCommand("sp_SuaUuDai", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@maUuDai", SqlDbType.VarChar).Value = txtMUD.Text;
            cmd.Parameters.Add("@phanTramTangThem", SqlDbType.Real).Value = float.Parse(txtPTG.Text);
            cmd.Parameters.Add("@ghiChu", SqlDbType.VarChar).Value = txtGC.Text;
            adapter = new SqlDataAdapter(cmd);
            adapter.Fill(dt);
            loadUD();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            cmd = new SqlCommand("sp_XoaUuDai", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@maUuDai", SqlDbType.VarChar).Value = txtMUD.Text;
            adapter = new SqlDataAdapter(cmd);
            adapter.Fill(dt);
            loadUD();
        }

        private void btnInit_Click(object sender, EventArgs e)
        {
            txtMUD.Text = "";
            txtPTG.Text = "";
            txtGC.Text = "";
        }
    }
}
