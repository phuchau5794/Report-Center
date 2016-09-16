<%@ Control Language="C#" AutoEventWireup="true" CodeFile="updateRole_UC.ascx.cs" Inherits="UC_updateRole_UC" %>
<div id="update">
    <h1>UPDATE AUTHORIZATION</h1>
    <table>
        <tr>
            <td style="width:100px;font-size:14px;border-bottom:1px solid"><b>Fullname :</b> </td>
            <td style="width:350px;border-bottom:1px solid"><asp:Label ID="lbFullname" runat="server"/></td>
        </tr>
        <tr>
            <td style="width:100px;font-size:14px;border-bottom:1px solid"><b>Username :</b> </td>
            <td style="width:350px;border-bottom:1px solid"><asp:Label ID="lbUsername" runat="server"/></td>
        </tr>
        <tr>
            <td style="width:100px;font-size:14px;border-bottom:1px solid"><b>Department :</b> </td>
            <td style="width:350px;border-bottom:1px solid"><asp:Label ID="lbDepartment" runat="server"/></td>
        </tr>
        <tr>
            <td style="font-size:14px;font-weight:bold;border-bottom:1px solid" colspan="2">Choose role :</td>
        </tr>
        <tr style="float:left">
            <td style="font-size:14px;border-bottom:1px solid" colspan="2">
                <asp:CheckBoxList ID="cblRole" runat="server" AutoPostBack="True">
                    <asp:ListItem Text="Administrator" Value="1"></asp:ListItem>
                    <asp:ListItem Text="User" Value="2"></asp:ListItem>
                    <asp:ListItem Text="Guest" Value="3"></asp:ListItem>
                </asp:CheckBoxList>
            </td>
        </tr>
    </table>
    <div id="button">
        <asp:Button CssClass="button" ID="btnUpdate" runat="server" Text="Update" 
            onclick="btnUpdate_Click"/>
        <asp:Button CssClass="button" ID="btnCancel" runat="server" Text="Cancel"/>
    </div>
    <center><asp:Label ID="lbError" runat="server"></asp:Label></center>
</div>