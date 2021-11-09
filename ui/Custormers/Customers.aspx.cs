using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace main.ui.Custormers
{
    public partial class Customers : System.Web.UI.Page
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
                SqlCommand cmd = new SqlCommand("select * from tbl_khach_hang", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                rptNguyenLieu.DataSource = dt;
                rptNguyenLieu.DataBind();
            }
        }
    }
}