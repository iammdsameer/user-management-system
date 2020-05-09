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
    String blocked = (String) session.getAttribute("blocked");
    Integer isAdmin = (Integer) session.getAttribute("is_admin");
    String registered = (String) session.getAttribute("registered");
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

        <a href="dashboard.jsp" style="text-decoration: none;"><p style="color: white; margin-left: 15px;"><i class="fa fa-chevron-left" aria-hidden="true"></i> Back to Home</p></a>
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
                <section id="panel-1">
                    <main>
                        <% if (registered != null) {%>
                        <p style="color:green; font-size: 16px;"> 
                            User Account Creation Successful.
                            <% session.removeAttribute("registered");%>
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
                    </main>
                </section>
                <section id="panel-2">
                    <main>
                        <%
                            Connection conn = ConnectDB.getConnection();
                            String sql = "SELECT * FROM client";
                            PreparedStatement ps = conn.prepareStatement(sql);
                            ResultSet rs = ps.executeQuery();
                            String adminTag = " <i class='fa fa-shield'></i>";
                            String first_name;
                            String last_name;
                            while (rs.next()) {
                                first_name = rs.getString("first_name")+ " ";
                                last_name = rs.getString("last_name");
                                if (rs.getInt("is_blocked") == 1) {
                                    out.println("<div class='d-flex bd-highlight'>"
                                            + "<div class='p-2 flex-grow-1 bd-highlight' style='text-transform: capitalize;'>" + first_name + last_name + "</div>"
                                            + "<div class='p-2 bd-highlight'>"
                                            + "<a href='' style='text-decoration: none; color: blue;'><i class='fa fa-pencil-square-o'></i> Edit</a>"
                                            + "</div>"
                                            + "<div class='p-2 bd-highlight'>"
                                            + "<a href='../unblock-user?id=" + rs.getInt("id") + "' style='text-decoration: none; color: green;'><i class='fa fa-key'></i> Unblock</a>"
                                            + "</div></div><hr>");
                                } else {
                                    out.println("<div class='d-flex bd-highlight'>"
                                            + "<div class='p-2 flex-grow-1 bd-highlight' style='text-transform: capitalize;'>" + first_name + last_name + "</div>"
                                            + "<div class='p-2 bd-highlight'>"
                                            + "<a href='' style='text-decoration: none; color: blue;'><i class='fa fa-pencil-square-o'></i> Edit</a>"
                                            + "</div>"
                                            + "<div class='p-2 bd-highlight'>"
                                            + "<a href='../block-user?id=" + rs.getInt("id") + "' style='text-decoration: none; color: red;'><i class='fa fa-ban'></i> Block</a>"
                                            + "</div></div><hr>");
                                }
                            }
                            conn.close();
                        %>
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
                        <h1>Tab :hover</h1>
                        <p>When designing the <code>:hover</code> and "active" states I had a dilemma.</p>
                        <pre>&lt;li id="li-for-panel-1"&gt;
  &lt;label class="panel-label" for="panel-1-ctrl"&gt;CSS Radio Toggles&lt;/label&gt;
&lt;/li&gt;</pre>
                        <p>Each tab <code>li</code> has a <code>border-right</code>. But when the additional <code>border-top</code> appears, we dont want the lighter <code>border-right</code> to be shown all the way to the top. The fix for this is to cancel the <code>border-right</code> on both the <code>:hover</code> and "active" state as well as style the <code>li</code>'s next sibling's <code>border-left</code>.</p>
                        <p>To do this, we can use a combination of the siblings after <code>~</code> and sibling next <code>+</code> selectors:</p>
                        <pre><strong>/* remove the right border on "active" state */</strong>
#panel-1-ctrl:checked ~ #tabs-list #li-for-panel-1 {
  border-right: none;
}
<strong>/* add left to next sibling */</strong>
#panel-1-ctrl:checked ~ #tabs-list #li-for-panel-1 + li {
  border-left: 1px solid #dfdfdf;
}</pre>
                    </main>
                </section>
                <section id="panel-5">
                    <main>
                        <h1>Menu</h1>
                        <p>On small screens, the tabs fold down into an expandable menu. To trigger the menu, I use a <code>checkbox</code> (note that it appears at the top of the screen on smaller screen sizes). There are two labels that trigger this checkbox. One opens and the other closes the menu. The one that opens is absolutely positioned invisibly over the "active" menu item. The closing label is at the bottom of the open menu.</p>
                        <p>The best way I have found to show and hide content without using absolute positioning is to use a combination of <code>max-height</code> and <code>opacity</code>. When "inactive", the content has a <code>max-height: 0</code> and <code>opacity: 0</code>.</p>
                        <p>It also has a <code>transition: opacity</code> when I don't know the future height (this panel's content for example) and <code>transition: opacity, max-height</code> when I do know the future height (like the menu). When "active", the <code>max-height</code> and <code>opacity</code> get positive values and the content will transition in. I'm sure flexbox could get me around this hack, but this works for now.</p>   
                    </main>
                </section>
            </div>
        </article>

    </body>
</html>