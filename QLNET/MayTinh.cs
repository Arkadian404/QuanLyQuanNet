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
    public partial class MayTinh : Form
    {
        SqlConnection conn = null;
        SqlDataAdapter adapter = null;
        SqlCommand cmd = null;
        DataTable dt = null;
        SqlDataReader dr = null;
        public MayTinh()
        {
            InitializeComponent();
        }
        string connection = "Data Source=DESKTOP-DHKSD76;Initial Catalog=QLNET_OFFICIAL;Persist Security Info=True;User ID=sa;Password=123456";
        

        private void LoadMayTinh()
        {
            conn = new SqlConnection(connection);
            string sql = "select * from view_MayTinh";
            conn.Open();
            cmd = new SqlCommand(sql, conn);
            adapter = new SqlDataAdapter(cmd);
            dt = new DataTable();
            adapter.Fill(dt);
            dataGridView1.DataSource = dt;
            txtMM.DataBindings.Clear();
            txtMM.DataBindings.Add("Text", dataGridView1.DataSource, "MaMay");
            txtHM.DataBindings.Clear();
            txtHM.DataBindings.Add("Text", dataGridView1.DataSource, "Hang");
            IList<string> list = new List<string>();
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                list.Add(dr[2].ToString());
            }
            list = list.Distinct().ToList();
            cbTT.DataSource = list;
            cbTT.DisplayMember = "TrangThai";
            txtGT.DataBindings.Clear();
            txtGT.DataBindings.Add("Text", dataGridView1.DataSource, "GiaTien");
            conn.Close();
        }


        private void MayTinh_Load(object sender, EventArgs e)
        {
            LoadMayTinh();
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            cmd = new SqlCommand("sp_ThemMayTinh", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@maMay", SqlDbType.Char).Value = txtMM.Text;
            cmd.Parameters.Add("@hang", SqlDbType.VarChar).Value = txtHM.Text;
            cmd.Parameters.Add("@trangThai", SqlDbType.Char).Value = cbTT.SelectedItem.ToString();
            cmd.Parameters.Add("@giaTien", SqlDbType.Int).Value = Int32.Parse(txtGT.Text.ToString());
            adapter = new SqlDataAdapter(cmd);
            adapter.Fill(dt);
            dataGridView1.DataSource = dt;
            LoadMayTinh();
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            cmd = new SqlCommand("sp_SuaMayTinh", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@maMay", SqlDbType.Char).Value = txtMM.Text;
            cmd.Parameters.Add("@hang", SqlDbType.VarChar).Value = txtHM.Text;
            cmd.Parameters.Add("@trangThai", SqlDbType.Char).Value = cbTT.SelectedItem.ToString();
            cmd.Parameters.Add("@giaTien", SqlDbType.Int).Value = Int32.Parse(txtGT.Text.ToString());
            adapter = new SqlDataAdapter(cmd);
            adapter.Fill(dt);
            dataGridView1.DataSource = dt;
            LoadMayTinh();
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            cmd = new SqlCommand("sp_XoaMayTinh", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@maMay", SqlDbType.Char).Value = txtMM.Text;
            adapter = new SqlDataAdapter(cmd);
            adapter.Fill(dt);
            dataGridView1.DataSource = dt;
            LoadMayTinh();
        }

        private void btnInit_Click(object sender, EventArgs e)
        {
            txtMM.Text = "";
            txtHM.Text = "";
            cbTT.SelectedIndex = -1;
            txtGT.Text = "0";
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            //int i;
            //i = dataGridView1.CurrentCell.RowIndex;
            //txtMM.Text = dataGridView1.Rows[i].Cells[0].Value.ToString();
            //txtHM.Text = dataGridView1.Rows[i].Cells[1].Value.ToString();
            //cbTT.SelectedItem = dataGridView1.Rows[i].Cells[2].Value.ToString();
            //txtGT.Text = dataGridView1.Rows[i].Cells[3].Value.ToString();
        }
    }
}
