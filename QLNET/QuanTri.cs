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
    public partial class QuanTri : Form
    {
        SqlConnection conn = null;
        SqlDataAdapter adapter = null;
        SqlCommand cmd = null;
        DataTable dt = null;
        public QuanTri()
        {
            InitializeComponent();
        }
        string connection = "Data Source=DESKTOP-DHKSD76;Initial Catalog=QLNET_OFFICIAL;Persist Security Info=True;User ID=sa;Password=123456";

        private void loadQT()
        {
            conn = new SqlConnection(connection);
            string sql = "select * from view_QuanTri";
            conn.Open();
            cmd = new SqlCommand(sql, conn);
            adapter = new SqlDataAdapter(cmd);
            dt = new DataTable();
            adapter.Fill(dt);
            dataGridView1.DataSource = dt;
            txtAdmin.DataBindings.Clear();
            txtAdmin.DataBindings.Add("Text", dataGridView1.DataSource, "MaAdmin");
            txtMTK.DataBindings.Clear();
            txtMTK.DataBindings.Add("Text", dataGridView1.DataSource, "MaTK");
            dtpBD.DataBindings.Clear();
            dtpBD.DataBindings.Add("Text", dataGridView1.DataSource, "TgBatDau");
            dtpKT.DataBindings.Clear();
            dtpKT.DataBindings.Add("Text", dataGridView1.DataSource, "TgKetThuc");
            txtGC.DataBindings.Clear();
            txtGC.DataBindings.Add("Text", dataGridView1.DataSource, "GhiChu");
            txtTNAdmin.DataBindings.Clear();
            txtTNAdmin.DataBindings.Add("Text", dataGridView1.DataSource, "TinNhanAdmin");
            txtTNUser.DataBindings.Clear();
            txtTNUser.DataBindings.Add("Text", dataGridView1.DataSource, "TinNhanNguoiDung");
            conn.Close();
        }
        private void QuanTri_Load(object sender, EventArgs e)
        {
            loadQT();
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            cmd = new SqlCommand("sp_ThemQuanTri", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@maAdmin", SqlDbType.VarChar).Value = txtAdmin.Text;
            cmd.Parameters.Add("@maTK", SqlDbType.VarChar).Value = txtMTK.Text;
            cmd.Parameters.Add("@tgBatDau", SqlDbType.DateTime).Value = dtpBD.Value.ToString();
            cmd.Parameters.Add("@tgKetThuc", SqlDbType.DateTime).Value = !string.IsNullOrEmpty(dtpKT.Value.ToString()) ? dtpKT.Value.ToString() : (object)DBNull.Value;
            cmd.Parameters.Add("@ghiChu", SqlDbType.VarChar).Value = !string.IsNullOrEmpty(txtGC.Text) ? txtGC.Text : (object)DBNull.Value;
            cmd.Parameters.Add("@tinNhanAdmin", SqlDbType.NVarChar).Value = !string.IsNullOrEmpty(txtTNAdmin.Text) ? txtTNAdmin.Text : (object)DBNull.Value;
            cmd.Parameters.Add("@tinNhanNguoiDung", SqlDbType.NVarChar).Value = !string.IsNullOrEmpty(txtTNUser.Text) ? txtTNUser.Text : (object)DBNull.Value;
            adapter = new SqlDataAdapter(cmd);
            adapter.Fill(dt);
            loadQT();
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            cmd = new SqlCommand("sp_SuaQuanTri", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@maAdmin", SqlDbType.VarChar).Value = txtAdmin.Text;
            cmd.Parameters.Add("@maTK", SqlDbType.VarChar).Value = txtMTK.Text;
            cmd.Parameters.Add("@tgBatDau", SqlDbType.DateTime).Value = dtpBD.Value.ToString();
            cmd.Parameters.Add("@tgKetThuc", SqlDbType.DateTime).Value = !string.IsNullOrEmpty(dtpKT.Value.ToString()) ? dtpKT.Value.ToString() : (object)DBNull.Value;
            cmd.Parameters.Add("@ghiChu", SqlDbType.VarChar).Value = !string.IsNullOrEmpty(txtGC.Text) ? txtGC.Text : (object)DBNull.Value;
            cmd.Parameters.Add("@tinNhanAdmin", SqlDbType.NVarChar).Value = !string.IsNullOrEmpty(txtTNAdmin.Text) ? txtTNAdmin.Text : (object)DBNull.Value;
            cmd.Parameters.Add("@tinNhanNguoiDung", SqlDbType.NVarChar).Value = !string.IsNullOrEmpty(txtTNUser.Text) ? txtTNUser.Text : (object)DBNull.Value;
            adapter = new SqlDataAdapter(cmd);
            adapter.Fill(dt);
            loadQT();
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            cmd = new SqlCommand("sp_XoaQuanTri", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@maAdmin", SqlDbType.VarChar).Value = txtAdmin.Text;
            adapter = new SqlDataAdapter(cmd);
            adapter.Fill(dt);
            loadQT();
        }

        private void btnInit_Click(object sender, EventArgs e)
        {
            txtAdmin.Text = "";
            txtMTK.Text = "";
            txtTNAdmin.Text = "";
            txtTNUser.Text = "";
            txtGC.Text = "";
            dtpBD.Text = "1970/01/01";
            dtpKT.Text = "1970/01/01";
        }
    }
}
