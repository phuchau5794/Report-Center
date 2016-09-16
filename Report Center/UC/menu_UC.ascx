<%@ Control Language="C#" AutoEventWireup="true" CodeFile="menu_UC.ascx.cs" Inherits="UC_menu_UC" %>
<style type="text/css">
    ul
    {
        list-style-type: none;
        margin: 0;
        padding: 0;
        overflow: hidden;
        background-color: #2F4F4F;
        height:30px;
    }
    li
    {
        float:left;
        width:80px;
        border-right: 1px solid #bbb;
        min-width:100px;
    }
    
    li a 
    {
        display: block;
        color: white;
        text-align: center;
        padding:10px auto auto 10px;
        text-decoration: none;
        font-size:14px;
    }
    
    li a:hover 
    {
        background-color: #8470FF;
    }
    
    ul li ul li
    {
        display:block;
        color: white;
        text-align: center;
        padding:10px auto auto 10px;
        text-decoration: none;
    }
    
    ul>li:hover ul
    {
        display:block;
    }
    ul>li>ul
    {
        display:none;
        position:absolute;
    }
</style>
<ul>
    <li><a href="~/../Default.aspx">Home</a></li>
    <li><a href="~/../createReport_Page.aspx">Report</a></li>
    <li><a href="~/../viewSchedule_Page.aspx">Schedule</a></li>
    <li style="width:100px"><a href="~/../createAccount_Page.aspx">Create Account</a></li>
    <li><a href="~/../manageReport_Page.aspx">Support</a></li>
    <li><a href="#">System</a>
        <ul>
            <li><a href="~/../updateRole_Page.aspx">Update Role</a></li>
        </ul>
    </li>
    <ul style="list-style-type:none;float:right">
        <li><a href="~/../about_Page.aspx">About</a></li>
        <%if (Session["user"].ToString() == null)
          {%>
            <li><a href="~/../login_Page.aspx">Login</a></li>
        <%}
          else
          {%>
            <li><a href="~/../logout_Page.aspx">Log Out</a></li>  
        <%} %>
    </ul>
</ul>