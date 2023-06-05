<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link rel="stylesheet" href="styles.css"/>
</head>
<body>
    <main
        style="
            margin: 32px 10%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            margin-top: 80px;
        "
    >
        <img src=<%= Application["logo"].ToString()%>  style="width: 120px;"/>
        <h2 style="margin: 40px 0; margin-top: 24px;">Login</h2>
        <asp:PlaceHolder ID = "FillTable" runat="server" />  

        <form runat="server" id="LoginForm"
            style="
                display: flex;
                flex-direction: column;
                gap: 16px;
                width: min-content;
                justify-content: center;
            "
        >
            <div class="textField">
                <p class="label">Username</p>
                <asp:TextBox 
                    class="input"
                    runat="server"
                    name="Username"
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
                    name="Password"
                    id="Password"
                    placeholder="Enter password"
                />
            </div>


            <div class="actionBtns">
                        <asp:Button 
                            class="input"
                            runat="server"
                            Text="Back"
                            id="Back"
                            onclick="goBack"
                        />
                        <asp:Button 
                            class="input primaryAction"
                            runat="server"
                            Text="Login"
                            id="Login"
                            onclick="loginUser"
                        />
                    </div>
        </form>
    </main>
</body>
</html>
