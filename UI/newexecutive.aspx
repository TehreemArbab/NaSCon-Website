<%@ Page Language="C#" AutoEventWireup="true" CodeFile="newexecutive.aspx.cs" Inherits="newexecutive" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Create Executive Account</title>
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
                onclick="location.href = 'index.aspx';"
                style="cursor: pointer"
            />
            <p style="margin-top: 8px;">Faculty Portal</p>
        </div>

         <a class="navBtns" href="Home.aspx">Home</a>
            <a class="navBtns" href="event.aspx">Events</a>
            <a class="navBtns" href="Executives.aspx">Executives</a>
            <a class="navBtns" href="Participants.aspx">Participants</a>
            <a class="navBtns" href="facultyReports.aspx">Reports</a>
            <a class="navBtns" href="login.aspx">Log Out</a>
    </menu>

    <form runat="server" id="NewExecForm" style="margin: 40px 10%">
            <div
                style="
                    display: flex;
                    flex-direction: row;
                    justify-content: space-between;
                "
            >
                <div style="display: flex; flex-direction: column; gap: 16px">
                    <h3 style="margin-bottom: 16px">Create New Executive</h3>

                    <div class="textField">
                        <p class="label">Roll No</p>
                        <asp:TextBox 
                            class="input"
                            runat="server"
                            name="RollNo"
                            id="RollNo"
                            placeholder="Enter roll no"
                        />
                    </div>

                    <div class="textField">
                        <p class="label">Username</p>
                        <asp:TextBox 
                            class="input"
                            runat="server"
                            name="username"
                            id="Username"
                            placeholder="Enter username"
                        />
                    </div>

                    <div class="textField">
                        <p class="label">Password</p>
                        <asp:TextBox 
                            class="input"
                            runat="server"
                            type="password"
                            name="username"
                            id="Password"
                            placeholder="Enter password"
                        />
                    </div>

                    <div class="textField">
                        <p class="label">First Name</p>
                        <asp:TextBox 
                            class="input"
                            runat="server"
                            name="Fname"
                            id="Fname"
                            placeholder="Enter first name"
                        />
                    </div>

                    <div class="textField">
                        <p class="label">Last Name</p>
                        <asp:TextBox 
                            class="input"
                            runat="server"
                            name="Lname"
                            id="Lname"
                            placeholder="Enter last name"
                        />
                    </div>

                    <div class="textField">
                        <p class="label">Event ID</p>
                        <asp:TextBox 
                            class="input"
                            runat="server"
                            name="eventID"
                            id="eventID"
                            placeholder="Enter event ID"
                        />
                    </div>

                    <div class="textField">
                        <p class="label">Batch</p>
                        <asp:DropDownList ID="BatchSelect" runat="server" class="input">
                            <asp:ListItem Enabled="true" Text="Select Batch" Value="-1"></asp:ListItem>
                            <asp:ListItem Text="17" Value="17"></asp:ListItem>
                            <asp:ListItem Text="18" Value="18"></asp:ListItem>
                            <asp:ListItem Text="19" Value="19"></asp:ListItem>
                            <asp:ListItem Text="20" Value="20"></asp:ListItem>
                            <asp:ListItem Text="21" Value="21"></asp:ListItem>

                        </asp:DropDownList>
                    </div>

                    <div class="textField">
                        <p class="label">Role</p>
                        <asp:DropDownList ID="RoleSelect" runat="server" class="input">
                            <asp:ListItem Enabled="true" Text="Select Role" Value="-1"></asp:ListItem>
                            <asp:ListItem Text="President" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Vice President" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Head" Value="3"></asp:ListItem>
                            <asp:ListItem Text="Member" Value="4"></asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="actionBtns">
                        <asp:Button 
                            class="input"
                            runat="server"
                            Text="Cancel"
                            id="Button1"
                            onclick="goBack"
                        />
                        <asp:Button 
                            class="input primaryAction"
                            runat="server"
                            Text="Create"
                            id="Button2"
                            onclick="createAdmin"
                        />
                    </div>
                </div>
            </div>
        </form>
</body>
</html>

