using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Configuration;

public partial class UC_createReport_UC : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lbName.Text = Session["fullname"].ToString();
        lbMail.Text = Session["mail"].ToString();
        rblStatus.Items[0].Selected = true;
        
        if (!IsPostBack)
        {
            loadService();
            loadNguoiXuLy();
            loadDepartment();
        }
        
    }
    SqlConnection conn;
    public void loadDepartment()
    {
        string connect = ConfigurationManager.AppSettings["connect"];
        conn = new SqlConnection(connect);
        conn.Open();

        string sql = "select * from PHONGBAN" + " UNION " + "select * from CUAHANG";
        SqlDataAdapter sqlda = new SqlDataAdapter(sql,conn);
        DataTable data = new DataTable();
        sqlda.Fill(data);

        DataRow row = data.NewRow();
        row["department_id"] = 0;
        row["department_name"] = "---Chọn Đơn Vị---";
        data.Rows.InsertAt(row, 0);

        dropDepartment.DataSource = data;
        dropDepartment.DataTextField = "department_name";
        dropDepartment.DataValueField = "department_id";
        dropDepartment.DataBind();
    }

    public void loadService()
    {
        string connect = ConfigurationManager.AppSettings["connect"];
        conn = new SqlConnection(connect);
        conn.Open();

        string sql = "select distinct service_kind from LOAIDICHVU";
        SqlDataAdapter sqlda = new SqlDataAdapter(sql,conn);
        DataTable data = new DataTable();
        sqlda.Fill(data);

        DataRow row = data.NewRow();
        row["service_kind"] = "---Loại Vấn Đề---";
        data.Rows.InsertAt(row, 0);
        DataRow row1 = data.NewRow();
        int i = data.Rows.Count + 1;
        row1["service_kind"] = "Khác";
        data.Rows.InsertAt(row1, i);

        dropService.DataSource = data;
        dropService.DataTextField = "service_kind";
        dropService.DataValueField = "service_kind";
        dropService.DataBind();
    }

    public void loadSpecifyService(string service)
    {
        string connect = ConfigurationManager.AppSettings["connect"];
        conn = new SqlConnection(connect);
        conn.Open();

        if (dropService.SelectedItem.ToString() == "Khác")
        {
            dropMota.Visible = false;
            txtKhac.Visible = true;
        }
        else
        {
            txtKhac.Visible = false;
            dropMota.Visible = true;
            string sql = "select service_name from LOAIDICHVU where service_kind = N'" + service + "'";
            SqlDataAdapter sqlda = new SqlDataAdapter(sql, conn);
            DataTable data = new DataTable();
            sqlda.Fill(data);
            dropMota.DataSource = data;
            dropMota.DataTextField = "service_name";
            dropMota.DataValueField = "service_name";
            dropMota.DataBind();
        }
    }

    protected void dropService_SelectedIndexChanged(object sender, EventArgs e)
    {
        string service = dropService.SelectedItem.ToString();
        loadSpecifyService(service);
    }

    public void loadNguoiXuLy()
    {
        string connect = ConfigurationManager.AppSettings["connect"];
        conn = new SqlConnection(connect);
        conn.Open();

        string sql = "select * from USERS";
        SqlDataAdapter sqlda = new SqlDataAdapter(sql,conn);
        DataTable data = new DataTable();
        sqlda.Fill(data);

        DataRow row = data.NewRow();
        row["hoten"] = "---Người Xử Lý---";
        data.Rows.InsertAt(row,0);

        dropNgXuLy.DataSource = data;
        dropNgXuLy.DataTextField = "hoten";
        dropNgXuLy.DataValueField = "hoten";
        dropNgXuLy.DataBind();
    }
    protected void btnSend_Click(object sender, EventArgs e)
    {
        string connect = ConfigurationManager.AppSettings["connect"];
        conn = new SqlConnection(connect);
        conn.Open();

        string sql = "insert into NHATKYCONGVIEC(NGUOITIEPNHAN,NGAYTIEPNHAN,BOPHANYEUCAU,NGUOIYEUCAU,LOAIDICHVU,VANDECUTHE,MOTAVANDE,CACHXULY,NGUOIXULY,TINHTRANG,HINHANH) values(@nguoitiepnhan,@ngay,@donvi,@nguoiyeucau,@loaidichvu,@vande,@mota,@cachxuly,@nguoixuly,@tinhtrang,@hinhanh)";
        SqlCommand cmd = new SqlCommand(sql,conn);
        cmd.Parameters.AddWithValue("@nguoitiepnhan",lbName.Text);
        cmd.Parameters.AddWithValue("@ngay",DateTime.Now.ToShortDateString());
        cmd.Parameters.AddWithValue("@donvi",dropDepartment.SelectedItem.ToString());
        cmd.Parameters.AddWithValue("@nguoiyeucau",txtRequester.Text);
        cmd.Parameters.AddWithValue("@loaidichvu",dropService.SelectedItem.ToString());

        string vande;
        if (dropMota.Visible == true)
        {
            vande = dropMota.SelectedItem.ToString();
        }
        else
        {
            vande = txtKhac.Text;
        }

        cmd.Parameters.AddWithValue("@vande",vande);
        cmd.Parameters.AddWithValue("@mota",Editor1.Content.ToString());
        cmd.Parameters.AddWithValue("@cachxuly",txtCachXuLy.Text);
        cmd.Parameters.AddWithValue("@nguoixuly",dropNgXuLy.SelectedItem.ToString());
        cmd.Parameters.AddWithValue("@tinhtrang",rblStatus.SelectedValue.ToString());
        cmd.Parameters.AddWithValue("@hinhanh",upImg.FileName.ToString());

        int n = cmd.ExecuteNonQuery();
        if (n == 1)
        {
            
            lbNotice.Text = "Send Report Success !";
            dropDepartment.SelectedIndex = 0;
            txtRequester.Text = "";
            dropService.SelectedIndex = 0;
            txtKhac.Text = "";
            dropMota.SelectedIndex = 0;
            txtCachXuLy.Text = "";
            dropNgXuLy.SelectedIndex = 0;
            rblStatus.SelectedIndex = 0;
        }
        else
        {
            lbNotice.Text = "Send Report Fail !";
        }
    }
}