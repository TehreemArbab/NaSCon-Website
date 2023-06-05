<%@ Page Language="C#" AutoEventWireup="true" CodeFile="newSponsor.aspx.cs" Inherits="newSponsor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Create Event</title>
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

    <form runat="server" id="NewEventForm" style="margin: 40px 10%">
            <div
                style="
                    display: flex;
                    flex-direction: row;
                    justify-content: space-between;
                "
            >
                <div style="display: flex; flex-direction: column; gap: 16px">
                    <h3 style="margin-bottom: 16px">Add New Sponor</h3>
                    <div style="display: flex; gap: 40px;">
                        <div style="display: flex; flex-direction: column; gap: 16px">
                            <div class="textField">
                                <p class="label">Sponsor Name</p>
                                <asp:TextBox 
                                    class="input"
                                    runat="server"
                                    name="sponsorName"
                                    id="sponsorName"
                                    placeholder="Enter sponsor name"
                                />
                            </div>

                            <div class="textField">
                                <p class="label">Sponsored Event ID</p>
                                <asp:TextBox 
                                    class="input"
                                    runat="server"
                                    name="event"
                                    id="eventID"
                                    placeholder="Enter event ID"
                                />
                            </div>

                            <div class="textField">
                                <p class="label">Sponsor Package</p>
                                <asp:DropDownList ID="Package" runat="server" class="input">
                                    <asp:ListItem Enabled="true" Text="Select Sponsor Package" Value="-1"></asp:ListItem>
                                    <asp:ListItem Text="Gold" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Silver" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="Bronze" Value="3"></asp:ListItem>

                                </asp:DropDownList>
                            </div>

                        </div>
                        <div style="display: flex; flex-direction: column; gap: 16px">
                            <div class="textField">
                                <p class="label">Representative ID</p>
                                <asp:TextBox 
                                    class="input"
                                    runat="server"
                                    name="repID"
                                    id="repID"
                                    placeholder="Enter representative ID"
                                />
                            </div>

                            <div class="textField">
                                <p class="label">Representative CNIC</p>
                                <asp:TextBox 
                                    class="input"
                                    runat="server"
                                    name="repCNIC"
                                    id="repCNIC"
                                    placeholder="Enter representative CNIC"
                                />
                            </div>
                                                      
                        </div>
                    </div>

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
                            onclick="createSponsor"
                        />
                    </div>
                </div>
            </div>
        </form>
</body>
</html>