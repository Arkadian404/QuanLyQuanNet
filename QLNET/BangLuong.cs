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

    public partial class BangLuong : Form
    {
        SqlCommand cmd = null;
        SqlDataAdapter adapter = null;
        DataTable dt = null;
        SqlConnection conn = null;
        SqlDataReader dr = null;
        public BangLuong()
        {
            InitializeComponent();
        }

        public BangLuong(String s)
        {
            InitializeComponent();
            username = s;
        }
        String username;
        string connection = "Data Source=DESKTOP-DHKSD76;Initial Catalog=QLNET_OFFICIAL;Persist Security Info=True;User ID=sa;Password=123456";


        private void LoadBL()
        {
            conn = new SqlConnection(connection);
            string sql = "select * from view_BangLuong";
            conn.Open();
            cmd = new SqlCommand(sql, conn);
            adapter = new SqlDataAdapter(cmd);
            dt = new DataTable();
            adapter.Fill(dt);
            dataGridView1.DataSource = dt;
            txtML.DataBindings.Clear();
            txtML.DataBindings.Add("Text", dataGridView1.DataSource, "MaLuong");
            txtVT.DataBindings.Clear();
            txtVT.DataBindings.Add("Text", dataGridView1.DataSource, "VaiTro");
            txtLTG.DataBindings.Clear();
            txtLTG.DataBindings.Add("Text", dataGridView1.DataSource, "LuongTheoGio");
            IList<string> listHT = new List<string>();
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                listHT.Add(dr[3].ToString());
            }
            listHT = listHT.Distinct().ToList();
            cbHT.DataSource = listHT;
            cbHT.DisplayMember = "HinhThuc";
            conn.Close();
        }

        private void BangLuong_Load(object sender, EventArgs e)
        {
            if (username.StartsWith("tkvs") || username.StartsWith("tktn") || username.StartsWith("tkkt"))
                btnEdit.Enabled = false;
            else
                btnEdit.Enabled = true;
            LoadBL();
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            cmd = new SqlCommand("sp_ThemBangLuong", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@maLuong", SqlDbType.VarChar).Value = txtML.Text;
            cmd.Parameters.Add("@vaiTro", SqlDbType.NVarChar).Value = txtVT.Text;
            cmd.Parameters.Add("@luongTheoGio", SqlDbType.Real).Value = float.Parse(txtLTG.Text);
            cmd.Parameters.Add("@hinhThuc", SqlDbType.NVarChar).Value = cbHT.SelectedItem.ToString();
            adapter = new SqlDataAdapter(cmd);
            adapter.Fill(dt);
            LoadBL();
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            cmd = new SqlCommand("sp_SuaBangLuong", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@maLuong", SqlDbType.VarChar).Value = txtML.Text;
            cmd.Parameters.Add("@vaiTro", SqlDbType.NVarChar).Value = txtVT.Text;
            cmd.Parameters.Add("@luongTheoGio", SqlDbType.Real).Value = float.Parse(txtLTG.Text);
            cmd.Parameters.Add("@hinhThuc", SqlDbType.NVarChar).Value = cbHT.SelectedItem.ToString();
            adapter = new SqlDataAdapter(cmd);
            adapter.Fill(dt);
            LoadBL();
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            cmd = new SqlCommand("sp_XoaBangLuong", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@maLuong", SqlDbType.VarChar).Value = txtML.Text;
            adapter = new SqlDataAdapter(cmd);
            adapter.Fill(dt);
            LoadBL();
        }

        private void btnInit_Click(object sender, EventArgs e)
        {
            txtML.Text = "";
            txtLTG.Text = "";
            txtVT.Text = "";
            cbHT.SelectedIndex = 0;
        }

        private void txtML_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
