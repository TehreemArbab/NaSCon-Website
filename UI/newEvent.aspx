<%@ Page Language="C#" AutoEventWireup="true" CodeFile="newEvent.aspx.cs" Inherits="newEvent" %>

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
                    <h3 style="margin-bottom: 16px">Create New Event</h3>
                    <div style="display: flex; gap: 40px;">
                        <div style="display: flex; flex-direction: column; gap: 16px">
                            <div class="textField">
                                <p class="label">Event Name</p>
                                <asp:TextBox 
                                    class="input"
                                    runat="server"
                                    name="eventName"
                                    id="eventName"
                                    placeholder="Enter event name"
                                />
                            </div>

                            <div class="textField">
                                <p class="label">Venue</p>
                                <asp:TextBox 
                                    class="input"
                                    runat="server"
                                    name="venue"
                                    id="Venue"
                                    placeholder="Enter venue"
                                />
                            </div>

                            <div class="textField">
                                <p class="label">Event Category ID</p>
                                <asp:TextBox 
                                    class="input"
                                    runat="server"
                                    name="category"
                                    id="catID"
                                    placeholder="Enter category ID"
                                />
                            </div>

                            <div class="textField">
                                <p class="label">Members Count</p>
                                <asp:TextBox 
                                    class="input"
                                    runat="server"
                                    name="memebersCount"
                                    id="membersCount"
                                    placeholder="Enter amount"
                                />
                            </div>

                            <div class="textField">
                                <p class="label">Date</p>
                                <asp:TextBox 
                                    class="input"
                                    runat="server"
                                    textmode="Date"
                                    name="Date"
                                    id="Date"
                                    placeholder="Enter date"
                                />
                            </div>
                        </div>
                        <div style="display: flex; flex-direction: column; gap: 16px">
                            <div class="textField">
                                <p class="label">Start Time</p>
                                <asp:TextBox 
                                    class="input"
                                    runat="server"
                                    textmode="Time"
                                    name="startTime"
                                    id="startTime"
                                    placeholder="Enter start time"
                                />
                            </div>

                            <div class="textField">
                                <p class="label">End Time</p>
                                <asp:TextBox 
                                    class="input"
                                    runat="server"
                                    textmode="Time"
                                    name="endTime"
                                    id="endTime"
                                    placeholder="Enter end time"
                                />
                            </div>

                            <div class="textField">
                                <p class="label">Description</p>
                                <asp:TextBox 
                                    class="input"
                                    runat="server"
                                    name="desc"
                                    id="desc"
                                    placeholder="Enter description"
                                />
                            </div>

                            <div class="textField">
                                <p class="label">Price</p>
                                <asp:TextBox 
                                    class="input"
                                    runat="server"
                                    name="price"
                                    id="Price"
                                    placeholder="Enter price"
                                />
                            </div>

                            <div class="textField">
                                <p class="label">Faculty Mentor ID</p>
                                <asp:TextBox 
                                    class="input"
                                    runat="server"
                                    name="mentorID"
                                    id="mentorID"
                                    placeholder="Enter faculty mentor ID"
                                />
                            </div>

                            <%--<div class="textField">
                                <p class="label">Student Head ID</p>
                                <asp:TextBox 
                                    class="input"
                                    runat="server"
                                    name="headID"
                                    id="headID"
                                    placeholder="Enter student head ID"
                                />
                            </div>--%>
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
                            onclick="createEvent"
                        />
                    </div>
                </div>
            </div>
        </form>
</body>
</html>

