<%@ Control Language="C#" AutoEventWireup="true" CodeFile="createaccount_UC.ascx.cs" Inherits="UC_createaccount_UC" %>
<!DOCTYPE html ">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
    <title>CREATE ACCOUNT</title>
    <link type="text/css" href="../CSS/styles.css" rel="Stylesheet"/>
</head>
<body>
    <div id="createAccount">
        <center><b class="title">CREATE ACCOUNT</b></center>
            <table cellpadding="5" style="padding:20px;width:600px;margin-left:auto;margin-right:auto">
            <tr>
                <td style="width:30%;text-align:left;font-size:14px">Fullname : </td>
                <td><asp:TextBox ID="txtFullname" runat="server" Width="200px"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="Require1" runat="server" ControlToValidate="txtFullname" ErrorMessage="Fullname can not be blank !" ForeColor="Red"/>
                </td>
            </tr>
            <tr>
                <td style="width:20%;text-align:left;font-size:14px">Area : </td>
                <td><asp:DropDownList ID="dropArea" runat="server" Width="200px" 
                        Height="22px" AutoPostBack="True" 
                        onselectedindexchanged="dropArea_SelectedIndexChanged"></asp:DropDownList></td>
                <td><asp:Label ID="lbErrArea" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td style="width:20%;text-align:left;font-size:14px">Department : </td>
                <td><asp:DropDownList ID="dropDepartment" runat="server" Width="200px" 
                        Height="22px" AutoPostBack="True"></asp:DropDownList></td>
                <td><asp:Label ID="lbErrDep" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td style="width:20%;text-align:left;font-size:14px">Account ID : </td>
                <td><asp:TextBox ID="txtID" runat="server" Width="200px"></asp:TextBox></td>
                <td><asp:Label ID="lbErrID" runat="server" ForeColor="Red"></asp:Label></td>
            </tr>
            <tr>
                <td style="width:20%;text-align:left;font-size:14px">Password : </td>
                <td><asp:TextBox ID="txtPassword" runat="server" Width="200px" TextMode="Password"></asp:TextBox></td>
                <td><asp:Label ID="lberrorPass" runat="server" Text="" ForeColor="Red"></asp:Label></td>
            </tr>
            <tr>
                <td style="width:20%;text-align:left;font-size:14px">Confirm Password : </td>
                <td><asp:TextBox ID="txtConfirm" runat="server" Width="200px" TextMode="Password"></asp:TextBox></td>
                <td><asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Confirm password not match !" ForeColor="Red" ControlToCompare="txtPassword" ControlToValidate="txtConfirm"></asp:CompareValidator></td>
            </tr>
            <tr>
                <td style="width:20%;text-align:left;font-size:14px">E-Mail : </td>
                <td><asp:TextBox ID="txtMail" runat="server" Width="200px"></asp:TextBox></td>
                <td><asp:Label ID="lberrorMail" runat="server" Text="" ForeColor="Red"></asp:Label></td>
            </tr>
            <tr>
                <td style="width:20%;text-align:left;font-size:14px">Phone Number : </td>
                <td><asp:TextBox ID="txtPhone" runat="server" Width="200px"></asp:TextBox></td>
                <td><asp:Label ID="lberrorPhone" runat="server" Text="" ForeColor="Red"></asp:Label></td>
                
            </tr>
        </table>
        <div id="button_box_account">
            <asp:Button CssClass="button" ID="btnCreate" runat="server" Text="Create" 
                onclick="btnCreate_Click"/>
            <asp:Button CssClass="button" ID="btnCancel" runat="server" Text="Cancel"/>
        </div>
    </div>
    <center><asp:Label ForeColor="Red" ID="lb" runat="server"></asp:Label></center>
    
</body>
</html>