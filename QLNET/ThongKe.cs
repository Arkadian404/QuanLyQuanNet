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
    public partial class ThongKe : Form
    {
        SqlConnection conn = null;
        SqlDataAdapter adapter = null;
        SqlCommand cmd = null;
        DataTable dt = null;
        SqlDataReader dr = null;
        public ThongKe()
        {
            InitializeComponent();
        }
        string connection = "Data Source=DESKTOP-DHKSD76;Initial Catalog=QLNET_OFFICIAL;Persist Security Info=True;User ID=sa;Password=123456";
        private void chartPie_Click(object sender, EventArgs e)
        {

        }

        private void PieChart()
        {
            conn = new SqlConnection(connection);
            conn.Open();
            string sql = "select TenMon, DaBan from THUCDON order by DaBan desc";
            IList<String> name = new List<String>();
            IList<int> quantity = new List<int>();
            cmd = new SqlCommand(sql, conn);
            adapter = new SqlDataAdapter(cmd);
            dt = new DataTable();
            adapter.Fill(dt);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                name.Add(dr["TenMon"].ToString());
                quantity.Add(Convert.ToInt32(dr["DaBan"].ToString()));
            }
            chartPie.Titles.Add("Biểu đồ tròn thể hiện số lượng đồ ăn thức uống đã bán ra");
            chartPie.Series["s1"].IsValueShownAsLabel = true;
            int i = 0;
            while (i < name.Count())
            {
                chartPie.Series["s1"].Points.AddXY(name[i], quantity[i]);
                i++;
            }

            conn.Close();
        }

        private void StackedChart()
        {
            conn = new SqlConnection(connection);
            conn.Open();
            IList<String> name = new List<String>();
            IList<int> tongchi = new List<int>();
            IList<int> tongthu  = new List<int>();
            IList<int> loinhuan = new List<int>();
            cmd = new SqlCommand("ThongKeChiPhiDATU", conn);
            adapter = new SqlDataAdapter(cmd);
            adapter.Fill(dt);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                name.Add(dr["TenMon"].ToString());
                tongchi.Add(Convert.ToInt32(dr["TongChi"].ToString()));
                tongthu.Add(Convert.ToInt32(dr["TongThu"].ToString()));
                loinhuan.Add(Convert.ToInt32(dr["LoiNhuan"].ToString()));
            }
            chartStacked.Titles.Add("Biểu đồ cột chồng thể hiện chi phí thông qua việc bán đồ ăn thức uống");
            chartStacked.Series["Tổng chi"].IsValueShownAsLabel = true;
            chartStacked.Series["Tổng thu"].IsValueShownAsLabel = true;
            chartStacked.Series["Lợi nhuận"].IsValueShownAsLabel = true;
            for (int i = 0; i < name.Count()-1; i++)
            {
                chartStacked.Series["Tổng chi"].Points.AddXY(name[i], tongthu[i]);
                chartStacked.Series["Tổng thu"].Points.AddXY(name[i], tongchi[i]);
                chartStacked.Series["Lợi nhuận"].Points.AddXY(name[i], loinhuan[i]);
            }
            conn.Close();
        }

        private void ThongKe_Load(object sender, EventArgs e)
        {

            PieChart();
            StackedChart();

        }
    }
}
