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

public partial class UC_viewReport_UC : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            loadView();
        }
    }
    SqlConnection conn;
    public void loadView()
    {
        string connect = ConfigurationManager.AppSettings["connect"];
        string id = Request.QueryString["ID"].ToString();

        string sql = "select * from NHATKYCONGVIEC where ID_NHATKY = '"+id+"'";
        conn = new SqlConnection(connect);
        conn.Open();
        SqlDataAdapter sqlda = new SqlDataAdapter(sql,conn);
        DataTable table = new DataTable();
        sqlda.Fill(table);

        view.DataSource = table;
        view.DataBind();
    }
}