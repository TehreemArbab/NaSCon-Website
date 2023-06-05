<%@ Page Language="C#" AutoEventWireup="true" CodeFile="showReportStudent.aspx.cs" Inherits="showReportStudent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reports</title>
    <link rel="stylesheet" href="styles.css"/>
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
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
                src="https://storage.googleapis.com/nascon_dev_bucket/img/NaSCon22-sm.png?X-Goog-Algorithm=GOOG4-RSA-SHA256&X-Goog-Credential=8573493607-compute%40developer.gserviceaccount.com%2F20220529%2Fauto%2Fstorage%2Fgoog4_request&X-Goog-Date=20220529T132223Z&X-Goog-Expires=86400&X-Goog-SignedHeaders=host&X-Goog-Signature=2881f77675d0a6889927b4954b484ab04f170bbbe66a01aaf46bd87ed9968c30dff4cc62c3ffdc398096f7f4502df285974a0de007840cef626f0eea378b9549adce811aab2d43a89bbd0d2228c7df5670051fe5c7e71af878f91f9ec7f61449ebbc84c9bb78f2d3d1d736242617f01e980acb68bc20255f0b5f0f9dabefdb1a0844b7d144039743f67e07a05b972045a508b4e395ac53d5c507605870c502f88bed29a634fd5b24e0ccd54971d013d74a7cbd4cf7aa9ef61bd13b1d566e73cafff182da937a5c51354a0d4e23fe26c8de0f8cbeecee72d9e7df5145b67fda07b65659e152484f39fb5d8567f8dfe12886b4a32bfa0998af811c83d475121db6"
                alt=""
                width="56px"
                style="cursor: pointer"
            />
            <p style="margin-top: 8px;">Student Executive Portal</p>
        </div>
        <a class="navBtns" href="StudentReports.aspx">Log Out</a>
        <a class="navBtns" href="login.aspx">Log Out</a>
    </menu>

    <form id="adminForm" runat="server" style="margin: 40px 10%">
        <h3 style="margin: 32px 0px; text-align: center;"><% = reportName %></h3>

        <% if (specificQuery)
            { %>
        <div>
            <div class="textField">
                <p class="label">Select Option</p>
                <asp:DropDownList
                    class="input"
                    runat="server"
                    name="Username"
                    id="DropDownList1"
                />
            </div>

                <% if (reportNo == "7")
                    {%>
                   <div class="textField">
                        <p class="label">Search Name</p>
                        <asp:TextBox
                            class="input"
                            runat="server"
                            name="Name"
                            id="Name"
                        />
                    </div>
                <%}
                    else
                    {
                        this.Visible = false;
                    }%>
            <div class="actionBtns">
                <asp:Button 
                    class="input"
                    runat="server"
                    Text="Load"
                    id="loadReport"
                    Onclick="LoadReport"
                />
            </div>
        </div>
        <%}
            else
            {
                this.Visible = false;
            } %>
        
        <asp:PlaceHolder ID = "PlaceHolder1" runat="server" />
    </form>
</body>
</html>

