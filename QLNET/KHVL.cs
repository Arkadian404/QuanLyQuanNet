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
    public partial class KHVL : Form
    {
        SqlConnection conn = null;
        SqlDataAdapter adapter = null;
        SqlCommand cmd = null;
        DataTable dt = null;
        SqlDataReader dr = null;
        public KHVL()
        {
            InitializeComponent();
        }

        public KHVL(String s)
        {
            InitializeComponent();
            username = s;
        }
        String username;
        string connection = "Data Source=DESKTOP-DHKSD76;Initial Catalog=QLNET_OFFICIAL;Persist Security Info=True;User ID=sa;Password=123456";

        private void loadVL()
        {
            conn = new SqlConnection(connection);
            string sql = "select * from view_KHVL";
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
            txtTG.DataBindings.Clear();
            txtTG.DataBindings.Add("Text", dataGridView1.DataSource, "TienGio");
            conn.Close();
        }

        private void KHVL_Load(object sender, EventArgs e)
        {
            if (username.StartsWith("tkvs") || username.StartsWith("tktn") || username.StartsWith("tkkt"))
                btnEdit.Enabled = false;
            else
                btnEdit.Enabled = true;
            loadVL();
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            cmd = new SqlCommand("sp_ThemKHVL", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@maKH", SqlDbType.VarChar).Value = txtMKH.Text;
            cmd.Parameters.Add("@tienGio", SqlDbType.Real).Value = txtTG.Text;
            adapter = new SqlDataAdapter(cmd);
            adapter.Fill(dt);
            loadVL();
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            cmd = new SqlCommand("sp_SuaKHVL", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@id", SqlDbType.VarChar).Value =  txtID.Text;
            cmd.Parameters.Add("@maKH", SqlDbType.VarChar).Value = txtMKH.Text;
            cmd.Parameters.Add("@tienGio", SqlDbType.Real).Value = txtTG.Text;
            adapter = new SqlDataAdapter(cmd);
            adapter.Fill(dt);
            loadVL();
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            cmd = new SqlCommand("sp_XoaKHVL", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = txtID.Text;
            adapter = new SqlDataAdapter(cmd);
            adapter.Fill(dt);
            loadVL();
        }

        private void btnInit_Click(object sender, EventArgs e)
        {
            txtID.Text = "";
            txtMKH.Text = "";
            txtTG.Text = "";
        }
    }
}
