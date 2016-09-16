using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System.IO;


public partial class UC_viewSchedule_UC : System.Web.UI.UserControl
{
    SqlConnection conn;
    int employee = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        loadSchedule();
    }

    public int countEmployees()
    {
        string connect = ConfigurationManager.AppSettings["connect"];
        conn = new SqlConnection(connect);
        conn.Open();

        string sql = "select count(*) from USERS";
        SqlDataAdapter sqlda = new SqlDataAdapter(sql,conn);
        DataTable dt = new DataTable();
        sqlda.Fill(dt);
        employee = int.Parse(dt.Rows[0][0].ToString());
        return employee;
    }

    public void loadSchedule()
    {
        employee = countEmployees();
        string connect = ConfigurationManager.AppSettings["connect"];
        conn = new SqlConnection(connect);
        conn.Open();

        string sql = "select top "+employee+" * from LICHLAMVIEC order by NGAYBATDAU desc";
        SqlDataAdapter sqlda = new SqlDataAdapter(sql,conn);
        DataTable dt = new DataTable();
        sqlda.Fill(dt);

        if (dt.Rows.Count == 0)
        {
            lb.Text = "No Data Found !!!";
        }
        else
        {
            from.Text = String.Format("{0:dd/MM/yyyy}",dt.Rows[0][2]);
            to.Text = String.Format("{0:dd/MM/yyyy}",dt.Rows[0][3]);
            gridSchedule.DataSource = dt;
            gridSchedule.DataBind();
        }
    }

    public DataTable setReportData()
    {
        string sql = "select top " + employee + " * from LICHLAMVIEC order by NGAYBATDAU desc";
        SqlDataAdapter sqlda = new SqlDataAdapter(sql, conn);
        DataTable dt = new DataTable();
        sqlda.Fill(dt);

        return dt;
    }

    protected void btnReport_Click(object sender, ImageClickEventArgs e)
    {
        ReportDocument rpDoc = new ReportDocument();
        rpDoc.Load(Server.MapPath("~/Files/Schedule.rpt"));
        rpDoc.SetDataSource(setReportData());
        string path = Server.MapPath("~/Files/schedule.pdf");
        rpDoc.ExportToHttpResponse(ExportFormatType.PortableDocFormat,Response,false,path);
        Response.Redirect("~/Files/schedule.pdf");
    }
    protected void btnExcel_Click(object sender, ImageClickEventArgs e)
    {
        ReportDocument rpDoc = new ReportDocument();
        rpDoc.Load(Server.MapPath("~/Files/Schedule.rpt"));
        rpDoc.SetDataSource(setReportData());
        //string path = Server.MapPath("~/Files/schedule.xlsx");
        rpDoc.ExportToHttpResponse(ExportFormatType.ExcelRecord, Response,true,"schedule");
        
    }
    protected void btnWord_Click(object sender, ImageClickEventArgs e)
    {
        ReportDocument rpDoc = new ReportDocument();
        rpDoc.Load(Server.MapPath("~/Files/Schedule.rpt"));
        rpDoc.SetDataSource(setReportData());
        //string path = Server.MapPath("~/Files/schedule.xlsx");
        rpDoc.ExportToHttpResponse(ExportFormatType.WordForWindows, Response, true, "schedule");
    }
}