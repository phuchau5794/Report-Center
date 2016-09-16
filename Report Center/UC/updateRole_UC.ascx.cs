using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;


public partial class UC_updateRole_UC : System.Web.UI.UserControl
{
    SqlConnection conn;
    protected void Page_Load(object sender, EventArgs e)
    {
        string user = Session["user"].ToString();
        lbUsername.Text = Session["user"].ToString();
        lbFullname.Text = Session["fullname"].ToString();
        if (!IsPostBack)
        {
            loadRole(user);
        }
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        string user = Session["user"].ToString();
        updateRole(user);
    }

    public void updateRole(string user)
    {
        string connect = ConfigurationManager.AppSettings["connect"];
        conn = new SqlConnection(connect);
        conn.Open();
        bool a = false;
        bool b = false;
        bool c = false;
        bool d = false;

        //if (int.Parse(cblRole.SelectedValue) == 1)
        //{
        //    a = true;
        //}
        //else if (int.Parse(cblRole.SelectedValue) == 2)
        //{
        //    b = true;
        //}
        //else if (int.Parse(cblRole.SelectedValue) == 3)
        //{
        //    c = true;
        //}

        foreach (ListItem item in cblRole.Items)
        {
            if (item.Value == "1" && item.Selected == true)
            {
                a = true;
            }
            else if (item.Value == "2" && item.Selected == true)
            {
                b = true;
            }
            else if (item.Value == "3" && item.Selected == true)
            {
                c = true;
            }
        }

        string sql = "update USERS SET a = '" + a + "' , b = '" + b + "', c = '"+c+"', d = '"+d+"' where username = '"+user+"'";
        SqlCommand cmd = new SqlCommand(sql, conn);
        int n = cmd.ExecuteNonQuery();
        if (n == 1)
        {
            lbError.Text = "Successful !!!";
        }
        else
        {
            lbError.Text = "Failed !!!";
        }
    }

    public void loadRole(string user)
    {
        string connect = ConfigurationManager.AppSettings["connect"];
        conn = new SqlConnection(connect);
        conn.Open();

        string sql = "select * from USERS where username = '"+user+"'";
        SqlDataAdapter sqlda = new SqlDataAdapter(sql,conn);
        DataTable data = new DataTable();
        sqlda.Fill(data);

        if (bool.Parse(data.Rows[0]["a"].ToString()) == true)
        {
            cblRole.Items[0].Selected = true;
        }
        else if (bool.Parse(data.Rows[0]["b"].ToString()) == true)
        {
            cblRole.Items[1].Selected = true;
        }
        else if (bool.Parse(data.Rows[0]["c"].ToString()) == true)
        {
            cblRole.Items[2].Selected = true;
        }
    }
}