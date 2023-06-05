<%@ Page Language="C#" AutoEventWireup="true" CodeFile="facultyReports.aspx.cs" Inherits="facultyReports" %>

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
                onclick="location.href = 'index.aspx';"
                style="cursor: pointer"
            />
            <p style="margin-top: 8px;">Fauclty Portal</p>
        </div>

      <a class="navBtns" href="Home.aspx">Home</a>
            <a class="navBtns" href="event.aspx">Events</a>
            <a class="navBtns" href="Executives.aspx">Executives</a>
            <a class="navBtns" href="Participants.aspx">Participants</a>
            <a class="navBtns" href="facultyReports.aspx">Reports</a>
            <a class="navBtns" href="login.aspx">Log Out</a>
    </menu>

    <form id="adminForm" runat="server" style="margin: 40px 10%">
        <h3 style="margin: 32px 0px; text-align: center;">List of Reports</h3>
        
        <div class="reportsListContainer">
            <div class="reportsList">
                <a href="<%="showReportsNew.aspx?reportNo=1" %>" class="report"> List of all the registered participants and their information </a>

                <a href="<%="showReportsNew.aspx?reportNo=3" %>" class="report"> List of the events and their information in specific category </a>

                <a href="<%="showReportsNew.aspx?reportNo=5" %>" class="report"> List of all Student Executives (by event, bycategory, by management department)</a>

            </div>
            

            <div class="reportsList">
                <a href="<%="showReportsNew.aspx?reportNo=7" %>" class="report"> Search specific participant by name or unique ID</a>

                <a href="<%="showReportsNew.aspx?reportNo=9" %>" class="report"> List of events to be held on specific date </a>

                <a href="<%="showReportsNew.aspx?reportNo=10" %>" class="report"> Total number of registrations in a specific event </a>


            </div>

        </div>
    </form>

    
</body>
</html>
