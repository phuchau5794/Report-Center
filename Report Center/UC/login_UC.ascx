<%@ Control Language="C#" AutoEventWireup="true" CodeFile="login_UC.ascx.cs" Inherits="UC_login_UC" %>
<!DOCTYPE html ">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>LOGIN</title>
    <link type="text/css" href="../CSS/styles.css" rel="Stylesheet"/>
</head>
<body>
    <form id="form1" runat="server">
    <div id="login_main">
        <center><img alt=""  src="IMAGES/logo.png" width="200px" height="100px"/></center>
        <table id="login_box">
            <tr>
                <td style="width:130px;text-align:center;font-size:14px;font-weight:bold">Username : </td>
                <td><asp:TextBox ID="user" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width:130px;text-align:center;font-size:14px;font-weight:bold">Password : </td>
                <td><asp:TextBox ID="pass" runat="server" TextMode="Password"></asp:TextBox></td>
            </tr>
        </table>
        <table id="button_box">
            <tr>
                <td style="text-align:center"><asp:Button CssClass="button" ID="btnLogin" 
                        runat="server" Text="Login" onclick="btnLogin_Click"/></td>
                <td style="text-align:center"><asp:Button CssClass="button" ID="btnExit" 
                        runat="server" Text="Exit" onclick="btnExit_Click"/></td>
            </tr>
        </table>
    </div>
    <div id="error">
        
        <asp:Label ID="lbError" runat="server" ForeColor="Red"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="user" ErrorMessage="Invalid Username !!!" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ControlToValidate="pass" ErrorMessage="Invalid Password !!!" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>
    </form>
</body>
</html>