<%@ Control Language="C#" AutoEventWireup="true" CodeFile="manageReport_UC.ascx.cs" Inherits="UC_manageReport_UC" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<cc1:ToolkitScriptManager ID="toolScript1" runat="server"></cc1:ToolkitScriptManager>
<cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="4" 
    CssClass="Tab" Width="100%">
<%--<cc1:TabPanel ID="TabPanel1" runat="server" HeaderText="Tất Cả" Width="100%" Height="600px">
        <ContentTemplate>
            <table>
                <tr>
                    <td><asp:Label ID="lb1" runat="server" Text="Search : "  Font-Size="14px" 
                            Font-Bold="True"></asp:Label></td>
                    <td><asp:TextBox ID="txtSearchAll" runat="server" Width="200px"></asp:TextBox></td>
                    <td><asp:DropDownList ID="dropSearchAll" runat="server">
                        <asp:ListItem Value="0">Người Tiếp Nhận</asp:ListItem>
                        <asp:ListItem Value="1">Người Xử Lý</asp:ListItem>
                        <asp:ListItem Value="2">Tình Trạng</asp:ListItem>
                        </asp:DropDownList></td>
                    <td>
                        <asp:ImageButton ID="btnSearch" runat="server" ImageUrl="~/IMAGES/search.png" ImageAlign="Middle" Width="25px" Height="25px"/>
                        <asp:ImageButton ID="btnRefresh" runat="server" ImageUrl="~/IMAGES/refresh.png" ImageAlign="Middle" Width="25px" Height="25px"/>
                    </td>
                </tr>
            </table>
            <br />
            <hr />
            <br />
            <asp:GridView CssClass="grid" ID="gridAll" runat="server" AutoGenerateColumns="False" 
                BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                CellPadding="3" onrowcommand="gridAll_RowCommand" DataKeyNames="ID_NHATKY" 
                onrowdeleting="gridAll_RowDeleting">
                <Columns>
                    <asp:BoundField DataField="NGAYTIEPNHAN" HeaderText="Ngày" 
                        DataFormatString="{0:dd/MM/yyyy}" >
                    <HeaderStyle Font-Size="16px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="NGUOITIEPNHAN" HeaderText="Người Tiếp Nhận" >
                    <HeaderStyle Font-Size="16px" Width="120px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="NGUOIXULY" HeaderText="Người Xử Lý" >
                    <HeaderStyle Font-Size="16px" Width="120px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="MOTAVANDE" HeaderText="Vấn Đề" >
                    <HeaderStyle Font-Size="16px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="TINHTRANG" HeaderText="Tình Trạng" >
                    <HeaderStyle Font-Size="16px" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Chi Tiết">
                        <ItemTemplate>
                            <asp:ImageButton ID="btnViewAll" runat="server" ImageUrl="~/IMAGES/view.png" 
                                ImageAlign="Middle" Height="25px" Width="25px" ToolTip="View" 
                                CommandArgument='<%# Eval("ID_NHATKY") %>' CommandName="view" onclick="btnViewAll_Click" 
                                />
                        </ItemTemplate>
                        <HeaderStyle Font-Size="16px" Width="65px" />
                        <ItemStyle VerticalAlign="Middle" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Cập Nhật">
                        <ItemTemplate>
                            <asp:ImageButton ID="btnUpdateAll" runat="server" 
                                ImageUrl="~/IMAGES/update.png" Height="25px" Width="25px" ImageAlign="Middle" 
                                ToolTip="Update" CommandName="update" 
                                CommandArgument='<%# Eval("ID_NHATKY") %>'/>
                        </ItemTemplate>
                        <HeaderStyle Font-Size="16px" Width="65px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Xóa">
                        <ItemTemplate>
                            <asp:ImageButton ID="btnDeleteAll" runat="server" 
                                ImageUrl="~/IMAGES/delete.png" ImageAlign="Middle" Height="25px" Width="25px" 
                                ToolTip="Delete" CommandName="delete" 
                                CommandArgument='<%# Eval("ID_NHATKY") %>'/>
                        </ItemTemplate>
                        <HeaderStyle Font-Size="16px" Width="65px" />
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
            </asp:GridView>               
        </ContentTemplate>
 </cc1:TabPanel>--%>
 <cc1:TabPanel ID="TabPanel2" runat="server" HeaderText="Đang Xử Lý" Width="100%" Height="600px">
    <ContentTemplate>
        <table>
                <tr>
                    <td><asp:Label ID="Label1" runat="server" Text="Search : "  Font-Size="14px" 
                            Font-Bold="True"></asp:Label></td>
                    <td><asp:TextBox ID="txtSearchWait" runat="server" Width="200px"></asp:TextBox></td>
                    <td><asp:DropDownList ID="dropSearchWait" runat="server">
                        <asp:ListItem Value="0">Người Tiếp Nhận</asp:ListItem>
                        <asp:ListItem Value="1">Người Xử Lý</asp:ListItem>
                        <asp:ListItem Value="2">Tình Trạng</asp:ListItem>
                        </asp:DropDownList></td>
                    <td>
                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/IMAGES/search.png" ImageAlign="Middle" Width="25px" Height="25px"/>
                        <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/IMAGES/refresh.png" ImageAlign="Middle" Width="25px" Height="25px"/>
                    </td>
                </tr>
            </table>
            <br />
            <hr />
            <br />
            <asp:GridView CssClass="grid" ID="gridWaiting" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" 
            CellPadding="4" GridLines="Horizontal" 
            OnRowCommand="gridWaiting_RowCommand" onrowdeleting="gridWaiting_RowDeleting">
                
                <Columns>
                    <asp:BoundField DataField="NGAYTIEPNHAN" DataFormatString="{0:dd/MM/yyyy}" 
                        HeaderText="Ngày">
                    <HeaderStyle Font-Size="16px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="NGUOITIEPNHAN" HeaderText="Người Tiếp Nhận">
                    <HeaderStyle Font-Size="16px" Width="120px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="NGUOIXULY" HeaderText="Người Xử Lý">
                    <HeaderStyle Font-Size="16px" Width="120px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="MOTAVANDE" HeaderText="Vấn Đề">
                    <HeaderStyle Font-Size="16px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="TINHTRANG" HeaderText="Tình Trạng">
                    <HeaderStyle Font-Size="16px" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Chi Tiết">
                        <ItemTemplate>
                            <asp:ImageButton ID="btnViewWaiting" runat="server" 
                                ImageUrl="~/IMAGES/view.png" ImageAlign="Middle" Height="25px" Width="25px" 
                                ToolTip="View" CommandArgument='<%# Eval("ID_NHATKY") %>' 
                                CommandName="view"/>
                        </ItemTemplate>
                        <HeaderStyle Font-Size="16px" Width="65px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Cập Nhật">
                        <ItemTemplate>
                            <asp:ImageButton ID="btnUpdateWaiting" runat="server" 
                                ImageUrl="~/IMAGES/update.png" Height="25px" Width="25px" ImageAlign="Middle" 
                                ToolTip="Update" CommandArgument='<%# Eval("ID_NHATKY") %>' 
                                CommandName="update"/>
                        </ItemTemplate>
                        <HeaderStyle Font-Size="16px" Width="65px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Xóa">
                        <ItemTemplate>
                            <asp:ImageButton ID="btnDeleteWaiting" runat="server" 
                                ImageUrl="~/IMAGES/delete.png" ImageAlign="Middle" Height="25px" Width="25px" 
                                ToolTip="Delete" CommandArgument='<%# Eval("ID_NHATKY") %>' 
                                CommandName="delete"/>
                        </ItemTemplate>
                        <HeaderStyle Font-Size="16px" />
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#333333" />
                <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#487575" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#275353" />
                
            </asp:GridView>               
    </ContentTemplate>
</cc1:TabPanel>
<cc1:TabPanel ID="TabPanel3" runat="server" HeaderText="Đã Xử Lý" Width="100%" Height="600px">
    <ContentTemplate>
        <table>
                <tr>
                    <td><asp:Label ID="Label2" runat="server" Text="Search : "  Font-Size="14px" 
                            Font-Bold="True"></asp:Label></td>
                    <td><asp:TextBox ID="txtSearchComplete" runat="server" Width="200px"></asp:TextBox></td>
                    <td><asp:DropDownList ID="dropSearchComplete" runat="server">
                        <asp:ListItem Value="0">Người Tiếp Nhận</asp:ListItem>
                        <asp:ListItem Value="1">Người Xử Lý</asp:ListItem>
                        <asp:ListItem Value="2">Tình Trạng</asp:ListItem>
                        </asp:DropDownList></td>
                    <td>
                        <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/IMAGES/search.png" ImageAlign="Middle" Width="25px" Height="25px"/>
                        <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/IMAGES/refresh.png" ImageAlign="Middle" Width="25px" Height="25px"/>
                    </td>
                </tr>
            </table>
            <br />
            <hr />
            <br />
            <asp:GridView CssClass="grid" ID="gridComplete" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" 
            CellPadding="4" OnRowCommand="gridComplete_RowCommand" 
            onrowdeleting="gridComplete_RowDeleting">
                
                <Columns>
                    <asp:BoundField DataField="NGAYTIEPNHAN" DataFormatString="{0:dd/MM/yyyy}" 
                        HeaderText="Ngày">
                    <HeaderStyle Font-Size="16px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="NGUOITIEPNHAN" HeaderText="Người Tiếp Nhận">
                    <HeaderStyle Font-Size="16px" Width="120px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="NGUOIXULY" HeaderText="Người Xử Lý">
                    <HeaderStyle Font-Size="16px" Width="120px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="MOTAVANDE" HeaderText="Vấn Đề">
                    <HeaderStyle Font-Size="16px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="TINHTRANG" HeaderText="Tình Trạng">
                    <HeaderStyle Font-Size="16px" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Chi Tiết">
                        <ItemTemplate>
                            <asp:ImageButton ID="btnViewComplete" runat="server" ImageUrl="~/IMAGES/view.png" 
                                ImageAlign="Middle" Height="25px" Width="25px" ToolTip="View" 
                                CommandArgument='<%# Eval("ID_NHATKY") %>' CommandName="view"/>
                        </ItemTemplate>
                        <HeaderStyle Font-Size="16px" Width="65px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Cập Nhật">
                        <ItemTemplate>
                            <asp:ImageButton ID="btnUpdateComplete" runat="server" 
                                ImageUrl="~/IMAGES/update.png" Height="25px" Width="25px" ImageAlign="Middle" 
                                ToolTip="Update" CommandArgument='<%# Eval("ID_NHATKY") %>' 
                                CommandName="update"/>
                        </ItemTemplate>
                        <HeaderStyle Font-Size="16px" Width="65px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Xóa">
                        <ItemTemplate>
                            <asp:ImageButton ID="btnDeleteComplete" runat="server" 
                                ImageUrl="~/IMAGES/delete.png" ImageAlign="Middle" Height="25px" Width="25px" 
                                ToolTip="Delete" CommandArgument='<%# Eval("ID_NHATKY") %>' 
                                CommandName="delete"/>
                        </ItemTemplate>
                        <HeaderStyle Font-Size="16px" />
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#330099" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                <SortedAscendingCellStyle BackColor="#FEFCEB" />
                <SortedAscendingHeaderStyle BackColor="#AF0101" />
                <SortedDescendingCellStyle BackColor="#F6F0C0" />
                <SortedDescendingHeaderStyle BackColor="#7E0000" />
                
            </asp:GridView>
    </ContentTemplate>
</cc1:TabPanel>
<cc1:TabPanel ID="TabPanel4" runat="server" HeaderText="Hủy" Width="100%" Height="600px">
    <ContentTemplate>
        <table>
                <tr>
                    <td><asp:Label ID="Label3" runat="server" Text="Search : "  Font-Size="14px" 
                            Font-Bold="True"></asp:Label></td>
                    <td><asp:TextBox ID="txtSearchDelete" runat="server" Width="200px"></asp:TextBox></td>
                    <td><asp:DropDownList ID="dropSearchDelete" runat="server">
                        <asp:ListItem Value="0">Người Tiếp Nhận</asp:ListItem>
                        <asp:ListItem Value="1">Người Xử Lý</asp:ListItem>
                        <asp:ListItem Value="2">Tình Trạng</asp:ListItem>
                        </asp:DropDownList></td>
                    <td>
                        <asp:ImageButton ID="ImageButton5" runat="server" ImageUrl="~/IMAGES/search.png" ImageAlign="Middle" Width="25px" Height="25px"/>
                        <asp:ImageButton ID="ImageButton6" runat="server" ImageUrl="~/IMAGES/refresh.png" ImageAlign="Middle" Width="25px" Height="25px"/>
                    </td>
                </tr>
            </table>
            <br />
            <hr />
            <br />
            <asp:GridView CssClass="grid" ID="gridHuy" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" 
            CellPadding="4" GridLines="Horizontal">
                
                <Columns>
                    <asp:BoundField DataField="NGAYTIEPNHAN" DataFormatString="{0:dd/MM/yyyy}" 
                        HeaderText="Ngày">
                    <HeaderStyle Font-Size="16px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="NGUOITIEPNHAN" HeaderText="Người Tiếp Nhận">
                    <HeaderStyle Font-Size="16px" Width="120px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="NGUOIXULY" HeaderText="Người Xử Lý">
                    <HeaderStyle Font-Size="16px" Width="120px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="MOTAVANDE" HeaderText="Vấn Đề">
                    <HeaderStyle Font-Size="16px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="TINHTRANG" HeaderText="Tình Trạng">
                    <HeaderStyle Font-Size="16px" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Chi Tiết">
                        <ItemTemplate>
                            <asp:ImageButton ID="btnViewHuy" runat="server" ImageUrl="~/IMAGES/view.png" ImageAlign="Middle" Height="25px" Width="25px" ToolTip="View"/>
                        </ItemTemplate>
                        <HeaderStyle Font-Size="16px" Width="65px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Xóa">
                        <ItemTemplate>
                            <asp:ImageButton ID="btnDeleteHuy" runat="server" ImageUrl="~/IMAGES/delete.png" ImageAlign="Middle" Height="25px" Width="25px" ToolTip="Delete"/>
                        </ItemTemplate>
                        <HeaderStyle Font-Size="16px" />
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#333333" />
                <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#487575" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#275353" />
                
            </asp:GridView>
    </ContentTemplate>
</cc1:TabPanel>
<cc1:TabPanel ID="TabPanel5" runat="server" HeaderText="Không Xử Lý" Width="100%" Height="600px">
    <HeaderTemplate>
        Hoãn
    </HeaderTemplate>
    <ContentTemplate>
        <table>
                <tr>
                    <td><asp:Label ID="Label4" runat="server" Text="Search : "  Font-Size="14px" 
                            Font-Bold="True"></asp:Label></td>
                    <td><asp:TextBox ID="txtSeachPending" runat="server" Width="200px"></asp:TextBox></td>
                    <td><asp:DropDownList ID="dropPending" runat="server">
                        <asp:ListItem Value="0">Người Tiếp Nhận</asp:ListItem>
                        <asp:ListItem Value="1">Người Xử Lý</asp:ListItem>
                        <asp:ListItem Value="2">Tình Trạng</asp:ListItem>
                        </asp:DropDownList></td>
                    <td>
                        <asp:ImageButton ID="ImageButton7" runat="server" ImageUrl="~/IMAGES/search.png" ImageAlign="Middle" Width="25px" Height="25px"/>
                        <asp:ImageButton ID="ImageButton8" runat="server" ImageUrl="~/IMAGES/refresh.png" ImageAlign="Middle" Width="25px" Height="25px"/>
                    </td>
                </tr>
            </table>
            <br />
            <hr />
            <br />
            <asp:GridView CssClass="grid" ID="gridPending" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" 
            CellPadding="4" GridLines="Horizontal">
                
                <Columns>
                    <asp:BoundField DataField="NGAYTIEPNHAN" DataFormatString="{0:dd/MM/yyyy}" 
                        HeaderText="Ngày">
                    <HeaderStyle Font-Size="16px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="NGUOITIEPNHAN" HeaderText="Người Tiếp Nhận">
                    <HeaderStyle Font-Size="16px" Width="120px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="NGUOIXULY" HeaderText="Người Xử Lý">
                    <HeaderStyle Font-Size="16px" Width="120px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="MOTAVANDE" HeaderText="Vấn Đề">
                    <HeaderStyle Font-Size="16px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="TINHTRANG" HeaderText="Tình Trạng">
                    <HeaderStyle Font-Size="16px" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Chi Tiết">
                        <ItemTemplate>
                            <asp:ImageButton ID="btnViewPending" runat="server" ImageUrl="~/IMAGES/view.png" ImageAlign="Middle" Height="25px" Width="25px" ToolTip="View"/>
                        </ItemTemplate>
                        <HeaderStyle Font-Size="16px" Width="65px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Cập Nhật">
                        <ItemTemplate>
                            <asp:ImageButton ID="btnUpdatePending" runat="server" ImageUrl="~/IMAGES/update.png" Height="25px" Width="25px" ImageAlign="Middle" ToolTip="Update"/>
                        </ItemTemplate>
                        <HeaderStyle Font-Size="16px" Width="65px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Xóa">
                        <ItemTemplate>
                            <asp:ImageButton ID="btnDeletePending" runat="server" ImageUrl="~/IMAGES/delete.png" ImageAlign="Middle" Height="25px" Width="25px" ToolTip="Delete"/>
                        </ItemTemplate>
                        <HeaderStyle Font-Size="16px" />
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#333333" />
                <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#487575" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#275353" />
            </asp:GridView>
    </ContentTemplate>
</cc1:TabPanel>
</cc1:TabContainer>