<%-- 
    Document   : recovery
    Created on : May 8, 2020, 3:04:39 AM
    Author     : iammd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String msg = (String) session.getAttribute("msg");
    String error = "Oops! No user with that exists.";
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Recover Password</title>

        <!--Collapse to scroll lesser-->

        <style type="text/css">
            @import url(https://fonts.googleapis.com/css?family=Roboto:300);
            .login-page {
                width: 360px;
                padding: 8% 0 0;
                margin: auto;
            }
            .form {
                position: relative;
                z-index: 1;
                background: #FFFFFF;
                max-width: 360px;
                margin: 0 auto 100px;
                padding: 45px;
                text-align: center;
                box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
            }
            .form input {
                font-family: "Roboto", sans-serif;
                outline: 0;
                background: #f2f2f2;
                width: 100%;
                border: 0;
                margin: 0 0 15px;
                padding: 15px;
                box-sizing: border-box;
                font-size: 14px;
            }
            .form button {
                font-family: "Roboto", sans-serif;
                text-transform: uppercase;
                outline: 0;
                background: #3445b4;
                width: 100%;
                border: 0;
                padding: 15px;
                color: #FFFFFF;
                font-size: 14px;
                -webkit-transition: all 0.3 ease;
                transition: all 0.3 ease;
                cursor: pointer;
            }
            .form button:hover,.form button:active,.form button:focus {
                background: #3b368b;
            }
            .form .message {
                margin: 15px 0 0;
                color: #b3b3b3;
                font-size: 12px;
            }
            .form .message a {
                color: #3445b4;
                text-decoration: none;
            }
            .form .register-form {
                display: none;
            }
            .container {
                position: relative;
                z-index: 1;
                max-width: 300px;
                margin: 0 auto;
            }
            .container:before, .container:after {
                content: "";
                display: block;
                clear: both;
            }
            .container .info {
                margin: 50px auto;
                text-align: center;
            }
            .container .info h1 {
                margin: 0 0 15px;
                padding: 0;
                font-size: 36px;
                font-weight: 300;
                color: #1a1a1a;
            }
            .container .info span {
                color: #4d4d4d;
                font-size: 12px;
            }
            .container .info span a {
                color: #000000;
                text-decoration: none;
            }
            .container .info span .fa {
                color: #EF3B3A;
            }
            body {
                background: #3445b4; /* fallback for old browsers */
                background: -webkit-linear-gradient(right, #3445b4, #3b368b);
                background: -moz-linear-gradient(right, #3445b4, #3b368b);
                background: -o-linear-gradient(right, #3445b4, #3b368b);
                background: linear-gradient(to left, #3445b4, #3b368b);
                font-family: "Roboto", sans-serif;
                -webkit-font-smoothing: antialiased;
                -moz-osx-font-smoothing: grayscale;      
            }
        </style>
    </head>
    <body>
        <div class="login-page">
            <div class="form">
                <% if (msg != null) {%>
                <p style="color:green; font-size: 12px;"> 
                    <%= msg%>
                    <% session.removeAttribute("msg");%>
                </p><br>
                <% }%>
                <form method="POST" action="recover" class="login-form">
                    <% if (msg != error && msg != null) {%>
                    <input type="text" name="phone" placeholder="phone number" value="helloworld"/>
                    <p class="message"><a href="login.jsp">Go Back and Login.</a></p>
                    <% } else { %>
                    <input type="text" name="phone" placeholder="phone number"/>
                    <button>reset</button>
                    <p class="message"><a href="login.jsp" style="text-decoration: none;">Go Back?</a></p>
                    <% }%>
                </form>
            </div>
        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    </body>
</html>