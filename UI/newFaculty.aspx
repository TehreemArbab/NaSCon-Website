﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="newFaculty.aspx.cs" Inherits="newFaculty" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Create Admin Account</title>
    <link rel="stylesheet" href="styles.css"/>
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

    <form runat="server" id="NewAdminForm" style="margin: 40px 10%">
            <div
                style="
                    display: flex;
                    flex-direction: row;
                    justify-content: space-between;
                "
            >
                <div style="display: flex; flex-direction: column; gap: 16px">
                    <h3 style="margin-bottom: 16px">Create New Faculty</h3>
                    <div class="textField">
                        <p class="label">Username</p>
                        <asp:TextBox 
                            class="input"
                            runat="server"
                            name="Username"
                            id="Username"
                            placeholder="Enter username"
                        />
                    </div>

                    <div class="textField">
                        <p class="label">Employee ID</p>
                        <asp:TextBox 
                            class="input"
                            runat="server"
                            name="empID"
                            id="empID"
                            placeholder="Enter employee ID"
                        />
                    </div>



                    <div class="textField">
                        <p class="label">Name</p>
                        <asp:TextBox 
                            class="input"
                            runat="server"
                            name="Name"
                            id="Name"
                            placeholder="Enter name"
                        />
                    </div>

                    <div class="textField">
                        <p class="label">Password</p>
                        <asp:TextBox 
                            class="input"
                            runat="server"
                            type="password"
                            name="Name"
                            id="Password"
                            placeholder="Enter password"
                        />
                    </div>

                    <%--<div class="textField">
                        <p class="label">Event Category ID</p>
                        <asp:TextBox 
                            class="input"
                            runat="server"
                            name="catID"
                            id="catID"
                            placeholder="Enter event category ID"
                        />
                    </div>--%>

                    <div class="actionBtns">
                        <asp:Button 
                            class="input"
                            runat="server"
                            Text="Cancel"
                            id="Cancel"
                            onclick="goBack"
                        />
                        <asp:Button 
                            class="input primaryAction"
                            runat="server"
                            Text="Create"
                            id="Create"
                            onclick="createAdmin"
                        />
                    </div>
                </div>
            </div>
        </form>
</body>
</html>

