<%-- 
    Document   : me
    Created on : May 6, 2020, 8:42:28 PM
    Author     : iammd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String isLoggedIn = (String) session.getAttribute("isLoggedIn");
    String first_name = (String) session.getAttribute("first_name");
    if (first_name != null) {
        first_name = first_name.substring(0, 1).toUpperCase() + first_name.substring(1);
    }
    String last_name = (String) session.getAttribute("last_name");
    if (last_name != null) {
        last_name = last_name.substring(0, 1).toUpperCase() + last_name.substring(1);
    }
    String email = (String) session.getAttribute("email");
    String username = (String) session.getAttribute("username");
    String pass = (String) session.getAttribute("pass");
    String birth_date = (String) session.getAttribute("birth_date");
    String phone = (String) session.getAttribute("phone");
    Integer id = (Integer) session.getAttribute("id");
    String changesMade = (String) session.getAttribute("changesMade");
%>
<% if (isLoggedIn != "true" || first_name == null) {
        response.sendRedirect("../login.jsp");
}%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Conquerors</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/me.css">

    </head>
    <body>

        <div class="wrapper d-flex align-items-stretch">
            <nav id="sidebar">
                <div class="custom-menu">
                    <button type="button" id="sidebarCollapse" class="btn btn-primary">
                        <i class="fa fa-bars"></i>
                        <span class="sr-only">Toggle Menu</span>
                    </button>
                </div>
                <div class="p-4">
                    <h1><a href="index.html" class="logo">Conquerors <span>User Management System</span></a></h1>
                    <ul class="list-unstyled components mb-5">
                        <li>
                            <a href="dashboard.jsp"><span class="fa fa-home mr-3"></span> Dashboard</a>
                        </li>
                        <li class="active">
                            <a href="#"><span class="fa fa-user mr-3"></span> Profile</a>
                        </li>
                        <li>
                            <a href="history.jsp"><span class="fa fa-history mr-3"></span> History</a>
                        </li>
                        <li>
                            <a href="portal.jsp"><span class="fa fa-cogs mr-3"></span> Admin Portal</a>
                        </li>
                        <li>
                            <a href="contacts.jsp"><span class="fa fa-paper-plane mr-3"></span> Contacts</a>
                        </li>
                        <li>
                            <a href="logout.jsp"><span class="fa fa-sign-out mr-3"></span> Log Out</a>
                        </li>
                    </ul>

                    <div class="mb-5">
                        <h3 class="h6 mb-3">For Newsletters: </h3>
                        <form action="#" class="subscribe-form">
                            <div class="form-group d-flex">
                                <div class="icon"><span class="icon-paper-plane"></span></div>
                                <input type="text" class="form-control" placeholder="Enter Email Address">
                            </div>
                        </form>
                    </div>
                </div>
            </nav>

            <!-- Page Content  -->
            <div id="content" class="p-4 p-md-5 pt-5">
                <h2 class="mb-4">Edit Profile</h2>
                <div class="container">
                    <% if (changesMade != null) { %>
                    <center style="color: green; font-size: 14px;"> <%= changesMade %></center>
                    <% session.removeAttribute("changesMade"); %>
                    <% } %>
                    <form class="me" method="POST" action="../edit-profile">
                        <label>
                            <p class="label-txt">YOUR FIRST NAME</p>
                            <input type="hidden" name="id" value="<%= id%>">
                            <input type="text" name="first_name" class="input" value="<%= first_name %>">
                            <div class="line-box">
                                <div class="line"></div>
                            </div>
                        </label>
                        <label>
                            <p class="label-txt">YOUR LAST NAME</p>
                            <input type="text" name="last_name" class="input" value="<%= last_name %>">
                            <div class="line-box">
                                <div class="line"></div>
                            </div>
                        </label>
                        <label>
                            <p class="label-txt">YOUR EMAIL</p>
                            <input type="email" name="email" class="input" value="<%= email%>">
                            <div class="line-box">
                                <div class="line"></div>
                            </div>
                        </label>
                        <label>
                            <p class="label-txt">YOUR USERNAME</p>
                            <input type="text" name="username" class="input" value="<%= username%>">
                            <div class="line-box">
                                <div class="line"></div>
                            </div>
                        </label>
                        <label>
                            <p class="label-txt">YOUR NUMBER</p>
                            <input required type="text" name="phone" class="input" value="<%= phone%>">
                            <div class="line-box">
                                <div class="line"></div>
                            </div>
                        </label>
                        <label>
                            <p class="label-txt">YOUR BIRTH DATE</p>
                            <input type='text' class="input" name='birth_date' value="<%= birth_date%>">
                            <div class="line-box">
                                <div class="line"></div>
                            </div>
                        </label>
                        <label>
                            <p class="label-txt">YOUR PASSWORD</p>
                            <input type="password" name="password" class="input" value="<%= pass%>">
                            <div class="line-box">
                                <div class="line"></div>
                            </div>
                        </label>
                        <button type="submit">Save Changes</button>
                    </form>
                </div>
            </div>
        </div>

        <script src="js/jquery.min.js"></script>
        <script src="js/popper.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
        <script src="js/me.js"></script>
    </body>
</html>
