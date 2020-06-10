
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.conquerors.usermanagementsystem.ConnectDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String isLoggedIn = (String) session.getAttribute("isLoggedIn");
    Integer id = (Integer) session.getAttribute("id");
    if (isLoggedIn != "true" || id == null) {
        response.sendRedirect("../login.jsp");
    }
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
        <style>
            ul.timeline {
                list-style-type: none;
                position: relative;
            }
            ul.timeline:before {
                content: ' ';
                background: #d4d9df;
                display: inline-block;
                position: absolute;
                left: 29px;
                width: 2px;
                height: 100%;
                z-index: 400;
            }
            ul.timeline > li {
                margin: 20px 0;
                padding-left: 20px;
            }
            ul.timeline > li:before {
                content: ' ';
                background: white;
                display: inline-block;
                position: absolute;
                border-radius: 50%;
                border: 3px solid #3445B4;
                left: 20px;
                width: 20px;
                height: 20px;
                z-index: 400;
            }
        </style>
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
                            <a href="me.jsp"><span class="fa fa-user mr-3"></span> Profile</a>
                        </li>
                        <li class="active">
                            <a href="#"><span class="fa fa-history mr-3"></span> History</a>
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
                <h2 class="mb-4">Your Past Activities</h2>
                <div class="container mt-5 mb-5">
                    <div class="row">
                        <div class="col-md-6 offset-md-3">
                            <ul class="timeline">
                                <%
                                    Connection conn = ConnectDB.getConnection();
                                    String sql = "SELECT * FROM history where uid=" + id;
                                    PreparedStatement ps = conn.prepareStatement(sql);
                                    ResultSet rs = ps.executeQuery();

                                    while (rs.next()) {
                                        String date = rs.getString("logged_on") + " | ";
                                        String time = rs.getString("logged_at");

                                        out.println("<li>"
                                                + "<a>New Login Event</a>"
                                                + "<a class='float-right'>" + date + time + "</a>"
                                                + "<p>A new login activity was seen by you in this due time. If it was not you then we would recommend you to change your password to make the account secure.</p>"
                                                + "</li>");
                                    }
                                %>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="js/jquery.min.js"></script>
        <script src="js/popper.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
