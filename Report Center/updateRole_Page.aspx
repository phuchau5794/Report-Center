<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="updateRole_Page.aspx.cs" Inherits="updateRole_Page" %>
<%@ Register Src="~/UC/updateRole_UC.ascx" TagName="upRole" TagPrefix="UC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="content1" Runat="Server">
    <UC:upRole ID="update" runat="server"/>
</asp:Content>

