<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="createReport_Page.aspx.cs" Inherits="createReport_Page" %>
<%@ Register Src="~/UC/createReport_UC.ascx" TagName="report" TagPrefix="UC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="content1" Runat="Server">
    <UC:report ID="rp" runat="server"/>
</asp:Content>

