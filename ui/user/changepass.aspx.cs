using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace main.ui.user
{
    public partial class changepass : System.Web.UI.Page
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
            tentaikhoan.Text = Session["email"].ToString();
            tentaikhoan.Enabled = false;
        }

        protected void btnCapNhatMatKhau_Click(object sender, EventArgs e)
        {
            Session["login"] = true;
            string ma = Session["email"].ToString();
            string mkcu = matkhaucu.Text;
            string pass = matkhaumoi.Text;
            string cfpass = nhaplaimatkhaumoi.Text;

            using (SqlConnection myCnn = connectDatabase())
            {
                SqlCommand cmd = new SqlCommand("check_password", myCnn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@email", ma);
                cmd.Parameters.AddWithValue("@mkcu", mkcu);
                SqlDataReader rd = cmd.ExecuteReader();
                if (!rd.HasRows)
                {
                    Session["type"] = "error";
                    Session["mess"] = "Mật khẩu cũ không chính xác";
                    Response.Redirect("changepass.aspx");
                }
            }

            if (!pass.Equals(""))
            {
                if (pass == cfpass)
                {
                    SqlConnection myCnn = connectDatabase();
                    SqlCommand cmd = new SqlCommand("update_pass", myCnn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@email", ma);
                    cmd.Parameters.AddWithValue("@mkmoi", pass);
                    int rs = cmd.ExecuteNonQuery();
                    if (rs > 0)
                    {
                        Session["type"] = "success";
                        Session["mess"] = "Đổi mật khẩu thành công!";
                    }
                    else
                    {
                        Session["type"] = "error";
                        Session["mess"] = "Có lỗi xảy ra. Vui lòng thử lại!";
                    }
                }
                else
                {
                    Session["type"] = "error";
                    Session["mess"] = "Mật khẩu và mật khẩu xác nhận không giống nhau!";
                }
            }
            else
            {
                Session["type"] = "warning";
                Session["mess"] = "Vui lòng nhập mật khẩu mới !";
            }
            Response.Redirect("changepass.aspx");
        }
    }
}