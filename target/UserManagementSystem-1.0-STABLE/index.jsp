<%-- 
    Document   : newjsp
    Created on : May 7, 2020, 2:01:23 PM
    Author     : iammd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String isLoggedIn = (String) session.getAttribute("isLoggedIn");
%>
<% if (isLoggedIn == "true")
        response.sendRedirect("profile/dashboard.jsp");%>

<!DOCTYPE html>
<html lang="en" >
    <head>
        <meta charset="UTF-8">
        <title>CodePen - Daily UI #003: Landing page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
        <link rel='stylesheet' href="profile/css/index.css">
        <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans:800,600,300'><link rel="stylesheet" href="./style.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js" type="text/javascript"></script>


    </head>
    <body>
        <div>
            <h1>< <span class="blink">_</span> /></h1>

        </div>
        <div style="text-align: center;">
            <a href="login.jsp">
                <button>
                    <div>Join Conquerors!</div>
                </button>
            </a>
        </div>
    </body>
</html>
