<%@ Control Language="C#" AutoEventWireup="true" CodeFile="createReport_UC.ascx.cs" Inherits="UC_createReport_UC" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="toolKit" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit.HTMLEditor" tagprefix="cc1" %>
<div id="report">
<toolKit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></toolKit:ToolkitScriptManager>
    <h1 style="color:#2F4F4F;margin:0 auto 0 auto">
        
        Create Report</h1>
        <table style="border-top:1px solid;width:750px;font-size:14px">
            <tr>
                <td class="table_cell_left">Người Tiếp Nhận : </td>
                <td colspan="2" style="border-bottom:1px solid"><asp:Label ID="lbName" runat="server"/></td>
            </tr>
            <tr>
                <td class="table_cell_left">E-mail : </td>
                <td colspan="2" style="border-bottom:1px solid"><asp:Label ID="lbMail" runat="server"/></td>
            </tr>
            <tr>
                <td class="table_cell_left">Bộ phận yêu cầu <b style="color:Red">*</b> :</td>
                <td style="border-bottom:1px solid"><asp:DropDownList ID="dropDepartment" runat="server" CssClass="dropdown"/></td>
                <td></td>
            </tr>
            <tr>
                <td class="table_cell_left">Người Yêu Cầu <b style="color:Red">*</b> :</td>
                <td style="border-bottom:1px solid"><asp:TextBox ID="txtRequester" runat="server" Width="200px"></asp:TextBox></td>
                <td style="border-bottom:1px solid"><asp:Label ID="lbErrNYC" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="table_cell_left">Loại Vấn Đề <b style="color:Red">*</b> :</td>
                <td style="border-bottom:1px solid"><asp:DropDownList ID="dropService" 
                        runat="server" CssClass="dropdown" AutoPostBack="True" 
                        onselectedindexchanged="dropService_SelectedIndexChanged"></asp:DropDownList></td>
                <td><asp:Label ID="lbErrLoaiVanDe" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="table_cell_left">Vấn Đề Cụ Thể <b style="color:Red">*</b> :</td>
                <td style="border-bottom:1px solid"><asp:DropDownList ID="dropMota" runat="server" CssClass="dropdown" AutoPostBack="True"></asp:DropDownList>
                        <asp:TextBox CssClass="textarea" ID="txtKhac" runat="server" TextMode="MultiLine" Columns="50" Rows="5" Visible="false"></asp:TextBox>
                        </td>
                <td style="border-bottom:1px solid"><asp:Label ID="lbErrVDCT" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="table_cell_left">Mô Tả Vấn Đề : <b style="color:Red">*</b> :</td>
                <td style="border-bottom:1px solid">
                    <cc1:Editor ID="Editor1" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="table_cell_left">Cách Xử Lý :<b style="color:Red">*</b> :</td>
                <td style="border-bottom:1px solid"><asp:TextBox ID="txtCachXuLy" runat="server" TextMode="MultiLine" Columns="50" Rows="2" CssClass="textarea"></asp:TextBox>
                    <asp:HyperLink ID="lnkCachXuLy" runat="server"></asp:HyperLink>
                </td>
                <td style="border-bottom:1px solid"><asp:Label ID="lbErrCachXuLy" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="table_cell_left">Người Xử Lý :<b style="color:Red">*</b> :</td>
                <td style="border-bottom:1px solid"><asp:DropDownList ID="dropNgXuLy" runat="server"></asp:DropDownList></td>
                <td style="border-bottom:1px solid"><asp:Label ID="lbErrNgXuLy" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="table_cell_left">Tình Trạng :<b style="color:Red">*</b> :</td>
                <td style="border-bottom:1px solid" colspan="2">
                    <asp:RadioButtonList ID="rblStatus" runat="server">
                        <asp:ListItem Text="Đang Xử Lý" Value="waiting"></asp:ListItem>
                        <asp:ListItem Text="Đã Xử Lý" Value="complete"></asp:ListItem>
                        <asp:ListItem Text="Không Thể Xử Lý" Value="pending"></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td class="table_cell_left">Browse image file :
                    <b style="color:Red">(*.jpg,*.png,< 200kb)</b>
                </td>
                <td style="border-bottom:1px solid">
                    <asp:FileUpload ID="upImg" runat="server"/>
                    <asp:RegularExpressionValidator ID="validate1" runat="server" ControlToValidate="upImg" ErrorMessage="Only *.jpg , *.png, <200kb" ValidationExpression=".*\.([Jj][Pp][Gg])|.*\.([Pp][Nn][Gg])$"></asp:RegularExpressionValidator>
                </td>
            </tr>
        </table>
        <div style="padding-top:10px;padding-bottom:10px">
            <asp:Button ID="btnSend" runat="server" Text="Send Report" CssClass="button" 
                Width="150px" Font-Size="14px" Font-Bold="true" onclick="btnSend_Click"/>
        </div>
</div>
<center style="font-size:18pt"><asp:Label ID="lbNotice" runat="server"></asp:Label></center>

