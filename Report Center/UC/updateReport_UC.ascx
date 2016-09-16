<%@ Control Language="C#" AutoEventWireup="true" CodeFile="updateReport_UC.ascx.cs" Inherits="UC_updateReport_UC" %>
<div>
    <h1>Cập Nhật Báo Cáo</h1>
    <asp:DetailsView ID="updateRP" runat="server" Width="700px" AutoGenerateRows="False" 
        BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" 
        CellPadding="3" GridLines="None" CellSpacing="1" Font-Size="14pt">
        <EditRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        <Fields>
            <asp:BoundField DataField="NGAYTIEPNHAN" DataFormatString="{0:dd/MM/yyyy}" 
                HeaderText="Ngày Tiếp Nhận" >
            <HeaderStyle Width="150px" />
            </asp:BoundField>
            <asp:BoundField DataField="NGUOIYEUCAU" HeaderText="Người Yêu Cầu" />
            <asp:BoundField DataField="BOPHANYEUCAU" HeaderText="Bộ Phận Yêu Cầu" />
            <asp:BoundField DataField="NGUOITIEPNHAN" HeaderText="Người Tiếp Nhận" />
            <asp:BoundField DataField="MOTAVANDE" HeaderText="Mô Tả Vấn Đề" />
            <asp:TemplateField HeaderText="Người Xử Lý">
                <ItemTemplate>
                    <asp:DropDownList ID="dropNgXuLy" runat="server" Font-Size="14px" Height="25px"></asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tình Trạng">
                <ItemTemplate>
                    <asp:RadioButtonList ID="rblTinhTrang" runat="server">
                        <asp:ListItem Text="Đang Xử Lý" Value="waiting"></asp:ListItem>
                        <asp:ListItem Text="Đã Xử Lý" Value="complete"></asp:ListItem>
                        <asp:ListItem Text="Không Thể Xử Lý" Value="pending"></asp:ListItem>
                    </asp:RadioButtonList>
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
        
    </asp:DetailsView>
</div>
<asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="button" 
    onclick="btnUpdate_Click" />
    <br />
<asp:Label ID="lb" runat="server" Text=""></asp:Label>

