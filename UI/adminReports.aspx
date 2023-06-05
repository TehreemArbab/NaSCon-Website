<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adminReports.aspx.cs" Inherits="adminReports" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reports</title>
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

    <form id="adminForm" runat="server" style="margin: 40px 10%">
        <h3 style="margin: 32px 0px; text-align: center;">List of Reports</h3>
        
        <div class="reportsListContainer">
            <div class="reportsList">
                <a href="<%="showReport.aspx?reportNo=1" %>" class="report"> List of all the registered participants and their information </a>

                <a href="<%="showReport.aspx?reportNo=2" %>" class="report"> Total amount collected by sponsors for each category  </a>

                <a href="<%="showReport.aspx?reportNo=3" %>" class="report"> List of the events and their information in specific category </a>

                <a href="<%="showReport.aspx?reportNo=4" %>" class="report"> List of all the Faculty Mentors or of specific category</a>

                <a href="<%="showReport.aspx?reportNo=5" %>" class="report"> List of all Student Executives (by event, bycategory, by management department)</a>

                <a href="<%="showReport.aspx?reportNo=6" %>" class="report"> List of sponsors and their information </a>
            </div>
            

            <div class="reportsList">
                <a href="<%="showReport.aspx?reportNo=7" %>" class="report"> Search specific participant by name or unique ID</a>

                <a href="<%="showReport.aspx?reportNo=8" %>" class="report"> List of those participants who have registered for food deal</a>

                <a href="<%="showReport.aspx?reportNo=9" %>" class="report"> List of events to be held on specific date </a>

                <a href="<%="showReport.aspx?reportNo=10" %>" class="report"> Total number of registrations in a specific event </a>

                <a href="<%="showReport.aspx?reportNo=11" %>" class="report"> Name of faculty mentor, event head, and details of a specific event </a>

            </div>

        </div>
    </form>

    
</body>
</html>
