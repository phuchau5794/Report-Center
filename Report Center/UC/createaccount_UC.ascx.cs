using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Security.Cryptography;
using System.IO;
using System.Text;
using System.Text.RegularExpressions;


public partial class UC_createaccount_UC : System.Web.UI.UserControl
{
    SqlConnection conn;
    protected void Page_Load(object sender, EventArgs e)
    {
        txtFullname.Focus();
        if (!IsPostBack)
        {
            loadArea();
        }
        txtPassword.Attributes["value"] = txtPassword.Text;
    }
    protected void btnCreate_Click(object sender, EventArgs e)
    {
        
        string fullname = txtFullname.Text.Trim();
        string id = txtID.Text.Trim();
        string pass = Encrypt(txtPassword.Text.Trim(),true);
        string mail = txtMail.Text.Trim();
        string phone = txtPhone.Text.Trim();
        string department = null;
        string connect = ConfigurationManager.AppSettings["connect"];
        conn = new SqlConnection(connect);
        conn.Open();


        if (dropArea.SelectedIndex == 0)
        {
            lbErrArea.Text = "Choose Area !!!";
            dropArea.Focus();
        }
        else
        {
            lbErrArea.Text = "";
            department = dropDepartment.SelectedItem.ToString();
            if (txtID.Text.Trim() == null || txtID.Text.Trim().Length == 0)
            {
                lbErrID.Text = "User ID can not be blank !";
                txtID.Focus();
            }
            else
            {
                if (!checkUsername(id))
                {
                    lbErrID.Text = "Username Existed !!!";
                    txtID.Focus();
                }
                else
                {
                    lbErrID.Text = "";
                    if (!checkPassword(txtPassword.Text))
                    {
                        lberrorPass.Text = "Password has at least 8 characters with 1 Upper Character, 1 Lower Character, 1 Digit";
                        txtPassword.Focus();
                    }
                    else
                    {
                        lberrorPass.Text = "";
                        if (!checkEmail())
                        {
                            lberrorMail.Text = "Email is invalid !";
                            txtMail.Focus();
                        }
                        else
                        {
                            lberrorMail.Text = "";
                            if (!checkPhone())
                            {
                                lberrorPhone.Text = "Phone is invalid !";
                                txtPhone.Focus();
                            }
                            else
                            {
                                lberrorPhone.Text = "";
                                string sql = "insert USERS(username,pass,hoten,department,mail,phone,avatar) values('" + id + "','" + pass + "',N'" + fullname + "',N'" + department + "','" + mail + "','" + phone + "','avatar.png')";
                                SqlCommand cmd = new SqlCommand(sql, conn);
                                int n = cmd.ExecuteNonQuery();
                                if (n == 1)
                                {
                                    lb.Text = "Create Account Successful !";
                                }
                                else
                                {
                                    lb.Text = "Create Account Failed !";
                                }
                            }
                        }
                    }
                }
            }
        }

        
        conn.Close();
    }


    public void loadArea()
    {
        string connect = ConfigurationManager.AppSettings["connect"];
        conn = new SqlConnection(connect);
        conn.Open();

        string sql = "select area_name from KHUVUC";
        SqlDataAdapter sqlda = new SqlDataAdapter(sql,conn);
        DataTable data = new DataTable();
        sqlda.Fill(data);
        DataRow row = data.NewRow();
        row[0] = "---Select Area---";
        data.Rows.InsertAt(row,0);

        dropArea.DataSource = data;
        dropArea.DataTextField = "area_name";
        dropArea.DataValueField = "area_name";
        dropArea.DataBind();
    }

    public void loadDepartment(string area)
    {
        string connect = ConfigurationManager.AppSettings["connect"];
        conn = new SqlConnection(connect);
        conn.Open();
        DataTable data = new DataTable();

        if (area == "Trung Tâm Điều Hành")
        {
            string sql = "select department_name from PHONGBAN";
            SqlDataAdapter sqlda = new SqlDataAdapter(sql, conn);
            sqlda.Fill(data);
            dropDepartment.DataSource = data;
            dropDepartment.DataTextField = "department_name";
            dropDepartment.DataValueField = "department_name";
        }
        else if (area == "Cửa Hàng")
        {
            string sql = "select TENCH from CUAHANG";
            SqlDataAdapter sqlda = new SqlDataAdapter(sql, conn);
            sqlda.Fill(data);
            dropDepartment.DataSource = data;
            dropDepartment.DataTextField = "TENCH";
            dropDepartment.DataValueField = "TENCH";
        }
        dropDepartment.DataBind();

        conn.Close();

        
    }
    protected void dropArea_SelectedIndexChanged(object sender, EventArgs e)
    {
        
        if(dropArea.SelectedValue.ToString() == "Trung Tâm Điều Hành")
        {
            loadDepartment("Trung Tâm Điều Hành");
            
        }
        else if (dropArea.SelectedValue.ToString() == "Cửa Hàng")
        {
            loadDepartment("Cửa Hàng");
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

    public bool checkUsername(string user)
    {
        bool result = false;
        string connect = ConfigurationManager.AppSettings["connect"];
        conn = new SqlConnection(connect);
        conn.Open();
        string sql = "select * from USERS where username = '"+user+"' ";

        SqlDataAdapter sqlda = new SqlDataAdapter(sql,conn);
        DataTable data = new DataTable();
        sqlda.Fill(data);

         
            if (data == null || data.Rows.Count == 0)
            {
                result = true;
            }
            else
            {
                result = false;
            }
        

        

        return result;
    }

    public bool checkPassword(string password)
    {
        
        const int min_length = 8;
        const int max_length = 16;

        bool lengthRequirement = password.Length >= min_length && password.Length <= max_length;
        bool hasUpperCaseChar = false;
        bool hasLowerCaseChar = false;
        bool hasDecimalDigit = false;

        if (lengthRequirement)
        {
            foreach (char c in password)
            {
                if (char.IsUpper(c)) hasUpperCaseChar = true;
                else if (char.IsLower(c)) hasLowerCaseChar = true;
                else if (char.IsDigit(c)) hasDecimalDigit = true;
            }
        }

        bool result = lengthRequirement
                    && hasUpperCaseChar
                    && hasLowerCaseChar
                    && hasDecimalDigit;

        return result;
    }

    public bool checkEmail()
    {
        string mail = txtMail.Text.Trim();
        Regex regex = new Regex(@"^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$");
        Match match = regex.Match(mail);
        if (match.Success)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    public bool checkPhone()
    {
        string phone = txtPhone.Text.Trim();
        Regex regex = new Regex(@"^(\d{10,11})$");
        Match match = regex.Match(phone);
        if (match.Success)
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    
}