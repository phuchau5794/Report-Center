<%@ Control Language="C#" AutoEventWireup="true" CodeFile="changeAvatar_UC.ascx.cs" Inherits="UC_changeAvatar_UC" %>
<div id="changeAvatar">
    
    <table cellpadding="5">
        <tr>
            <td colspan="2"><center><h1>Change Avatar</h1></center></td>
        </tr>
        <tr>
            <td colspan="2">
                <center><asp:Image ID="update" runat="server" Width="150px" Height="150px"/></center>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:FileUpload ID="ImgUp" runat="server" Width="300px"/>
            </td>
        </tr>
        <tr>
            <td style="text-align:center">
                <asp:Button ID="btnChange" runat="server" Text="Update" CssClass="button" 
                    onclick="btnChange_Click"/>
            </td>
            <td style="text-align:center">
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="button"/>
            </td>
        </tr>
        <tr>
            <td style="text-align:center">
                <asp:Label ID="lbNotice" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
</div>