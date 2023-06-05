<%@ Page Language="C#" AutoEventWireup="true" CodeFile="eventsList.aspx.cs" Inherits="eventsList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Events</title>
    <%--<link rel="stylesheet" href="styles.css"/>--%>
</head>
<body>
    <style>
            @import url("https://fonts.googleapis.com/css2?family=Poppins&display=swap");

            * {
                font-family: "Poppins", sans-serif;
                padding: 0;
                margin: 0;
            }

            a.navBtns {
                text-decoration: none;
                color: black;
                transition: 0.4s ease;
                cursor: pointer;
                padding: 8px 8px;
            }

            a.navBtns:hover {
                transform: scale(1.03);
                color: #8d4786;
            }

            .mainBtn {
                padding: 16px 40px;
                border-radius: 40px;
                background-color: grey;
                text-decoration: none;
                margin: 32px 0;
                cursor: pointer;
                color: white;
                transition: 0.4s ease;
            }

            header a.mainBtn:hover {
                background-color: #773974;
            }

            .card {
                display: flex;
                flex-direction: column;
                border-radius: 20px;
                background: linear-gradient(95.79deg, #773974 -21.55%, #B161AE 136.13%);
                width: 260px;
                align-items: center;
                justify-content: center;
                gap: 40px;
                padding: 24px;
                color: white;
            }
            .card a {
                color: #773974;
                cursor: pointer;
                padding: 8px 24px;
                background-color: white;
                border-radius: 20px;
                transition: 0.4s ease;
                text-decoration: none;
            }

            .card:hover a {
                background-color: #773974;
                color: white;
            }

            .cardsContainer {
                margin: 48px;
                display: flex;
                flex-direction: row;
                justify-content: center;
                align-items: top;
                flex-wrap: wrap;
                gap: 32px;
                width: 98vw;
            }

            header,
            section {
                display: flex;
                flex-direction: column;
                justify-content: center;
                margin: 48px 12%;
                align-items: center;
            }

            footer {
                padding: 32px 12%;
                display: flex;
                flex-direction: row;
                align-items: center;
                justify-content: space-between;
                border-top: 1px solid black;
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

        <main>
            <header style="height: 10vh">
                <h1>List of Events</h1>
            </header>

            <section>

                <div class="cardsContainer" style="">
                    <% foreach (EventData proj in events) { %>
                        <div class="card">
                            <h1><%=proj.name %></h1>
                            <a href="<%="EventDetails.aspx?eventID=" + proj.id %>" class="catBtns"> Register </a>
                        </div>
               <%} %>
                </div>
                
            </section>
        </main>

        <footer>
            <h3>NaSCon '22</h3>
            <p style="font-size: 12px">All rights reserved</p>
        </footer>
    </body>
</html>
