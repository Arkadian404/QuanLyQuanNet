using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;

namespace QLNET
{
    internal class Database
    {
        SqlConnection conn;
        SqlDataAdapter adapter;
        DataSet ds;

        //public Database()
        //{
        //    string sql = "Data Source=DESKTOP-DHKSD76;Initial Catalog=QLNET_OFFICIAL;Persist Security Info=True;User ID=sa;Password=123456";
        //    conn = new SqlConnection(sql);
        //}
        

        //public DataTable Execute(string sql)
        //{
        //    adapter = new SqlDataAdapter(sql, conn);
        //    ds = new DataSet();
        //    adapter.Fill(ds);
        //    return ds.Tables[0];
        //}

        //public void ExecuteNonQuery(string str)
        //{
        //    SqlCommand cmd = new SqlCommand(str, conn);
        //    conn.Open();
        //    cmd.ExecuteNonQuery();
        //    conn.Close();
        //}
    }
}
