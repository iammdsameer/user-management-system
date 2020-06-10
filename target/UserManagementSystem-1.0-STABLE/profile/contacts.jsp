
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String isLoggedIn = (String) session.getAttribute("isLoggedIn");
%>
<% if (isLoggedIn != "true")
        response.sendRedirect("../index.jsp");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/style.css">
    </head>
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
                    <li>
                        <a href="history.jsp"><span class="fa fa-history mr-3"></span> History</a>
                    </li>
                    <li>
                        <a href="portal.jsp"><span class="fa fa-cogs mr-3"></span> Admin Portal</a>
                    </li>
                    <li class="active">
                        <a href="#"><span class="fa fa-paper-plane mr-3"></span> Contacts</a>
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
            <h2 class="mb-4">This is Us.</h2>
            <div class="card-deck">
                <div class="card">
                    <img src="https://nerdreactor.com/wp-content/uploads/2016/03/powerpuff-girls-clip-500x500_c.jpg" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Phurba Yanji Sherpa</h5>
                        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                    </div>
                </div>
                <div class="card">
                    <img src="https://cactusthemes.com/blog/wp-content/uploads/2018/01/tt_avatar_small.jpg" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Nimesh Bhattarai</h5>
                        <p class="card-text">This card has supporting text below as a natural lead-in to additional content.</p>
                    </div>
                </div>
                <div class="card">
                    <img src="https://cactusthemes.com/blog/wp-content/uploads/2018/01/tt_avatar_small.jpg" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Pratik Sarkar</h5>
                        <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This card has even longer content than the first to show that equal height action.</p>
                    </div>
                </div>
            </div>
            <br><br><br>
            <div class="card-deck">
                <div class="card">
                    <img src="https://cactusthemes.com/blog/wp-content/uploads/2018/01/tt_avatar_small.jpg" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Niranjan Bajracharya</h5>
                        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                    </div>
                </div>
                <div class="card">
                    <img src="https://cactusthemes.com/blog/wp-content/uploads/2018/01/tt_avatar_small.jpg" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Muhammad Sameer</h5>
                        <p class="card-text">This card has supporting text below as a natural lead-in to additional content.</p>
                    </div>
                </div>
                <div class="card">
                    <img src="https://cactusthemes.com/blog/wp-content/uploads/2018/01/tt_avatar_small.jpg" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Lokesh Gupta</h5>
                        <p class="card-text">This card has supporting text below as a natural lead-in to additional content.</p>
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
