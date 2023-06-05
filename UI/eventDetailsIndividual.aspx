<%@ Page Language="C#" AutoEventWireup="true" CodeFile="eventDetailsIndividual.aspx.cs" Inherits="eventDetailsIndividual" %>

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
       <h3 style="margin-bottom: 16px">Individual Registeration Form</h3>

        <div class ="team-details">
            <div class="textField">
                        <p class="label">Event</p>
                        <asp:TextBox 
                            class="input"
                            runat="server"
                            type="text"
                            name="EventName"
                            id="EventName"
                            placeholder="Enter Event Name"
                            disabled
                        />
                    </div>
                    <div class="textField">
                        <p class="label">Full Name</p>
                        <asp:TextBox 
                            class="input"
                            runat="server"
                            type="text"
                            name="Name"
                            id="Name"
                            placeholder="Enter Name"
                        />
                    </div>
                <div class="textField">
                        <p class="label">CNIC</p>
                        <asp:TextBox 
                            class="input"
                            runat="server"
                            type="text"
                            name="CNIC"
                            id="CNIC"
                            placeholder="Enter CNIC"
                        />
                    </div>
                
                <div class="textField">
                        <p class="label">Email</p>
                        <asp:TextBox 
                            class="input"
                            runat="server"
                            type="text"
                            name="Email"
                            id="Email"
                            placeholder="Enter email"
                        />
                    </div>
                <div class="textField">
                        <p class="label">Contact no.</p>
                        <asp:TextBox 
                            class="input"
                            runat="server"
                            type="text"
                            name="Contact"
                            id="Contact"
                            placeholder="Enter Contact no."
                        />
                    </div>
                <div class="textField">
                        <p class="label">Food Package</p>
                        <asp:TextBox 
                            class="input"
                            runat="server"
                            type="text"
                            name="food"
                            id="food"
                            placeholder="Enter 1, 2 or 3"
                        />
                    </div>


                    <div class="actionBtns">
                        <asp:Button 
                            class="input"
                            runat="server"
                            Text="Register"
                            id="Button1"
                            onclick="goBack"
                        />
                        <asp:Button 
                            class="input primaryAction"
                            runat="server"
                            Text="Register"
                            id="Register"
                            onclick="RegisterTeam"
                        />
                    </div>

                </div>
    </form>
     </div>
</body>
</html>

