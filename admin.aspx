﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin.aspx.cs" Inherits="admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Accounts</title>
    <link rel="stylesheet" href="styles.css"/>
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
</head>
<body>
    <menu
        style="
            display: flex;
            align-items: center;
            justify-content: space-around;
            padding: 24px 10%;
            padding-top: 16px;
            border-bottom: 1px solid gray;
        "
    >
        <div class="logo" style="margin-right: 100px; display: flex; flex-direction: column; justify-content: center; align-items: center;">
            <img
                src=<%= Application["logo"].ToString()%>
                alt=""
                width="56px"
                onclick="location.href = 'AdminIndex.aspx';"
                style="cursor: pointer"
            />
            <p style="margin-top: 8px;">Admin Portal</p>
        </div>

        <a class="navBtns" href="adminIndex.aspx">Home</a>
        <a class="navBtns" href="admin.aspx">Admin</a>
        <a class="navBtns" href="faculty.aspx">Faculty</a>
        <a class="navBtns" href="student.aspx">Student Executives</a>
        <a class="navBtns" href="events.aspx">Events</a>
        <a class="navBtns" href="sponsors.aspx">Sponsors</a>
        <a class="navBtns" href="adminReports.aspx">Reports</a>
        <a class="navBtns" href="login.aspx">Log Out</a>
    </menu>

    <%--<div id="nav-placeholder">

    <script>
        $(function () {
            $("#nav-placeholder").load("navAdmin.html");
        });
    </script>--%>

    <form id="adminForm" runat="server" style="margin: 40px 10%">
        <div class="actionBtns">
            <asp:Button ID="createAdminAccount" runat="server" Text="Create Admin Account" style="width: max-content" class="input" OnClick="createNewAdminBtn"/>
        </div>
        <h4 style="margin: 32px 0px">List of Admins</h4>
        
        <div
            style="
                display: flex;
                flex-direction: row;
                justify-content: space-between;
            "
        >
            <table styles="margin-bottom: 24px">
                <tr>
                    <th>Name</th>
                    <th>Username</th>
                </tr>
                <asp:PlaceHolder ID = "FillTable" runat="server" />                
            </table>
            <div>
                <div class="textField">
                    <p class="label">Select Username to Perform Operations</p>
                    <asp:DropDownList
                        class="input"
                        runat="server"
                        name="Username"
                        id="DropDownList1"
                        placeholder="Enter username"
                    />
                </div>
                <div class="actionBtns">
                    <asp:Button 
                        class="input"
                        runat="server"
                        Text="Delete"
                        id="Delete"
                        Onclick="deleteRow"
                    />
                    <asp:Button 
                        class="input primaryAction"
                        runat="server"
                        Text="Edit"
                        id="Edit"
                        Onclick="editRow"
                    />
                </div>
            </div>
        </div>
    </form>

    
</body>
</html>
