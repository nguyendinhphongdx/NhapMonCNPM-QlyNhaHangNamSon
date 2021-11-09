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
    public partial class addorder : System.Web.UI.Page
    {
        public static string strCon = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;

        public static SqlConnection connectDatabase()
        {
            SqlConnection myCnn = new SqlConnection(strCon);
            myCnn.Open();
            return myCnn;
        }

        private DataTable getdbTable(string command)
        {
            SqlConnection con = connectDatabase();
            SqlCommand cmd = new SqlCommand(command, con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Close();
            return dt;

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //string ma = "";
            //if (Request.QueryString.Count > 0)
            //{
            //    ma = Request.QueryString["manl"];
            //}

            if (!Page.IsPostBack)
            {
                //if (!ma.Equals(""))
                //{
                   
                        DataTable dt_nv = this.getdbTable("select * from tbl_nhan_vien;");
                        DataTable dt_kh = this.getdbTable("select * from tbl_khach_hang;");
                        listKhachhang.DataSource = dt_kh;
                        listKhachhang.DataBind();
                        listNhanvien.DataSource = dt_nv;
                        listNhanvien.DataBind();
                //}
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                string soban = txtSoban.Text.Trim();
                string ngay = txtNgay.Text.Trim();
                int id_nhan_vien = Convert.ToInt32(listNhanvien.Text.Trim());
                int id_khach_hang = Convert.ToInt32(listKhachhang.Text.Trim());
                string ten_mon = txtTenmon.Text.Trim();
                int soluong = Convert.ToInt32(txtSoluong.Text);
                String query = "INSERT INTO [dbo].[tbl_phieu_order] ([soban],[ngay],[id_nhan_vien],[id_khach_hang],[ten_mon],[so_luong]) VALUES (@soban,@ngay,@id_nhan_vien,@id_khach_hang,@ten_mon,@so_luong)";

                using (SqlConnection connection = connectDatabase())
                {
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@soban", soban);
                    command.Parameters.AddWithValue("@ngay", ngay);
                    command.Parameters.AddWithValue("@id_nhan_vien", id_nhan_vien);
                    command.Parameters.AddWithValue("@id_khach_hang", id_khach_hang);
                    command.Parameters.AddWithValue("@ten_mon", ten_mon);
                    command.Parameters.AddWithValue("@so_luong", soluong);

                    int result = command.ExecuteNonQuery();
                    if (result > 0)
                    {
                        lblNoti.Text = "Thêm order thành công";
                        lblNoti.CssClass = "text-success";
                    }
                    else
                    {
                        lblNoti.Text = "Thêm order không thành công";
                        lblNoti.CssClass = "text-error";
                    }
                }
            }
            catch
            {
                lblNoti.Text = "Thêm order không thành công, lỗi thông tin nhập vào.";
                return;
            }



        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            //string tennguyenlieu = txtTenMon.Text.Trim();
            //int soluong = Convert.ToInt32(txtSoLuong.Text);
            //int dongia = Convert.ToInt32(txtDonGia.Text.Trim());
            //string donvitinh = txtDVTinh.Text.Trim();
            //string ma = Request.QueryString["manl"]; ;

            //using (SqlConnection myCnn = connectDatabase())
            //{
            //    SqlCommand cmd = new SqlCommand("update_nguyenlieu", myCnn);
            //    cmd.CommandType = CommandType.StoredProcedure;
            //    cmd.Parameters.AddWithValue("@ma", Convert.ToInt32(ma));
            //    cmd.Parameters.AddWithValue("@ten", tennguyenlieu);
            //    cmd.Parameters.AddWithValue("@soluong", soluong);
            //    cmd.Parameters.AddWithValue("@dongia", dongia);
            //    cmd.Parameters.AddWithValue("@donvi", donvitinh);

            //    int check = cmd.ExecuteNonQuery();

            //    if (check > 0)
            //    {
            //        lblNoti.Text = "Cập nhật nguyên liệu thành công !";
            //        lblNoti.CssClass = "text-success";
            //    }
            //    else
            //    {
            //        lblNoti.Text = "Cập nhật nguyên liệu không thành công !";
            //        lblNoti.CssClass = "text-error";
            //    }
            //}
        }
    }
}