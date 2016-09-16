using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using CrystalDecisions.CrystalReports.Engine;


public partial class totalReport_Page : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string connect = ConfigurationManager.AppSettings["connect"];
        SqlConnection conn = new SqlConnection(connect);
        conn.Open();

        string sql = "select * from NHATKYCONGVIEC";
        SqlDataAdapter sqlda = new SqlDataAdapter(sql,conn);
        DataSet ds = new DataSet();
        sqlda.Fill(ds,"NHATKYCONGVIEC");
        ReportDocument rDoc = new ReportDocument();
        rDoc.Load(Server.MapPath("~/TotalReport.rpt"));
        rDoc.SetDataSource(ds.Tables["NHATKYCONGVIEC"]);
        CrystalReportViewer1.ReportSource = rDoc;
        CrystalReportViewer1.DataBind();
    }
}