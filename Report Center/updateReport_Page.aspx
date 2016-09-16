<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="updateReport_Page.aspx.cs" Inherits="updateReport_Page" %>
<%@ Register Src="~/UC/updateReport_UC.ascx" TagName="updateRP" TagPrefix="UC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="content1" Runat="Server">
    <UC:updateRP ID="update" runat="server"/>
</asp:Content>

