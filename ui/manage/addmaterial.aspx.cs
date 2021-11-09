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
    public partial class addmaterial : System.Web.UI.Page
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
            string ma = "";
            if (Request.QueryString.Count > 0)
            {
                ma = Request.QueryString["manl"];
            }

            if (!IsPostBack)
            {
                if (!ma.Equals(""))
                {
                    using (SqlConnection myCnn = connectDatabase())
                    {
                        SqlCommand cmd = new SqlCommand("get_nguyenlieu_theoid", myCnn);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@id", ma);
                        SqlDataReader rd = cmd.ExecuteReader();
                        if (rd.HasRows)
                        {
                            while (rd.Read())
                            {
                                txtTenMon.Text = rd["ten"].ToString();
                                txtSoLuong.Text = rd["so_luong"].ToString();
                                txtDonGia.Text = rd["don_gia"].ToString();
                                txtDVTinh.Text = rd["don_vi"].ToString();
                            }
                        }
                    }
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string tennguyenlieu = txtTenMon.Text.Trim();
            int soluong = Convert.ToInt32(txtSoLuong.Text);
            int dongia = Convert.ToInt32(txtDonGia.Text.Trim());
            string donvitinh = txtDVTinh.Text.Trim();
            using (SqlConnection myCnn = connectDatabase())
            {
                SqlCommand cmd = new SqlCommand("insert_nguyenlieu", myCnn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ten", tennguyenlieu);
                cmd.Parameters.AddWithValue("@soluong", soluong);
                cmd.Parameters.AddWithValue("@dongia", dongia);
                cmd.Parameters.AddWithValue("@donvi", donvitinh);

                int check = cmd.ExecuteNonQuery();

                if (check > 0)
                {
                    lblNoti.Text = "Thêm nguyên liệu thành công";
                    lblNoti.CssClass = "text-success";
                }
                else
                {
                    lblNoti.Text = "Thêm nguyên liệu không thành công!";
                    lblNoti.CssClass = "text-error";
                }
            }
        }

        protected void btnFix_Click(object sender, EventArgs e)
        {
            string tennguyenlieu = txtTenMon.Text.Trim();
            int soluong = Convert.ToInt32(txtSoLuong.Text);
            int dongia = Convert.ToInt32(txtDonGia.Text.Trim());
            string donvitinh = txtDVTinh.Text.Trim();
            string ma = Request.QueryString["manl"]; ;

            using (SqlConnection myCnn = connectDatabase())
            {
                SqlCommand cmd = new SqlCommand("update_nguyenlieu", myCnn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ma", Convert.ToInt32(ma));
                cmd.Parameters.AddWithValue("@ten", tennguyenlieu);
                cmd.Parameters.AddWithValue("@soluong", soluong);
                cmd.Parameters.AddWithValue("@dongia", dongia);
                cmd.Parameters.AddWithValue("@donvi", donvitinh);

                int check = cmd.ExecuteNonQuery();

                if (check > 0)
                {
                    lblNoti.Text = "Cập nhật nguyên liệu thành công !";
                    lblNoti.CssClass = "text-success";
                }
                else
                {
                    lblNoti.Text = "Cập nhật nguyên liệu không thành công !";
                    lblNoti.CssClass = "text-error";
                }
            }
        }
    }
}