<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html>
    <html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home</title>
    <link href="styles.css" rel="stylesheet" />
</head>
    <body>
        <style>
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
                    onclick="location.href = 'index.aspx';"
                    style="cursor: pointer; width: 56px"
                />
                <p style="margin-left: 8px"><b>Nascon</b></p>
            </div>

            <a class="navBtns" href="index.aspx">Home</a>
            <a class="navBtns" href="eventsList.aspx">Events</a>
            <!-- <a class="navBtns" href="reports.aspx">Reports</a> -->
            <a class="navBtns" href="login.aspx">Log In</a>
        </menu>

        <form runat="server" id="sampelform" style="display: flex; flex-direction: column; justify-content: center">
            <header class="headerF" style="height: 80vh">
                <img
                    src=<%= Application["logo"].ToString()%>
                    alt=""
                    width="280px"
                    style="margin: 40px"
                />
                <h1>NaSCon '22</h1>
                <h3 style="margin: 32px 0">
                    WHERE TALENT MEETS OPPORTUNITY <br />
                    20 MAY 2022 | 21 MAY 2022 | 22 MAY 2022
                </h3>

                <a class="mainBtn" href="eventsList.aspx">View All Events</a>
            </header>

            <section>
                <h2>Event Categories</h2>
                <div class="cardsContainer">
                    <div class="card">
                        <h1>Computer Science Events</h1>
                        <a href="<%="eventsList.aspx?eventCatID=2" %>" class="catBtns"> View Events </a>
                    </div>
                    <div class="card">
                        <h1>Electrical Engineering Events</h1>
                        <a href="<%="eventsList.aspx?eventCatID=1" %>" class="catBtns"> View Events </a>
                    </div>
                    <div class="card">
                        <h1>Business Events</h1>
                        <a href="<%="eventsList.aspx?eventCatID=3" %>" class="catBtns"> View Events </a>
                    </div>
                    <div class="card">
                        <h1>Social Events</h1>
                        <a href="<%="eventsList.aspx?eventCatID=4" %>" class="catBtns"> View Events </a>
                    </div>
                    <div class="card">
                        <h1>Sports Events</h1>
                        <a href="<%="eventsList.aspx?eventCatID=5" %>" class="catBtns"> View Events </a>
                    </div>
                </div>
            </section>

            <section>
                <h2>About Nascon</h2>
                <div
                    class="cardsContainer"
                    style="justify-content: left; gap: 24px; width: 640px"
                >
                    National Solutions Convention is the flagship event of
                    FAST-NU’s annual social calendar. It is a student-run mega
                    event that has provided the best technological and
                    industrial set of opportunities over the years. NaSCon
                    welcomes an average of 7000 participants annually,
                    representing institutions from all over Pakistan.
                    <h3>A LEGACY OVER 2 DECADES</h3>
                    For the past two decades, NaSCon has enriched the awareness
                    amongst students and professionals alike, providing a forum
                    for the exchange of ideas, an environment for the showcase
                    of exceptional professional skill and a platform for
                    innovation.
                    <h3>OUR MISSION</h3>
                    NaSCon is primarily dedicated to bringing together and
                    combining the mental prowess of students from all over the
                    country, and putting it to good use. Apart from students,
                    people from different organizations are also invited to
                    attend the event and contribute to providing solutions for a
                    sustainable future of Pakistan.
                </div>
            </section>
        </form>

        <footer>
            <h3>NaSCon '22</h3>
            <p style="font-size: 12px">All rights reserved</p>
        </footer>
    </body>
</html>

