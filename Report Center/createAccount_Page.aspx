<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="createAccount_Page.aspx.cs" Inherits="createAccount_Page" %>
<%@ Register Src="~/UC/createaccount_UC.ascx" TagName="createAccount" TagPrefix="UC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="content1" Runat="Server">
    <UC:createAccount ID="create" runat="server"/>
</asp:Content>

