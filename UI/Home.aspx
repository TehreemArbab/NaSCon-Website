<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Events</title>
    <link rel="stylesheet" href="styles.css"/>
</head>
    <body>
        <style>

            .button {
                  border-radius: 4px;
                  background-color: #FFFFFF;
                  border: 1px solid gray;
                  color: #6B6B6B;
                  text-align: center;
                  padding: 24px;
                  transition: all 0.5s;
                  cursor: pointer;
                  display: flex;
                                flex-direction: column;
                                align-items: center;
                                justify-content: center;
                  margin: 5px;
                }

                .button span {
                  cursor: pointer;
                  display: inline-block;
                  position: relative;
                  transition: 0.5s;
                }

                .button span:after {
                  content: '\00bb';
                  position: absolute;
                  opacity: 0;
                  top: 0;
                  right: -20px;
                  transition: 0.5s;
                  color : #303030;

                }

                .button:hover span {
                  padding-right: 25px;
                  color : #303030;
                }

                .button:hover span:after {
                  opacity: 1;
                  right: 0;
                }


        </style>

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




      <form id="Form1" runat="server" style="margin: 32px 10%">
            <h2>Faculty Portal</h2>

            <div
                style="
                    display: flex;
                    justify-content: space-between;
                    flex-wrap: wrap;
                "
            >

                <p></p>
                    <p style="font-size: 25px"> <a ID="hi" href="event.aspx"   class="button"> <span>  Manage Event</span></a></p>
            
               
                    <p style="font-size: 25px"> <a ID="hii" href="event.aspx"  class="button" ><span> See Event Participants</span> </a></p>
                
               
                    <p style="font-size: 25px"> <a ID="hiii" href= "Executives.aspx" class="button"> <span> Manage Executives </span></a></p>
               
            
            </div>
        </form>
    </body>
</html>
