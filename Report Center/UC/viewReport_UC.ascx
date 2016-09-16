<%@ Control Language="C#" AutoEventWireup="true" CodeFile="viewReport_UC.ascx.cs" Inherits="UC_viewReport_UC" %>

<div>
    <h1>Chi Tiết Report</h1>
    <asp:DetailsView ID="view" runat="server" AutoGenerateRows="False" BackColor="#CCCCCC" 
        BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" 
        CellSpacing="2" ForeColor="Black" Width="700px">
        <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <Fields>
            <asp:BoundField DataField="NGAYTIEPNHAN" DataFormatString="{0:dd/MM/yyyy}" 
                HeaderText="Ngày Tiếp Nhận">
            <HeaderStyle Width="150px" />
            </asp:BoundField>
            <asp:BoundField DataField="NGUOITIEPNHAN" HeaderText="Người Tiếp Nhận" />
            <asp:BoundField DataField="NGUOIXULY" HeaderText="Người Xử Lý" />
            <asp:BoundField DataField="BOPHANYEUCAU" HeaderText="Bộ Phận Yêu Cầu" />
            <asp:BoundField DataField="NGUOIYEUCAU" HeaderText="Người Yêu Cầu" />
            <asp:BoundField DataField="LOAIDICHVU" HeaderText="Loại Dịch Vụ" />
            <asp:BoundField DataField="VANDECUTHE" HeaderText="Vấn Đề" />
            <asp:BoundField DataField="MOTAVANDE" HeaderText="Mô Tả Vấn Đề" />
            <asp:BoundField DataField="TINHTRANG" HeaderText="Tình Trạng" />
        </Fields>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
        <RowStyle BackColor="White" />
    </asp:DetailsView>
    <asp:Button CssClass="button" ID="btnBack" runat="server" Text="Back"/>
</div>