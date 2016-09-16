using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class UC_updateReport_UC : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string user = Session["user"].ToString();
            string id = Request.QueryString["id"].ToString();
            loadUpdate(id);
        }
    }
    SqlConnection conn;
    

    public void loadUpdate(string id)
    {
        string connect = ConfigurationManager.AppSettings["connect"];
        conn = new SqlConnection(connect);
        conn.Open();

        
        string sql = "select * from NHATKYCONGVIEC where ID_NHATKY = '"+id+"'";
        SqlDataAdapter sqlda = new SqlDataAdapter(sql,conn);
        DataTable table = new DataTable();
        sqlda.Fill(table);

        updateRP.DataSource = table;
        updateRP.DataBind();

        string sql1 = "select * from USERS";
        SqlDataAdapter sqlda1 = new SqlDataAdapter(sql1, conn);
        DataTable table1 = new DataTable();
        sqlda1.Fill(table1);
        DropDownList dropNXL = (DropDownList)updateRP.FindControl("dropNgXuLy");
        if (dropNXL != null)
        {
            dropNXL.DataSource = table1;
            dropNXL.DataTextField = "hoten";
            dropNXL.DataValueField = "username";
            dropNXL.DataBind();
            dropNXL.ClearSelection();
            dropNXL.Items.FindByValue(Session["user"].ToString()).Selected = true;
        }

        RadioButtonList rblStatus = (RadioButtonList)updateRP.FindControl("rblTinhTrang");
        rblStatus.Items.FindByValue(table.Rows[0]["tinhtrang"].ToString()).Selected = true;
    }


    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        string connect = ConfigurationManager.AppSettings["connect"];
        SqlConnection conn = new SqlConnection(connect);
        conn.Open();

        DropDownList dropNXL = (DropDownList)updateRP.FindControl("dropNgXuLy");
        RadioButtonList rblStatus = (RadioButtonList)updateRP.FindControl("rblTinhTrang");
        string id = Request.QueryString["id"].ToString();
        string sql = "update NHATKYCONGVIEC set NGUOIXULY = N'" + dropNXL.SelectedItem.ToString() + "' ,TINHTRANG = '" + rblStatus.SelectedValue.ToString() + "' where ID_NHATKY = '" + id + "'";
        SqlCommand cmd = new SqlCommand(sql,conn);
        int n = cmd.ExecuteNonQuery();

        if (n == 1)
        {
            lb.Text = "Update Successed !";
            Response.Redirect("~/manageReport_Page.aspx");
        }
        else
        {
            lb.Text = "Update Failed !";
        }
    }
}