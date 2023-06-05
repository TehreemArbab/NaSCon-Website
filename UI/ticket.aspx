<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ticket.aspx.cs" Inherits="ticket" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registeration</title>
    <link rel="stylesheet" href="styles.css">
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
            <div
                class="logo"
                style="
                    margin-right: 440px;
                    display: flex;
                    flex-direction: row;
                    justify-content: center;
                    align-items: center;
                "
            >
                <img
                    src=<%= Application["logo"].ToString()%>
                    alt=""
                    onclick="location.href = 'index.aspx';"
                    style="cursor: pointer; width: 56px"
                />
                <p style="margin-left: 8px"><b>Nascon</b></p>
            </div>

            <a class="navBtns" href="index.aspx">Home</a>
            <a class="navBtns" href="eventsList.aspx">Events</a>
            <a class="navBtns" href="login.aspx">Log In</a>
        </menu>

     <form runat="server" id="RegTeamForm" style="margin: 40px 10%">
            <div
                style="
                    display: flex;
                    flex-direction: row;
                    justify-content: space-between;
                "
            >
                <div style="display: flex; flex-direction: column; gap: 16px">

    <div class="container">
       <h3 style="margin-bottom: 16px">Ticket</h3>

        <table styles="margin-bottom: 24px">
                <tr>
                    <th>Event Name</th>
                    <th>Name</th>
                    <th>Cost</th>
                </tr>
                <asp:PlaceHolder ID = "FillTable" runat="server" />                
            </table>
    </form>
     </div>
</body>
</html>
