<%@ Control Language="C#" AutoEventWireup="true" CodeFile="viewSchedule_UC.ascx.cs" Inherits="UC_viewSchedule_UC" %>
<center><h1>Job Schedule</h1></center>
<div style="width:400px;margin:auto;">
    <table style="width:400px;">
        <tr>
            <td style="width:25%;">From :</td>
            <td style="width:25%;"><asp:Label ID="from" runat="server"></asp:Label></td>
            <td style="width:25%;">To :</td>
            <td style="width:25%;"><asp:Label ID="to" runat="server"></asp:Label></td>
        </tr>
    </table>
</div>
<div style="width:700px;margin:auto;">
    <asp:GridView ID="gridSchedule" runat="server" AutoGenerateColumns="False" 
        BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" 
        CellPadding="4" CellSpacing="2" ForeColor="Black">
        <Columns>
            <asp:BoundField HeaderText="Full Name" DataField="HOTEN">
            <HeaderStyle Width="200px" />
            </asp:BoundField>
            <asp:BoundField HeaderText="Monday" DataField="THU2" >
            <HeaderStyle Width="70px" />
            </asp:BoundField>
            <asp:BoundField HeaderText="Tuesday" DataField="THU3" >
            <HeaderStyle Width="70px" />
            </asp:BoundField>
            <asp:BoundField HeaderText="Wednesday" DataField="THU4" >
            <HeaderStyle Width="70px" />
            </asp:BoundField>
            <asp:BoundField HeaderText="Thursday" DataField="THU5" >
            <HeaderStyle Width="70px" />
            </asp:BoundField>
            <asp:BoundField HeaderText="Friday" DataField="THU6" >
            <HeaderStyle Width="70px" />
            </asp:BoundField>
            <asp:BoundField HeaderText="Saturday" DataField="THU7" >
            <HeaderStyle Width="70px" />
            </asp:BoundField>
            <asp:BoundField HeaderText="Sunday" DataField="CN" >
            <HeaderStyle Width="70px" />
            </asp:BoundField>
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
        <RowStyle BackColor="White" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
</div>
<center><asp:Label ID="lb" runat="server"></asp:Label></center>
<div style="width:600px;margin:auto;text-align:center;padding:10px;">
    <asp:ImageButton ID="btnReport" runat="server" ImageUrl="~/IMAGES/pdf.png" 
        Width="48px" Height="48px" onclick="btnReport_Click" ToolTip="PDF"/>
    <asp:ImageButton ID="btnExcel" runat="server" ImageUrl="~/IMAGES/Excel.png" 
        Width="48px" Height="48px" onclick="btnExcel_Click" ToolTip="Excel"/>
    <asp:ImageButton ID="btnWord" runat="server" ImageUrl="~/IMAGES/word.png" 
        Width="48px" Height="48px" ToolTip="Word" onclick="btnWord_Click"/>
</div>
