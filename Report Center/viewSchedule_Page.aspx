<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="viewSchedule_Page.aspx.cs" Inherits="viewSchedule_Page" %>
<%@ Register Src="~/UC/viewSchedule_UC.ascx" TagName="schedule" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="content1" Runat="Server">
    <uc:schedule ID="schedule" runat="server"/>
</asp:Content>

