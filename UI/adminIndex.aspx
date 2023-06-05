<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adminIndex.aspx.cs" Inherits="index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Portal</title>
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

        <form
                 id="stats" runat="server" style="margin: 32px 10%">
            <h2>Welcome</h2>
            <%--<asp:TextBox class="input" type="text" id="adminUsername" runat="server" value="" disabled style="font-size: 20px;"/>--%>

            <div
                style="
                    display: flex;
                    justify-content: space-between;
                    flex-wrap: wrap;
                "
            >
                <div class="stats">
                    <asp:TextBox class="input" type="text" id="eventsCount" runat="server" value="" disabled/>
                    <h4>Events</h4>
                </div>
                <div class="stats">
                    <asp:TextBox class="input" type="text" id="adminCount" runat="server" value="" disabled/>
                    <h4>Admins</h4>
                </div>
                <div class="stats">
                    <asp:TextBox class="input" type="text" id="facultyCount" runat="server" value="" disabled/>
                    <h4>Faculty Members</h4>
                </div>
                <div class="stats">
                    <asp:TextBox class="input" type="text" id="studentsCount" runat="server" value="" disabled/>
                    <h4>Student Executives</h4>
                </div>
            </div>
        </form>
    </body>
</html>
