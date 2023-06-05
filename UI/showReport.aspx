<%@ Page Language="C#" AutoEventWireup="true" CodeFile="showReport.aspx.cs" Inherits="showReport" %>

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
        <h3 style="margin: 32px 0px; text-align: center;"><% = reportName %></h3>

        <% if (specificQuery)
            { %>
        <div>
            <div class="textField">
                <p class="label">Select Option</p>
                <asp:DropDownList
                    class="input"
                    runat="server"
                    name="Username"
                    id="DropDownList1"
                />
            </div>

                <% if (reportNo == "7")
                    {%>
                   <div class="textField">
                        <p class="label">Search Name</p>
                        <asp:TextBox
                            class="input"
                            runat="server"
                            name="Name"
                            id="Name"
                        />
                    </div>
                <%}
                    else
                    {
                        this.Visible = false;
                    }%>
            <div class="actionBtns">
                <asp:Button 
                    class="input"
                    runat="server"
                    Text="Load"
                    id="loadReport"
                    Onclick="LoadReport"
                />
            </div>
        </div>
        <%}
            else
            {
                this.Visible = false;
            } %>
        
        <asp:PlaceHolder ID = "PlaceHolder1" runat="server" />
    </form>
</body>
</html>

