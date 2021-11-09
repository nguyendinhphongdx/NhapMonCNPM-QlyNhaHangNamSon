using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace main.ui.login
{
    public partial class dangnhap : System.Web.UI.Page
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
            Session["login"] = false;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string tai_khoan = txtEmail.Text;
            string mat_khau = txtPass.Text;

            SqlConnection myCnn = connectDatabase();
            SqlCommand cmd = new SqlCommand("get_login", myCnn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Taikhoan", tai_khoan);
            cmd.Parameters.AddWithValue("@MatKhau", mat_khau);
            cmd.ExecuteNonQuery();
            SqlDataReader rd = cmd.ExecuteReader();
            if (rd.HasRows)
            {
                while (rd.Read())
                {
                    Session["user"] = rd["email"];
                    Session["matkhau"] = rd["mat_khau"];
                    if (Session["user"].Equals(tai_khoan) && Session["matkhau"].Equals(mat_khau))
                    {
                        Session["login"] = true;
                        Session["email"] = rd["email"];
                        Session["type"] = "success";
                        Session["mess"] = "Đăng nhập thành công!";
                        Response.Redirect("../manage/material.aspx");
                    }
                    else
                    {
                        Session["user"] = "";
                        Session["matkhau"] = "";
                    }
                }

            }
            else
            {
                Session["type"] = "error";
                Session["mess"] = "Tài khoản hoặc mật khẩu không đúng. Vui lòng nhập lại!";
            }
        }
    }
}