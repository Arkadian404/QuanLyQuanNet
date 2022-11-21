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
    public partial class Login : Form
    {
        SqlConnection conn = null;
        SqlDataAdapter adapter = null;
        SqlCommand cmd = null;
        DataTable dt = null;
        public Login()
        {
            InitializeComponent();
        }
        string connection = "Data Source=DESKTOP-DHKSD76;Initial Catalog=QLNET_OFFICIAL;Persist Security Info=True;User ID=sa;Password=123456";
        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            conn = new SqlConnection(connection);
            conn.Open();
            cmd = new SqlCommand("sp_Login", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@taiKhoan", SqlDbType.VarChar).Value = txtTK.Text.Trim();
            cmd.Parameters.Add("@matKhau", SqlDbType.VarChar).Value = txtMK.Text.Trim();
            string status = cmd.ExecuteScalar().ToString();
            adapter = new SqlDataAdapter(cmd);
            dt = new DataTable();
            adapter.Fill(dt);
            conn.Close();
            if (status.Equals("admin")){ 
                Main main = new Main(status);
                this.Hide();
                main.ShowDialog();
                this.Close();
            }
            else if(status.StartsWith("tkvs") || status.StartsWith("tktn") || status.StartsWith("tkkt"))
            {
                Main main = new Main(status);
                main.thốngKêToolStripMenuItem.Enabled = false;
                main.đồĂnThứcUốngToolStripMenuItem.Enabled = false;
                main.máyTrạmToolStripMenuItem.Enabled = false;
                main.quảnLýCôngViệcToolStripMenuItem.Enabled = false;
                main.vaiTròCôngViệcToolStripMenuItem.Enabled = false;
                this.Hide();
                main.ShowDialog();
                this.Close();
            }
            else
                MessageBox.Show("Sai tài khoản hoặc mật khẩu", "Cảnh báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
        }

        private void Login_Load(object sender, EventArgs e)
        {

        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            DialogResult tb = MessageBox.Show("Bạn có muốn thoát?", "Thông báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Information);
            if (tb == DialogResult.OK)
                Application.Exit();
        }
    }
}
