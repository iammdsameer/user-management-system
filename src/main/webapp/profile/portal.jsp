<%-- 
    Document   : portal2
    Created on : May 8, 2020, 6:01:48 PM
    Author     : iammd
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.conquerors.usermanagementsystem.ConnectDB"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.conquerors.usermanagementsystem.controller.SessionCounterListener"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String isLoggedIn = (String) session.getAttribute("isLoggedIn");
    String useredit = (String) session.getAttribute("done");
    String blocked = (String) session.getAttribute("blocked");
    Integer isAdmin = (Integer) session.getAttribute("is_admin");
    String registered = (String) session.getAttribute("registered");
    int totalUser = 0;
    if (isLoggedIn != "true" || isAdmin == null) {
        response.sendRedirect("../login.jsp");
    } else if (isAdmin != 1) {
        response.sendRedirect("notadmin.jsp");
    }
%>
<!DOCTYPE html>
<html lang="en" >
    <head>
        <meta charset="UTF-8">
        <title>Admin Portal</title>
        <link rel="stylesheet" href='css/bootstrap.min.css'>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/portal.css">

        <style>
            .th {
                position: sticky; top: 0; background: #fff;
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
            * {
                -webkit-box-sizing: initial;
                -moz-box-sizing: initial;
                box-sizing:content-box;
            }
        </style>
    </head>
    <body>
        <!-- TAB CONTROLLERS -->
        <input id="panel-1-ctrl"
               class="panel-radios" type="radio" name="tab-radios" checked>
        <input id="panel-2-ctrl"
               class="panel-radios" type="radio" name="tab-radios">
        <input id="panel-3-ctrl"
               class="panel-radios" type="radio" name="tab-radios">
        <input id="panel-4-ctrl"
               class="panel-radios" type="radio" name="tab-radios">
        <input id="panel-5-ctrl"
               class="panel-radios" type="radio" name="tab-radios">
        <input id="nav-ctrl"
               class="panel-radios" type="checkbox" name="nav-checkbox">

        <a href="dashboard.jsp" style="text-decoration: none;"><p style="color: white; margin-left: 15px; margin-top: 20px;"><i class="fa fa-chevron-left" aria-hidden="true"></i> Back to Home</p></a>
        <header id="introduction">
            <h1>Admin Portal | Conquerors</h1>
        </header>

        <!-- TABS LIST -->
        <ul id="tabs-list">
            <!-- MENU TOGGLE -->
            <label id="open-nav-label" for="nav-ctrl"></label>
            <li id="li-for-panel-1">
                <label class="panel-label"
                       for="panel-1-ctrl">Dashboard</label>
            </li><!--INLINE-BLOCK FIX
            --><li id="li-for-panel-2">
                <label class="panel-label"
                       for="panel-2-ctrl">User Overview</label>
            </li><!--INLINE-BLOCK FIX
            --><li id="li-for-panel-3">
                <label class="panel-label"
                       for="panel-3-ctrl">New Registration</label>
            </li><!--INLINE-BLOCK FIX
            --><li id="li-for-panel-4">
                <label class="panel-label"
                       for="panel-4-ctrl">Activity Logs</label>
            </li><!--INLINE-BLOCK FIX
            --><li id="li-for-panel-5" class="last">
                <label class="panel-label"
                       for="panel-5-ctrl">Reports</label>
            </li>
            <label id="close-nav-label" for="nav-ctrl">Close</label>
        </ul>

        <!-- THE PANELS -->
        <article id="panels">
            <div class="container">
                <section id="panel-2">
                    <main>
                        <%
                            Connection conn = ConnectDB.getConnection();
                            String sql = "SELECT * FROM client";
                            PreparedStatement ps = conn.prepareStatement(sql);
                            ResultSet rs = ps.executeQuery();
                            String first_name;
                            String last_name;
                            while (rs.next()) {
                                totalUser++;
                                first_name = rs.getString("first_name") + " ";
                                last_name = rs.getString("last_name");
                                if (rs.getInt("is_blocked") == 1) {
                                    out.println("<div class='d-flex bd-highlight'>"
                                            + "<div class='p-2 flex-grow-1 bd-highlight' style='text-transform: capitalize;'>" + first_name + last_name + "</div>"
                                            + "<div class='p-2 bd-highlight'>"
                                            + "<a href='../user-details?id=" + rs.getInt("id") + "' style='text-decoration: none; color: blue;'><i class='fa fa-pencil-square-o'></i> Edit</a>"
                                            + "</div>"
                                            + "<div class='p-2 bd-highlight'>"
                                            + "<a href='../unblock-user?id=" + rs.getInt("id") + "' style='text-decoration: none; color: green;'><i class='fa fa-key'></i> Unblock</a>"
                                            + "</div>"
                                            + "<div class='p-2 bd-highlight'>"
                                            + "<a href='../delete-user?id=" + rs.getInt("id") + "' style='text-decoration: none; color: red;'><i class='fa fa-trash'></i> Delete</a>"
                                            + "</div></div><hr>");
                                } else {
                                    out.println("<div class='d-flex bd-highlight'>"
                                            + "<div class='p-2 flex-grow-1 bd-highlight' style='text-transform: capitalize;'>" + first_name + last_name + "</div>"
                                            + "<div class='p-2 bd-highlight'>"
                                            + "<a href='../user-details?id=" + rs.getInt("id") + "' style='text-decoration: none; color: blue;'><i class='fa fa-pencil-square-o'></i> Edit</a>"
                                            + "</div>"
                                            + "<div class='p-2 bd-highlight'>"
                                            + "<a href='../block-user?id=" + rs.getInt("id") + "' style='text-decoration: none; color: red;'><i class='fa fa-ban'></i> Block</a>"
                                            + "</div>"
                                            + "<div class='p-2 bd-highlight'>"
                                            + "<a href='../delete-user?id=" + rs.getInt("id") + "' style='text-decoration: none; color: red;'><i class='fa fa-trash'></i> Delete</a>"
                                            + "</div></div><hr>");
                                }
                            }
                            conn.close();
                        %>
                    </main>
                </section>
                <section id="panel-1">
                    <main>
                        <% if (registered != null) {%>
                        <p style="color:green; font-size: 16px;"> 
                            User Account Creation Successful.
                            <% session.removeAttribute("registered");%>
                        </p>
                        <% }%>
                        <% if (useredit != null) {%>
                        <p style="color:green; font-size: 16px;"> 
                            <%=useredit%>
                            <% session.removeAttribute("done");%>
                        </p>
                        <% }%>
                        <% if (blocked != null) {%>
                        <p style="color:green; font-size: 16px;"> 
                            <%=blocked%>
                            <% session.removeAttribute("blocked");%>
                        </p>
                        <% }%>
                        <h1>Recently Updated
                        </h1>
                        <div class="card card-4">
                            <br>
                            <h3>No. of Active Users</h3>
                            <p style='font-size: 6em; color: #3445B4; margin: 20px;'><%= SessionCounterListener.getTotalActiveSession()%></p>
                        </div>
                        <div class="card card-4">
                            <br>
                            <h3>Registered Users</h3>
                            <p style='font-size: 6em; color: #3445B4; margin: 20px;'><%= totalUser%></p>
                        </div>
                    </main>
                </section>
                <section id="panel-3">
                    <main style='margin: 0 auto;'>
                        <h1>Add New User</h1>
                        <form method="POST" action="../create-user" style='margin: 0 auto;' class="form register-form">
                            <input required type="text" name="first_name" placeholder="first name"/>
                            <input required type="text" name="last_name" placeholder="last name"/>
                            <input required type="text" name="phone_number" placeholder="phone"/>
                            <input required type="text" name="email" placeholder="email address"/>
                            <input required type="text" name="username" placeholder="username"/>
                            <input required type="password" name="password" placeholder="password"/>
                            <input required type="text" name="birth_date" placeholder="YYYY-MM-DD"/>
                            <select name="is_admin" required id="cars" style='width: 100%; padding: 10px; margin-bottom: 10px; background: #F2F2F2'>
                                <option value="" selected disabled hidden>-- choose user type --</option>
                                <option value="1">admin</option>
                                <option value="0">client</option>
                            </select>
                            <button>create</button>
                        </form>
                    </main>
                </section>
                <section id="panel-4">
                    <main>
                        <h1>User Activity</h1>
                        <div style="max-height:900px; overflow: auto;">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th class='th' scope="col">#</th>
                                        <th class='th' scope="col">Users</th>
                                        <th class='th' scope="col">Logged On</th>
                                        <th class='th' scope="col">Logged At</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        conn = ConnectDB.getConnection();
                                        sql = "SELECT client.first_name, client.last_name, history.logged_on,"
                                                + "history.logged_at FROM client inner join history "
                                                + "on client.id=history.uid;";
                                        ps = conn.prepareStatement(sql);
                                        rs = ps.executeQuery();
                                        int counter = 0;
                                        while (rs.next()) {
                                            counter++;%>
                                    <tr>
                                        <th scope="row"><%=counter%></th>
                                        <td style='text-transform: capitalize;'><%= rs.getString("first_name") + " " + rs.getString("last_name")%></td>
                                        <td><%= rs.getString("logged_on")%></td>
                                        <td><%= rs.getString("logged_at")%></td>
                                    </tr>
                                    <% }%>
                                </tbody>
                            </table>
                        </div>
                    </main>
                </section>
                <section id="panel-5">
                    <main>
                        <h1>Menu</h1>
                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
                    </main>
                </section>
            </div>
        </article>

    </body>
</html>