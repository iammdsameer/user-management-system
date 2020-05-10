<%-- 
    Document   : edituser
    Created on : May 9, 2020, 6:37:22 PM
    Author     : iammd
--%>

<%@page import="com.conquerors.usermanagementsystem.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User user = (User) session.getAttribute("user");
%>
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
                        <li>
                            <a href="#"><span class="fa fa-user mr-3"></span> Profile</a>
                        </li>
                        <li>
                            <a href="history.jsp"><span class="fa fa-history mr-3"></span> History</a>
                        </li>
                        <li class="active">
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
                <h2 class="mb-4" style="text-transform: capitalize;"><%= user.getFirst_name()%>'s Profile</h2>
                <div class="container">
                    <form class="me" method="POST" action="../edit-user">
                        <label>
                            <p class="label-txt">FIRST NAME</p>
                            <input type="hidden" name="id" value="<%= user.getId()%>">
                            <input type="text" name="first_name" class="input" value="<%= user.getFirst_name() %>">
                            <div class="line-box">
                                <div class="line"></div>
                            </div>
                        </label>
                        <label>
                            <p class="label-txt">LAST NAME</p>
                            <input type="text" name="last_name" class="input" value="<%= user.getLast_name() %>">
                            <div class="line-box">
                                <div class="line"></div>
                            </div>
                        </label>
                        <label>
                            <p class="label-txt">EMAIL</p>
                            <input type="text" name="email" class="input" value="<%= user.getEmail()%>">
                            <div class="line-box">
                                <div class="line"></div>
                            </div>
                        </label>
                        <label>
                            <p class="label-txt">USERNAME</p>
                            <input type="text" name="username" class="input" value="<%= user.getUsername()%>">
                            <div class="line-box">
                                <div class="line"></div>
                            </div>
                        </label>
                        <label>
                            <p class="label-txt">NUMBER</p>
                            <input type="text" name="phone" class="input" value="<%= user.getPhone()%>">
                            <div class="line-box">
                                <div class="line"></div>
                            </div>
                        </label>
                        <label>
                            <p class="label-txt">BIRTH DATE</p>
                            <input type='text' class="input" name='birth_date' value="<%= user.getBirth_date()%>">
                            <div class="line-box">
                                <div class="line"></div>
                            </div>
                        </label>
                        <label>
                            <p class="label-txt">PASSWORD</p>
                            <input type="password" name="password" class="input" value="<%= user.getPassword()%>">
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
