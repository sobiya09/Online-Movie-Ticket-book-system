<%-- 
    Document   : Categories
    Created on : Jul 12, 2024, 8:41:15 PM
    Author     : sobi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="classes.DbConnector"%>
<%@page import="movies.MovieDetails"%>
<%@page import="user.User"%>
<!DOCTYPE html>

<%
    List<MovieDetails> mshow = MovieDetails.retrieveMovieData(DbConnector.getConnection(), "nowshowing");
    List<MovieDetails> mcoming = MovieDetails.retrieveMovieData(DbConnector.getConnection(), "comingsoon");
    User user = new User();
%>

<%
       
    
 if (session.getAttribute("user_id") != null) {
        int user_id = (Integer) session.getAttribute("user_id");
        
        user.setId(user_id);
        user = user.getUserById(DbConnector.getConnection());
       
        
    } else {
        response.sendRedirect("index.jsp");
    }

 %>   


<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <!--    <link href="styles.css" rel="stylesheet">-->
        <script src="scripts.js"></script>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <!-- jQuery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
        <!-- Title -->
        <title>CinemaGate - Categories</title>
        <style>
            body {
                background: #000;
                color: #fff;
                margin: 0;
                padding: 0;
            }

            .navbar {
                background: linear-gradient(90deg, #800000, #000000);
                padding: 1rem 2rem;

            }

            .navbar-brand {
                font-size: 2rem;
                font-weight: bold;
                color: #fff;
                text-transform: uppercase;
            }

            .navbar-nav .nav-link {
                color: #fff !important;
                font-size: 1.1rem;
                margin-left: 1rem;
                text-transform: uppercase;
                transition: color 0.3s ease;
            }

            .navbar-nav .nav-link:hover {
                color: #f9d423 !important;
            }


            .header-title {
                color: #fff;
                font-weight: bold;
                font-size: 4rem;
                text-shadow: 2px 2px 4px #000;
                margin: 25px 0;

                text-align: left;

                color: #fff;
            }
            .carousel {
                margin: 30px 0;
            }
            .carousel-item {
                text-align: center;
            }
            .thumb-wrapper {
                background: #111;
                border-radius: 10px;
                overflow: hidden;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5);
                transition: transform 0.3s, box-shadow 0.3s;
            }
            .thumb-wrapper:hover {
                transform: translateY(-10px);
                box-shadow: 0 8px 20px rgba(0, 0, 0, 0.5);
            }
            .img-box {
                height: 500px;
                width: 100%;
                overflow: hidden;
            }
            .img-box img {
                height: 100%;
                width: 100%;
                object-fit: cover;
            }
            .thumb-content {
                padding: 15px;
            }
            .thumb-content h4 {
                font-size: 1.5rem;
                color: #FFD700;
                margin-bottom: 10px;
                font-weight: bold;
            }
            .thumb-content .card-text {
                font-size: 1rem;
                margin-bottom: 10px;
                color: #d3d3d3;
            }
            .thumb-content .btn-primary, .thumb-content .btn-secondary {
                text-transform: uppercase;
                font-weight: bold;
                border-radius: 5px;
                transition: background 0.3s, color 0.3s;
            }
            .thumb-content .btn-primary {
                background: #ff9933;
                border: 1px solid #FFD700;
            }
            .thumb-content .btn-primary:hover, .thumb-content .btn-primary:focus {
                background: #000;
                color: #ff9933;
            }
            .thumb-content .btn-secondary {
                background: #333;
                border: 1px solid #888;
            }
            .thumb-content .btn-secondary:hover, .thumb-content .btn-secondary:focus {
                background: #888;
                color: #000;
            }
        </style>
    </head>
    <body>
        <!-- Header -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark" >

            <a class="navbar-brand" href="#">CinemaGate</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="index.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="aboutus.jsp">About Us</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Categories.jsp">Movies</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="signout.jsp" >Sign Out </a>
                    </li>
                    
                </ul>
            </div>
        </nav>
        <h3> &nbsp; Welcome,  <%= user.getFirstname() %> <%= user.getLastname()   %>  </h3>
        
        
        <!--        Movie -->
        <section style="margin-top: 60px;">
            <div class="container">
                <div class="header-title" style="border:0px;">Now Showing</div>
                <div id="carouselNowShowing" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <div class="row">
                                <%
                                    for (MovieDetails movie : mshow) {
                                %>
                                <div class="col-sm-3">
                                    <div class="thumb-wrapper">
                                        <div class="img-box">
                                            <img src="images/nowshowing/<%=movie.getISBN()%>.jpg" alt="<%=movie.getTitle()%>">
                                        </div>
                                        <div class="thumb-content">
                                            <h4><%=movie.getTitle()%></h4>
                                            <p class="card-text"><%=movie.getPublicationDate()%> | <%=movie.getISBN()%> | <%=movie.getHours()%></p>
                                            <a href="ticketBooking.jsp" class="btn btn-primary">Buy Ticket</a>
                                            <a href="./review.jsp?isbn=<%=movie.getISBN()%>" class="btn btn-secondary">Review</a>
                                        </div>
                                    </div>
                                </div>
                                <% } %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="header-title">Coming Soon</div>
                <div id="carouselComingSoon" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <div class="row">
                                <%
                                    for (MovieDetails movie : mcoming) {
                                %>
                                <div class="col-sm-3">
                                    <div class="thumb-wrapper">
                                        <div class="img-box">
                                            <img src="images/coming soon/<%=movie.getISBN()%>.jpg" alt="<%=movie.getTitle()%>">
                                        </div>
                                        <div class="thumb-content">
                                            <h4><%=movie.getTitle()%></h4>
                                            <p class="card-text"><%=movie.getPublicationDate()%> | <%=movie.getISBN()%> | <%=movie.getHours()%></p>
                                            <a href="./ticketBooking.jsp" class="btn btn-primary">Buy Ticket</a>
                                            <a href="./review.jsp?isbn=<%=movie.getISBN()%>" class="btn btn-secondary">Review</a>
                                        </div>
                                    </div>
                                </div>
                                <% }%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>