using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace main.ui.manage
{
    public partial class listorder : System.Web.UI.Page
    {
        public static string strCon = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;

        public static SqlConnection connectDatabase()
        {
            SqlConnection myCnn = new SqlConnection(strCon);
            myCnn.Open();
            return myCnn;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                SqlConnection con = connectDatabase();
                SqlCommand cmd = new SqlCommand("select po.id,po.soban,po.ngay,nv.ten as nhan_vien,kh.name as khach_hang,po.ten_mon,po.so_luong from tbl_phieu_order as po INNER JOIN tbl_nhan_vien as nv ON po.id_nhan_vien = nv.id INNER JOIN tbl_khach_hang as kh ON po.id_khach_hang = kh.id; ", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                rpt_order.DataSource = dt;
                rpt_order.DataBind();
            }
        }
    }
}