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
using System.IO;

public partial class UC_changeAvatar_UC : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        loadAva();
    }
    SqlConnection conn;
    public void loadAva()
    {
        string connect = ConfigurationManager.AppSettings["connect"];
        conn = new SqlConnection(connect);
        conn.Open();
        string user = Session["user"].ToString();
        string sql = "select avatar from USERS where username = '" + user + "'";
        SqlDataAdapter sqlda = new SqlDataAdapter(sql, conn);
        DataTable data = new DataTable();
        sqlda.Fill(data);
        string file = data.Rows[0]["avatar"].ToString();
        update.ImageUrl = "~/IMAGES/" + file;
    }


    protected void btnChange_Click(object sender, EventArgs e)
    {
        if(ImgUp.HasFile)
        {
            string filename = Path.GetFileName(ImgUp.PostedFile.FileName);
            ImgUp.PostedFile.SaveAs(Server.MapPath("~/IMAGES/") + filename);
        }
        string connect = ConfigurationManager.AppSettings["connect"];
        conn = new SqlConnection(connect);
        conn.Open();
        string file = ImgUp.FileName.ToString();
        string user = Session["user"].ToString();
        string sql = "update USERS set avatar = '"+file+"' where username = '"+user+"'";
        SqlCommand cmd = new SqlCommand(sql,conn);
        int result = cmd.ExecuteNonQuery();
        if (result == 1)
        {
            lbNotice.Text = "Update Successfull !!!";
        }
        else
        {
            lbNotice.Text = "Update Failed !!!";
        }
    }
}