<%@ Page Language="C#" AutoEventWireup="true" CodeFile="eventDetails.aspx.cs" Inherits="eventDetails" %>

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
       <h3 style="margin-bottom: 16px">Team Registeration Form</h3>

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
                        <p class="label">Team Name</p>
                        <asp:TextBox 
                            class="input"
                            runat="server"
                            type="text"
                            name="TName"
                            id="TName"
                            placeholder="Enter Team Name"
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

                   <div class="textField">
                        <p class="label">Leader's Name</p>
                        <asp:TextBox 
                            class="input"
                            runat="server"
                            type="text"
                            name="LName"
                            id="LName"
                            placeholder="Enter Leader's Name"
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
                        <p class="label">Member 1's Name</p>
                        <asp:TextBox 
                            class="input"
                            runat="server"
                            type="text"
                            name="M1Name"
                            id="Member1"
                            placeholder="Enter Member 1's Name"
                        />
                    </div>

                    <div class="textField">
                        <p class="label">CNIC</p>
                        <asp:TextBox 
                            class="input"
                            runat="server"
                            type="text"
                            name="CNIC"
                            id="CNIC1"
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
                            id="Email1"
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
                            id="Contact1"
                            placeholder="Enter Contact no."
                        />
                    </div>


                     <div class="textField">
                        <p class="label">Member 2's Name</p>
                        <asp:TextBox 
                            class="input"
                            runat="server"
                            type="text"
                            name="M2Name"
                            id="Member2"
                            placeholder="Enter Member 2's Name"
                        />
                    </div>

                    <div class="textField">
                        <p class="label">CNIC</p>
                        <asp:TextBox 
                            class="input"
                            runat="server"
                            type="text"
                            name="CNIC"
                            id="CNIC2"
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
                            id="Email2"
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
                            id="Contact2"
                            placeholder="Enter Contact no."
                        />
                    </div>


                      <div class="textField">
                        <p class="label">Member 3's Name</p>
                        <asp:TextBox 
                            class="input"
                            runat="server"
                            type="text"
                            name="M3Name"
                            id="Member3"
                            placeholder="Enter Member 3's Name"
                        />
                    </div>

                   <div class="textField">
                        <p class="label">CNIC</p>
                        <asp:TextBox 
                            class="input"
                            runat="server"
                            type="text"
                            name="CNIC"
                            id="CNIC3"
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
                            id="Email3"
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
                            id="Contact3"
                            placeholder="Enter Contact no."
                        />
                    </div>

                    
                      <div class="textField">
                        <p class="label">Member 4's Name</p>
                        <asp:TextBox 
                            class="input"
                            runat="server"
                            type="text"
                            name="M4Name"
                            id="member4"
                            placeholder="Enter Member 4's Name"
                        />
                    </div>

                    <div class="textField">
                        <p class="label">CNIC</p>
                        <asp:TextBox 
                            class="input"
                            runat="server"
                            type="text"
                            name="CNIC"
                            id="CNIC4"
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
                            id="Email4"
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
                            id="Contact4"
                            placeholder="Enter Contact no."
                        />
                    </div>

            <div class="textField">
                        <p class="label">Member 5's Name</p>
                        <asp:TextBox 
                            class="input"
                            runat="server"
                            type="text"
                            name="M3Name"
                            id="TextBox1"
                            placeholder="Enter Member 5's Name"
                        />
                    </div>

                   <div class="textField">
                        <p class="label">CNIC</p>
                        <asp:TextBox 
                            class="input"
                            runat="server"
                            type="text"
                            name="CNIC"
                            id="TextBox2"
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
                            id="TextBox3"
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
                            id="TextBox4"
                            placeholder="Enter Contact no."
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
