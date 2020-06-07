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
        <title>Hello Guest.</title>
        <link rel="stylesheet" href="profile/css/bootstrap.min.css">
        <link rel='stylesheet' href="profile/css/index.css">

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js" type="text/javascript"></script>
        <script src="profile/js/bootstrap.min.js" type="text/javascript"></script>

    </head>
    <body>

        <nav class="navbar navbar-expand-lg  navbar-dark bg-primary">
            <a class="navbar-brand" href="#">Conqueror's UMS</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
                <ul class="navbar-nav">
                    <li class="nav-item active" >
                        <a class="nav-link" href="#">Contact US <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="login.jsp">Login</a>
                    </li>

                </ul>
            </div>
        </nav>
        <div class="container">

            <!-- Jumbotron Header -->
            <header class="jumbotron my-4">
                <h1 class="display-3">A Warm Welcome From Conquerors!</h1>
                <p class="lead">This is a User Management System Built By Us.</p>
                <a href="login.jsp" class="btn btn-primary btn-lg">Get Started!</a>
            </header>

            <!--            <div class="row text-center">
            
                            <div class="col-lg-3 col-md-6 mb-4" >
                                <div class="card h-100">
                                    <img style="height: 40vh;width: 300px;" class="card-img-top" src="profile/images/dashboardss.JPG" alt="">
                                    <div class="card-body">
                                        <h4 class="card-title">Dynamic Dashboard</h4>
                                        <p class="card-text">This shows a detailed as well as summarized information about your profile</p>
                                    </div>
            
                                </div>
                            </div>
            
                            <div class="col-lg-3 col-md-6 mb-4" >
                                <div class="card h-100"  >
                                    <img style="height: 40vh;width: 300px;" class="card-img-top " src="profile/images/historyss.JPG" alt="">
                                    <div class="card-body">
                                        <h4 class="card-title">Track History</h4>
                                        <p class="card-text">You can track all the activities done by your profile.</p>
                                    </div>
            
                                </div>
                            </div>
            
                            <div class="col-lg-3 col-md-6 mb-4">
                                <div class="card h-100">
                                    <img style="height: 40vh;width: 300px;" class="card-img-top" src="profile/images/profiless.JPG" alt="" >
                                    <div class="card-body">
                                        <h4 class="card-title">Profile</h4>
                                        <p class="card-text">Edit and Update your profile at ease.</p>
                                    </div>
            
                                </div>
                            </div>
                        </div>
                    </div>-->
            <!--f-->
            <!--<div class="container">-->
                <div class="card-deck">
                    <div class="card">
                        <img class="card-img-top" src="profile/images/dashboardss.JPG" alt="Card image cap">
                        <div class="card-body">
                            <h4 class="card-title">Dynamic Dashboard</h4>
                                        <p class="card-text">This shows a detailed as well as summarized information about your profile</p>
                        </div>
                    </div>
                    <div class="card">
                        <img class="card-img-top" src="profile/images/historyss.JPG" alt="Card image cap">
                        <div class="card-body">
                                        <h4 class="card-title">Track History</h4>
                                        <p class="card-text">You can track all the activities done by your profile.</p>
                                    </div>
                    </div>
                    <div class="card">
                        <img class="card-img-top" src="profile/images/profiless.JPG" alt="Card image cap">
                        <div class="card-body">
                                        <h4 class="card-title">Profile</h4>
                                        <p class="card-text">Edit and Update your profile at ease.</p>
                                    </div>
                    </div>
                </div>
            </div>
            <!--f-->


            <footer class="py-5 bg-dark" style="margin-top: 50px;">
                <p class="m-0 text-center text-white">Copyright &copy; Conqueror's UMS 2020</p>

                <!-- /.container -->
            </footer>

    </body>
</html>
