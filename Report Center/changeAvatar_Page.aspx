<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="changeAvatar_Page.aspx.cs" Inherits="changeAvatar_Page" %>
<%@ Register Src="~/UC/changeAvatar_UC.ascx" TagName="updateAvatar" TagPrefix="UC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="content1" Runat="Server">
    <UC:updateAvatar ID="upAVa" runat="server"/>
</asp:Content>

