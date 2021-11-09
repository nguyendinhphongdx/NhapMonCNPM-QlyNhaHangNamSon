using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace main.ui.manage
{
    public partial class material : System.Web.UI.Page
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
            if (!IsPostBack)
            {
                using (SqlConnection myCnn = connectDatabase())
                {
                    SqlCommand cmd = new SqlCommand("get_dsnguyenlieu", myCnn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    using (SqlDataAdapter data = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        data.Fill(dt);
                        rptNguyenLieu.DataSource = dt;
                        rptNguyenLieu.DataBind();
                    }
                }
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)(sender);
            string maNL = btn.CommandArgument;
            Response.Redirect("addmaterial.aspx?manl=" + maNL);
        }
    }
}