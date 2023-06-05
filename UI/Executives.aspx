<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Executives.aspx.cs" Inherits="Executives" %>

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
 

     
            <h3 style="margin: 32px 0px">Executive Details</h3>
                 <div class="textField">
                    <p class="label">Select ExecID to Perform Operations</p>
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
                        Text="Delete"
                        id="Delete" OnClick="deleteRow"
                    />
                    <asp:Button 
                        class="input primaryAction"
                        runat="server"
                        Text="Edit"
                        id="Edit"
                        Onclick="editRow"
                    />   

                    <asp:Button 
                        class="input"
                        runat="server"
                        Text="Add"
                        id="AddRow"
                        onclick="addexec"
                    />
            
                </div>

                </div>

            <br /><br />
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
                            <th>Role</th>
                            <th>Exec ID </th>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Batch</th>
                 
        
                        </tr>
                      <asp:PlaceHolder ID = "FillTable" runat="server" />                

    
                </div>
           

                </table>
            </div>

                
        </form>
    </body>
</html>

