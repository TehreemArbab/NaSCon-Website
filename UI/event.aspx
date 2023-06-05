<%@ Page Language="C#" AutoEventWireup="true" CodeFile="event.aspx.cs" Inherits="event" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Events</title>
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

         <form id="FacultyyForm" runat="server" style="margin: 40px 10%">

            <%--<div class="actionBtns">
                <input
                    type="button"
                    value="Create New Event"
                    style="width: max-content"
                    onclick="location.href = 'newEvent.html';"
                />
            </div>--%>
            <h3 style="margin: 32px 0px">Event Participants</h3>

            <div
                style="
                    display: flex;
                    flex-direction: row;
                    justify-content: space-between;
                "
            ><div>
                            <div>
                                <label for="Event"> Select Event to Show their Participants</label>

                                 <div class="textField">
                                    <asp:DropDownList
                                        class="input"
                                        runat="server"
                                        name="Username"
                                        id="DropDownList1"
                                        placeholder="Enter username"
                                    />
                                </div>
                 <div class="actionBtns">
                    <asp:Button 
                        class="input"
                        runat="server"
                        Text="update"
                        id="update"
                        Onclick="updatecoloumn"
                    />
                  
                </div>
                <table styles="margin-bottom: 24px">
                    

                                <br><br>
                              </div>
                        </td>
  
            <table styles="margin-bottom: 14px">
                            <tr>
                                <th> Venue</th>
                                <th>ParticipantID </th>
                                <th>Name </th>
                                <th>CNIC </th>
                                </tr>
                <asp:PlaceHolder ID = "FillTablee" runat="server" />                

             </table>
                       

            </div>

           

                </table>
            </div>
        </form>
    </body>
</html>
