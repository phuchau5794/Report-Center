using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Text;
using System.Security.Cryptography;

public partial class UC_login_UC : System.Web.UI.UserControl
{
    SqlConnection conn;
    protected void Page_Load(object sender, EventArgs e)
    {
        user.Focus();
        lbError.Text = "";
    }
    protected void btnExit_Click(object sender, EventArgs e)
    {
        
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string tendangnhap = user.Text;
        string matkhau = pass.Text;
        string password = Encrypt(matkhau,true);
        //string connect = "server=.;database=BAOCAO;uid=sa;pwd=server@satra;";
        string connect = ConfigurationManager.AppSettings["connect"];
        conn = new SqlConnection(connect);
        conn.Open();
        DataTable data = new DataTable();
        string sql = "select * from USERS where username = '" + tendangnhap + "' and pass = '" + password + "'";
        SqlDataAdapter sqlda = new SqlDataAdapter(sql, conn);
        sqlda.Fill(data);
        if (data == null || data.Rows.Count == 0)
        {
            lbError.Text = "Lỗi Đăng Nhập ! Nhập Lại Tài Khoản .";
            //Response.Redirect("~/dangnhap.aspx");
        }
        else
        {

            //if (int.Parse(data.Rows[0]["admin"].ToString()) != 1)
            //{

            Session["user"] = tendangnhap;
            //    Session["login"] = data.Rows[0]["username"].ToString();
            Session["fullname"] = data.Rows[0]["hoten"].ToString();
            Session["mail"] = data.Rows[0]["mail"].ToString();
            //}
            //else if (int.Parse(data.Rows[0]["admin"].ToString()) == 1)
            //{

            //    Session["admin"] = tendangnhap;
            //    Session["login"] = data.Rows[0]["username"].ToString();
            //    Session["fullname"] = data.Rows[0]["hoten"].ToString();
            //}

            Response.Redirect("~/Default.aspx");
        }
    }

    public string Encrypt(string toEncrypt, bool useHashing)
    {
        byte[] keyArray;
        byte[] toEncryptArray = Encoding.UTF8.GetBytes(toEncrypt);
        if (useHashing)
        {
            var hashmd5 = new MD5CryptoServiceProvider();
            keyArray = hashmd5.ComputeHash(Encoding.UTF8.GetBytes("TVT"));
        }
        else keyArray = Encoding.UTF8.GetBytes("TVT");
        var tdes = new TripleDESCryptoServiceProvider
        {
            Key = keyArray,
            Mode = CipherMode.ECB,
            Padding = PaddingMode.PKCS7
        };
        ICryptoTransform cTransform = tdes.CreateEncryptor();
        byte[] resultArray = cTransform.TransformFinalBlock(toEncryptArray, 0, toEncryptArray.Length);
        return Convert.ToBase64String(resultArray, 0, resultArray.Length);
    }
    public string Decrypt(string toDecrypt, bool useHashing)
    {
        byte[] keyArray;
        byte[] toEncryptArray = Convert.FromBase64String(toDecrypt);
        if (useHashing)
        {
            var hashmd5 = new MD5CryptoServiceProvider();
            keyArray = hashmd5.ComputeHash(Encoding.UTF8.GetBytes("TVT"));
        }
        else keyArray = Encoding.UTF8.GetBytes("TVT");
        var tdes = new TripleDESCryptoServiceProvider
        {
            Key = keyArray,
            Mode = CipherMode.ECB,
            Padding = PaddingMode.PKCS7
        };
        ICryptoTransform cTransform = tdes.CreateDecryptor();
        byte[] resultArray = cTransform.TransformFinalBlock(toEncryptArray, 0, toEncryptArray.Length);
        return Encoding.UTF8.GetString(resultArray);
    }
}