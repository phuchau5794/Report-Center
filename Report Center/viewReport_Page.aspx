<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="viewReport_Page.aspx.cs" Inherits="viewReport_Page"  EnableEventValidation="true"%>
<%@ Register Src="~/UC/viewReport_UC.ascx"  TagName="viewRP" TagPrefix="UC"%>
<asp:Content ID="Content1" ContentPlaceHolderID="content1" Runat="Server">
    <UC:viewRP runat="server"/>
</asp:Content>

