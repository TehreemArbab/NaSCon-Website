<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Participants.aspx.cs" Inherits="Participants" %>

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

        <  <form id="Form2" runat="server" style="margin: 40px 10%">
            <div>
 

     
            <h3 style="margin: 32px 0px">Participant Details</h3>

                <div
                    style="
                        display: flex;
                        flex-direction: row;
                        justify-content: space-between;
                    "
                >
                    <table styles="margin-bottom: 24px">
                        <div>
                        <tr>
                            <th>Participant ID </th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>CNIC</th>
                            <th>Contact</th>
                            <th>Food type</th>
                 
        
                        </tr>
                      <asp:PlaceHolder ID = "FillTable" runat="server" />                

    
                </div>
           

                </table>
            </div>
                </div>
        </form>
    </body>
</html>

