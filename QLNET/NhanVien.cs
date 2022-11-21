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
    public partial class NhanVien : Form
    {
        SqlConnection conn = null;
        SqlDataAdapter adapter = null;
        SqlCommand cmd = null;
        DataTable dt = null;
        SqlDataReader dr = null;
        public NhanVien()
        {
            InitializeComponent();
        }
        String username;
        public NhanVien(String s)
        {
            InitializeComponent();
            username = s;
        }


        string connection = "Data Source=DESKTOP-DHKSD76;Initial Catalog=QLNET_OFFICIAL;Persist Security Info=True;User ID=sa;Password=123456";

        private void LoadNV()
        {
            conn = new SqlConnection(connection);
            string sql = "select * from view_NhanVien";
            conn.Open();
            cmd = new SqlCommand(sql, conn);
            adapter = new SqlDataAdapter(cmd);
            dt = new DataTable();
            adapter.Fill(dt);
            dataGridView1.DataSource = dt;
            dr = cmd.ExecuteReader();
            IList<String> GT = new List<String>();
            IList<String> VH = new List<String>();
            IList<String> HV = new List<String>();
            
            txtMNV.DataBindings.Clear();
            txtMNV.DataBindings.Add("Text", dataGridView1.DataSource, "MaNV");
            txtML.DataBindings.Clear();
            txtML.DataBindings.Add("Text", dataGridView1.DataSource, "MaLuong");
            txtMCV.DataBindings.Clear();
            txtMCV.DataBindings.Add("Text", dataGridView1.DataSource, "MaCV");
            txtTK.DataBindings.Clear();
            txtTK.DataBindings.Add("Text", dataGridView1.DataSource, "MaTK");
            txtHT.DataBindings.Clear();
            txtHT.DataBindings.Add("Text", dataGridView1.DataSource, "HoTen");
            txtTuoi.DataBindings.Clear();
            txtTuoi.DataBindings.Add("Text", dataGridView1.DataSource, "Tuoi");
            txtQQ.DataBindings.Clear();
            txtQQ.DataBindings.Add("Text", dataGridView1.DataSource, "QueQuan");
            txtSDT.DataBindings.Clear();
            txtSDT.DataBindings.Add("Text", dataGridView1.DataSource, "SDT");
            txtKN.DataBindings.Clear();
            txtKN.DataBindings.Add("Text", dataGridView1.DataSource, "SoNamKN");
            while (dr.Read())
            {
                GT.Add(dr["GioiTinh"].ToString());
                VH.Add(dr["TrinhDoVH"].ToString());
                HV.Add(dr["TrinhDoHV"].ToString());
            }
            GT = GT.Distinct().ToList();
            VH = VH.Distinct().ToList();
            HV = HV.Distinct().ToList();
            cbGT.DataSource = GT;
            cbVH.DataSource = VH;
            cbHV.DataSource = HV;
            conn.Close();
        }

        private void lbCV_Click(object sender, EventArgs e)
        {

        }

     

        

        private void NhanVien_Load(object sender, EventArgs e)
        {
            if (username.StartsWith("tkvs") || username.StartsWith("tktn") || username.StartsWith("tkkt"))
                btnEdit.Enabled = false;
            else
                btnEdit.Enabled = true;
            LoadNV();
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            cmd = new SqlCommand("sp_ThemNhanVien", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@maNV", SqlDbType.VarChar).Value = txtMNV.Text;
            cmd.Parameters.Add("@maLuong", SqlDbType.VarChar).Value = txtML.Text;
            cmd.Parameters.Add("@maCV", SqlDbType.VarChar).Value = txtMCV.Text;
            cmd.Parameters.Add("@maTK", SqlDbType.VarChar).Value = txtTK.Text;
            cmd.Parameters.Add("@hoTen", SqlDbType.NVarChar).Value = txtHT.Text;
            cmd.Parameters.Add("@tuoi", SqlDbType.Int).Value = Int32.Parse(txtTuoi.Text);
            cmd.Parameters.Add("@gioiTinh", SqlDbType.VarChar).Value = cbGT.SelectedItem.ToString();
            cmd.Parameters.Add("@queQuan", SqlDbType.NVarChar).Value = txtQQ.Text;
            cmd.Parameters.Add("@SDT", SqlDbType.VarChar).Value = txtSDT.Text;
            cmd.Parameters.Add("@trinhDoVH", SqlDbType.VarChar).Value = cbVH.SelectedItem.ToString();
            cmd.Parameters.Add("@trinhDoHV", SqlDbType.VarChar).Value = cbHV.SelectedItem.ToString();
            cmd.Parameters.Add("@soNamKN", SqlDbType.Int).Value = Int32.Parse(txtKN.Text);
            adapter = new SqlDataAdapter(cmd);
            adapter.Fill(dt);
            LoadNV();
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            cmd = new SqlCommand("sp_SuaNhanVien", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@maNV", SqlDbType.VarChar).Value = txtMNV.Text;
            cmd.Parameters.Add("@maLuong", SqlDbType.VarChar).Value = txtML.Text;
            cmd.Parameters.Add("@maCV", SqlDbType.VarChar).Value = txtMCV.Text;
            cmd.Parameters.Add("@maTK", SqlDbType.VarChar).Value = txtTK.Text;
            cmd.Parameters.Add("@hoTen", SqlDbType.NVarChar).Value = txtHT.Text;
            cmd.Parameters.Add("@tuoi", SqlDbType.Int).Value = Int32.Parse(txtTuoi.Text);
            cmd.Parameters.Add("@gioiTinh", SqlDbType.VarChar).Value = cbGT.SelectedItem.ToString();
            cmd.Parameters.Add("@queQuan", SqlDbType.NVarChar).Value = txtQQ.Text;
            cmd.Parameters.Add("@SDT", SqlDbType.VarChar).Value = txtSDT.Text;
            cmd.Parameters.Add("@trinhDoVH", SqlDbType.VarChar).Value = cbVH.SelectedItem.ToString();
            cmd.Parameters.Add("@trinhDoHV", SqlDbType.VarChar).Value = cbHV.SelectedItem.ToString();
            cmd.Parameters.Add("@soNamKN", SqlDbType.Int).Value = Int32.Parse(txtKN.Text);
            adapter = new SqlDataAdapter(cmd);
            adapter.Fill(dt);
            LoadNV();
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            cmd = new SqlCommand("sp_XoaNhanVien", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@maNV", SqlDbType.VarChar).Value = txtMNV.Text;
            adapter = new SqlDataAdapter(cmd);
            adapter.Fill(dt);
            LoadNV();
        }

        private void btnInit_Click(object sender, EventArgs e)
        {
            txtMNV.Text = "";
            txtML.Text = "";
            txtMCV.Text = "";
            txtTK.Text = "";
            txtHT.Text = "";
            txtQQ.Text = "";
            txtSDT.Text = "";
            txtKN.Text = "";
            txtTuoi.Text = "";
            cbGT.SelectedIndex = -1;
            cbHV.SelectedIndex = -1;
            cbHV.SelectedIndex = -1;
        }
    }
}
