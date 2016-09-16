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


public partial class UC_manageReport_UC : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //dropSearchAll.Items.Insert(0,"---Chọn Mục---");
        dropSearchWait.Items.Insert(0, "---Chọn Mục---");
        dropSearchComplete.Items.Insert(0, "---Chọn Mục---");
        dropSearchDelete.Items.Insert(0, "---Chọn Mục---");
        dropPending.Items.Insert(0, "---Chọn Mục---");
        if (!IsPostBack)
        {
            //loadAll();
            loadWaiting();
            loadComplete();
            loadDelete();
            loadPending();
        }
    }

    SqlConnection conn;

    //public void loadAll()
    //{
    //    string connect = ConfigurationManager.AppSettings["connect"];
    //    conn = new SqlConnection(connect);
    //    conn.Open();

    //    string sql = "select * from NHATKYCONGVIEC order by NGAYTIEPNHAN DESC";
    //    SqlDataAdapter sqlda = new SqlDataAdapter(sql, conn);
    //    DataTable data = new DataTable();
    //    sqlda.Fill(data);

    //    gridAll.DataSource = data;
    //    gridAll.DataBind();
    //}

    public void loadWaiting()
    {
        string connect = ConfigurationManager.AppSettings["connect"];
        conn = new SqlConnection(connect);
        conn.Open();

        string sql = "select * from NHATKYCONGVIEC where TINHTRANG = 'waiting'";
        SqlDataAdapter sqlda = new SqlDataAdapter(sql, conn);
        DataTable data = new DataTable();
        sqlda.Fill(data);

        gridWaiting.DataSource = data;
        gridWaiting.DataBind();
    }

    public void loadComplete()
    {
        string connect = ConfigurationManager.AppSettings["connect"];
        conn = new SqlConnection(connect);
        conn.Open();

        string sql = "select * from NHATKYCONGVIEC where TINHTRANG = 'complete'";
        SqlDataAdapter sqlda = new SqlDataAdapter(sql, conn);
        DataTable data = new DataTable();
        sqlda.Fill(data);

        gridComplete.DataSource = data;
        gridComplete.DataBind();
    }

    public void loadDelete()
    {
        string connect = ConfigurationManager.AppSettings["connect"];
        conn = new SqlConnection(connect);
        conn.Open();

        string sql = "select * from NHATKYCONGVIEC where TINHTRANG = 'deleted'";
        SqlDataAdapter sqlda = new SqlDataAdapter(sql, conn);
        DataTable data = new DataTable();
        sqlda.Fill(data);

        gridHuy.DataSource = data;
        gridHuy.DataBind();
    }

    public void loadPending()
    {
        string connect = ConfigurationManager.AppSettings["connect"];
        conn = new SqlConnection(connect);
        conn.Open();

        string sql = "select * from NHATKYCONGVIEC where TINHTRANG = 'pending'";
        SqlDataAdapter sqlda = new SqlDataAdapter(sql, conn);
        DataTable data = new DataTable();
        sqlda.Fill(data);

        gridPending.DataSource = data;
        gridPending.DataBind();
    }


    //protected void gridAll_RowCommand(object sender, GridViewCommandEventArgs e)
    //{
    //    if (e.CommandName == "view")
    //    {
    //        string id = e.CommandArgument.ToString();
    //        Response.Redirect("~/viewReport_Page.aspx?ID=" + id);
    //    }
    //    else if (e.CommandName == "update")
    //    {
    //        string id = e.CommandArgument.ToString();
    //        Response.Redirect("~/updateReport_Page.aspx?ID=" + id);
    //    }
    //    else if (e.CommandName == "delete")
    //    {
    //        string id = e.CommandArgument.ToString();
    //        string connect = ConfigurationManager.AppSettings["connect"];
    //        conn = new SqlConnection(connect);
    //        conn.Open();

    //        string sql = "delete from NHATKYCONGVIEC where ID_NHATKY = '" + id + "'";
    //        SqlCommand cmd = new SqlCommand(sql, conn);
    //        cmd.ExecuteNonQuery();
    //        loadAll();
    //    }
    //}
    protected void btnViewAll_Click(object sender, ImageClickEventArgs e)
    {

    }
    protected void gridAll_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
    protected void gridWaiting_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "view")
        {
            string id = e.CommandArgument.ToString();
            Response.Redirect("~/viewReport_Page.aspx?ID=" + id);
        }
        else if (e.CommandName == "update")
        {
            string id = e.CommandArgument.ToString();
            Response.Redirect("~/updateReport_Page.aspx?ID=" + id);
        }
        else if (e.CommandName == "delete")
        {
            string id = e.CommandArgument.ToString();
            string connect = ConfigurationManager.AppSettings["connect"];
            conn = new SqlConnection(connect);
            conn.Open();

            string sql = "delete from NHATKYCONGVIEC where ID_NHATKY = '" + id + "'";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.ExecuteNonQuery();
            loadWaiting();
        }
    }
    protected void gridWaiting_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
    protected void gridComplete_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "view")
        {
            string id = e.CommandArgument.ToString();
            Response.Redirect("~/viewReport_Page.aspx?ID=" + id);
        }
        else if (e.CommandName == "update")
        {
            string id = e.CommandArgument.ToString();
            Response.Redirect("~/updateReport_Page.aspx?ID=" + id);
        }
        else if (e.CommandName == "delete")
        {
            string id = e.CommandArgument.ToString();
            string connect = ConfigurationManager.AppSettings["connect"];
            conn = new SqlConnection(connect);
            conn.Open();

            string sql = "delete from NHATKYCONGVIEC where ID_NHATKY = '" + id + "'";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.ExecuteNonQuery();
            loadDelete();
        }
    }
    protected void gridComplete_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
}