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
    public partial class KHTX : Form
    {
        SqlConnection conn = null;
        SqlDataAdapter adapter = null;
        SqlCommand cmd = null;
        DataTable dt = null;
        SqlDataReader dr = null;
        public KHTX()
        {
            InitializeComponent();
        }

        public KHTX(String s)
        {
            InitializeComponent();
            username = s;
        }
        String username;
        string connection = "Data Source=DESKTOP-DHKSD76;Initial Catalog=QLNET_OFFICIAL;Persist Security Info=True;User ID=sa;Password=123456";


        private void loadTX()
        {
            conn = new SqlConnection(connection);
            string sql = "select * from view_KHTX";
            conn.Open();
            cmd = new SqlCommand(sql, conn);
            adapter = new SqlDataAdapter(cmd);
            dt = new DataTable();
            adapter.Fill(dt);
            dataGridView1.DataSource = dt;
            txtID.ReadOnly = true;
            txtID.DataBindings.Clear();
            txtID.DataBindings.Add("Text", dataGridView1.DataSource, "ID");
            txtMKH.DataBindings.Clear();
            txtMKH.DataBindings.Add("Text", dataGridView1.DataSource, "MaKH");
            txtMUD.DataBindings.Clear();
            txtMUD.DataBindings.Add("Text", dataGridView1.DataSource, "MaUuDai");
            txtSTN.DataBindings.Clear();
            txtSTN.DataBindings.Add("Text", dataGridView1.DataSource, "SoTienNap");
            txtTG.DataBindings.Clear();
            txtTG.DataBindings.Add("Text", dataGridView1.DataSource, "TienGio");
            txtTTG.DataBindings.Clear();
            txtTTG.DataBindings.Add("Text", dataGridView1.DataSource, "TongThoiGian");
            conn.Close();
        }
        private void KHTX_Load(object sender, EventArgs e)
        {
            if (username.StartsWith("tkvs") || username.StartsWith("tktn") || username.StartsWith("tkkt"))
                btnEdit.Enabled = false;
            else
                btnEdit.Enabled = true;
            loadTX();
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            cmd = new SqlCommand("sp_ThemKHTX", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@maKH", SqlDbType.VarChar).Value = txtMKH.Text;
            cmd.Parameters.Add("@maUuDai", SqlDbType.VarChar).Value = !string.IsNullOrEmpty(txtMUD.Text) ? txtMUD.Text : (object)DBNull.Value;
            cmd.Parameters.Add("@soTienNap", SqlDbType.Float).Value =!string.IsNullOrEmpty(txtSTN.Text)? float.Parse(txtSTN.Text) : (object)DBNull.Value;
            cmd.Parameters.Add("@tienGio", SqlDbType.Float).Value = !string.IsNullOrEmpty(txtTG.Text) ? float.Parse(txtTG.Text) : (object)DBNull.Value;
            cmd.Parameters.Add("@tongThoiGian", SqlDbType.Float).Value = !string.IsNullOrEmpty(txtTTG.Text) ? float.Parse(txtTTG.Text) : (object)DBNull.Value;
            adapter = new SqlDataAdapter(cmd);
            adapter.Fill(dt);
            loadTX();
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            cmd = new SqlCommand("sp_SuaKHTX", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = txtID.Text;
            cmd.Parameters.Add("@maKH", SqlDbType.VarChar).Value = txtMKH.Text;
            cmd.Parameters.Add("@maUuDai", SqlDbType.VarChar).Value = !string.IsNullOrEmpty(txtMUD.Text) ? txtMUD.Text : (object)DBNull.Value;
            cmd.Parameters.Add("@soTienNap", SqlDbType.Float).Value = !string.IsNullOrEmpty(txtSTN.Text) ? float.Parse(txtSTN.Text) : (object)DBNull.Value;
            cmd.Parameters.Add("@tienGio", SqlDbType.Float).Value = !string.IsNullOrEmpty(txtTG.Text) ? float.Parse(txtTG.Text) : (object)DBNull.Value;
            cmd.Parameters.Add("@tongThoiGian", SqlDbType.Float).Value = !string.IsNullOrEmpty(txtTTG.Text) ? float.Parse(txtTTG.Text) : (object)DBNull.Value;
            adapter = new SqlDataAdapter(cmd);
            adapter.Fill(dt);
            loadTX();
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            cmd = new SqlCommand("sp_XoaKHTX", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = txtID.Text;
            adapter = new SqlDataAdapter(cmd);
            adapter.Fill(dt);
            loadTX();
        }

        private void btnInit_Click(object sender, EventArgs e)
        {
            txtID.Text = "";
            txtMKH.Text = "";
            txtMUD.Text = "";
            txtSTN.Text = "";
            txtTG.Text = "";
            txtTTG.Text = "";
        }
    }
}
