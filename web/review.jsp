<%-- 
    Document   : review
    Created on : Jul 12, 2024, 8:41:15 PM
    Author     : sobi
--%>
<%@page import="java.util.Base64"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.sql.*" %>
<%@page import="classes.DbConnector"%>
<%@page import="movies.MovieDetails"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- bootstrap link -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <!-- font awesome link -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer"/>
        <link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css' rel='stylesheet'>
        <title>CinemaGate-Review</title>
        <style>
            body {
                background: url("images1/bg1.jpg");
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
            .navbar-nav {
                margin-left: auto; /* Aligns nav items to the right */
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

            /* Add your CSS here */
            .counts {
                margin-top: 100px;
                margin-bottom: 50px;
            }

            .counts .content {
                padding: 30px 20px;
                width: 100%;
                background: #1c1c1c;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            }

            .counts .content h3 {
                text-align: center;
                font-weight: 700;
                font-size: 34px;
                color: #ffb114;
                text-transform: uppercase;
            }

            .counts .content h5 {
                font-size: 26px;
                color: #ffb114;
            }

            .counts .content p {
                color: #d3d3d3;
                text-align: justify;
                margin-bottom: 10px;
            }

            .counts .review .revbtn {
                padding: 15px 0px;
                margin-top: 10px;
                text-align: center;
            }

            .counts .review .btn {
                color: white;
                font-size: 14px;
                text-align: justify;
                text-transform: uppercase;
                font-weight: bold;
                background: #ffb114;
                border: none;
                padding: 10px 20px;
                margin-top: 10px;
                line-height: 20px;
                border-radius: 30px;
                transition: background-color 0.3s, transform 0.3s;
            }

            .counts .review .btn:hover,
            .counts .review .btn:focus {
                background: #e09e10;
                transform: scale(1.05);
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            }

            .counts .review .btn i {
                font-size: 14px;
                font-weight: bold;
                margin-left: 5px;
            }

            .section-title {
                padding-bottom: 40px;
            }

            .section-title h2 {
                font-size: 20px;
                font-weight: 500;
                letter-spacing: 2px;
                text-transform: uppercase;
                color: #ffb114;
                font-family: "Poppins", sans-serif;
            }

            .section-title h2::after {
                content: "";
                width: 120px;
                height: 1px;
                display: inline-block;
                background: #ffb114;
                margin: 4px 10px;
            }

            .section-title p {
                margin: 0;
                font-size: 36px;
                font-weight: 700;
                text-transform: uppercase;
                font-family: "Poppins", sans-serif;
                color: white;
            }

            .star-rating {
                display: flex;
                flex-direction: row;
                padding: 10px 0;
            }

            .star-rating ul {
                padding-left: 15px;
            }

            .star-rating li {
                padding: 0;
            }

            .star-rating i {
                font-size: 14px;
                color: #ffc000;
            }

            .image img {
                max-width: 100%;
                height: auto;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            }
            footer {
                background: linear-gradient( #800000, #000000);

            }

            footer p {
                font-weight: bold;
                margin-bottom: 1rem;
            }





            hr.bg-white {
                border-top: 1px solid #fff;
            }


            @media (max-width: 991px) {
                .counts .image {
                    text-align: center;
                }

                .counts .image img {
                    max-width: 80%;
                }
            }

            @media (max-width: 667px) {
                .counts .image img {
                    max-width: 100%;
                }
            }
        </style>
    </head>

    <body >

        <!-- bootstrap link -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>

        <%
            // Assuming you have established a database connection
            Connection con = DbConnector.getConnection();

            // Check if ISBN parameter is provided in the URL
            String isbn = request.getParameter("isbn");

            // Get book details by ISBN
            MovieDetails bookDetails = MovieDetails.getMovieDetailsByISBN(con, isbn);
        %>
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
                        <a class="nav-link" href="ticketBooking.jsp" >Booking</a>
                    </li>

                </ul>
            </div>
        </nav>
        <section id="counts" class="counts">
            <div class="container" data-aos="fade-up">
                <div class="section-title">
                    <h2 style="color: white">
                        <%=bookDetails.getCategories()%>
                    </h2>
                    <p style="color: white">
                        <%=bookDetails.getTitle()%>
                    </p>
                </div>
                <div class="row no-gutters">
                    <div class="image col-xl-5 d-flex align-items-stretch justify-content-center justify-content-lg-start" data-aos="fade-right" data-aos-delay="100">
                        <img src="images/review/<%=bookDetails.getISBN()%>.jpg" alt="" style="max-width: 100%; height: auto; border-radius: 5px; margin-bottom: 10px;">
                    </div>
                    <div class="col-xl-7 ps-4 ps-lg-5 pe-4 pe-lg-1 d-flex align-items-stretch" data-aos="fade-left" data-aos-delay="100">
                        <div class="content d-flex flex-column justify-content-center review">
                            <h3 style="text-transform: uppercase;"><%=bookDetails.getTitle()%></h3>
                            <p style="color: white">
                                <%=bookDetails.getReview()%>
                            </p>
                            <p class="card-text">Movie_ID: <%=bookDetails.getISBN()%> || Release Date: <%=bookDetails.getPublicationDate()%> || Director: <%=bookDetails.getAuthor()%></p>
                            <div class="revbtn">
                                <a href="ticketBooking.jsp" class="btn btn-primary">Buy tickets</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </section>

        <!-- Footer -->
        <footer class="bg-dark text-white py-1">
            <div class="container">
                <hr class="bg-white">
                <p class="text-center m-0">&copy; 2024 CinemaGate MovieTickets. All Rights Reserved.</p>
            </div>
        </footer>

    </body>
</html>
