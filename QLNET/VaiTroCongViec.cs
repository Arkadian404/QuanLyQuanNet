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
    public partial class VaiTroCongViec : Form
    {
        SqlConnection conn = null;
        SqlCommand cmd = null;
        SqlDataAdapter adapter = null;
        DataTable dt = null;


        public VaiTroCongViec()
        {
            InitializeComponent();
        }
        public string connectionString = "Data Source=DESKTOP-DHKSD76;Initial Catalog=QLNET_OFFICIAL;Persist Security Info=True;User ID=sa;Password=123456";
        private void LoadCongViec()
        {
            conn = new SqlConnection(connectionString);
            conn.Open();
            string sql = "select * from view_CongViec";
            cmd = new SqlCommand(sql,conn);
            adapter = new SqlDataAdapter(cmd);
            dt = new DataTable();
            adapter.Fill(dt);
            dataGridView1.DataSource = dt;
            txtMCV.DataBindings.Clear();
            txtMCV.DataBindings.Add("Text", dataGridView1.DataSource, "MaCV");
            txtTCV.DataBindings.Clear();
            txtTCV.DataBindings.Add("Text", dataGridView1.DataSource, "TenCV");
            conn.Close();
        }

        private void VaiTroCongViec_Load(object sender, EventArgs e)
        {
            LoadCongViec();
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            cmd = new SqlCommand("sp_ThemCongViec", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@maCV", SqlDbType.Char).Value = txtMCV.Text;
            cmd.Parameters.Add("@tenCV", SqlDbType.NVarChar).Value = txtTCV.Text;
            adapter = new SqlDataAdapter(cmd);
            adapter.Fill(dt);
            dataGridView1.DataSource = dt;
            LoadCongViec();
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            cmd = new SqlCommand("sp_SuaCongViec", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@maCV", SqlDbType.Char).Value = txtMCV.Text;
            cmd.Parameters.Add("@tenCV", SqlDbType.NVarChar).Value = txtTCV.Text;
            adapter = new SqlDataAdapter(cmd);
            adapter.Fill(dt);
            dataGridView1.DataSource = dt;
            LoadCongViec();
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            cmd = new SqlCommand("sp_XoaCongViec", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@maCV", SqlDbType.Char).Value = txtMCV.Text;
            adapter = new SqlDataAdapter(cmd);
            adapter.Fill(dt);
            dataGridView1.DataSource = dt;
            LoadCongViec();
        }

        private void btnInit_Click(object sender, EventArgs e)
        {
            txtMCV.Text = "";
            txtTCV.Text = "";
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            int i;
            i = dataGridView1.CurrentCell.RowIndex;
            txtMCV.Text = dataGridView1.Rows[i].Cells[0].Value.ToString();
            txtTCV.Text = dataGridView1.Rows[i].Cells[1].Value.ToString();
        }
    }
}
