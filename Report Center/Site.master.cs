using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Configuration;

public partial class Site : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null)
        {
            Response.Redirect("~/login_Page.aspx");
        }
        lbDate.Text = DateTime.Now.ToString("dd/MM/yyyy");
        if (!IsPostBack)
        {
            loadAvatar();
        }
        
        lbUser.Text = Session["fullname"].ToString();
    }
    SqlConnection conn;
    public void loadAvatar()
    {
        string connect = ConfigurationManager.AppSettings["connect"];
        conn = new SqlConnection(connect);
        conn.Open();
        string user = Session["user"].ToString();
        string sql = "select avatar from USERS where username = '"+user+"'";
        SqlDataAdapter sqlda = new SqlDataAdapter(sql,conn);
        DataTable data = new DataTable();
        sqlda.Fill(data);
        string file = data.Rows[0]["avatar"].ToString();
        avatar.ImageUrl = "~/IMAGES/" + file;
    }
    protected void changeAvatar_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/changeAvatar_Page.aspx");
    }
}
