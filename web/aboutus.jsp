<%-- 
    Document   : aboutus
    Created on : Jul 30, 2024, 2:57:28 PM
    Author     : Asiri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Movie Ticketing Site - About Us</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <script src="scripts.js"></script>
        <style>
            body {
                background: url("images1/bg2.jpg");
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

            .jumbotron {
                background: linear-gradient(135deg, #800000 0%, #000000 100%);

                padding: 2rem 2rem;
                margin-top: 2rem;
                border-radius: 10px;
            }

            .jumbotron h1 {
                font-size: 3rem;
                font-weight: bold;
            }

            .jumbotron .lead {
                font-size: 1.3rem;
                line-height: 1.5;
            }

            .jumbotron .btn-primary {
                background: linear-gradient( #800000, #000000);
                border: #000;
                color: #fff;
                font-weight: bold;
            }

            .jumbotron .btn-primary:hover {
                background-color: #e6b800;
            }

            .jumbotron hr {
                border-top: 1px solid #fff;
            }

            footer {
                position: fixed;
                width: 100%;
                bottom: 0;
                background: linear-gradient( #800000, #000000);
                padding: 1rem 0;
            }

            footer p {
                font-weight: bold;
                margin-bottom: 1rem;

            }



            hr.bg-white {
                border-top: 1px solid #fff;
            }
        </style>
    </head>
    <body>
        <!-- Header -->
        <nav class="navbar navbar-expand-lg navbar-dark">
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
                        <a class="nav-link" href="signin.jsp">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="signup.jsp">Sign Up</a>
                    </li>
                </ul>
            </div>
        </nav>

        <!-- Main Content -->
        <div class="container mt-5">
            <div class="jumbotron text-center text-white">
                <h1 class="display-4">About Us</h1>
                <p class="lead">Welcome to CinemaGate, your number one source for all things movies. We're dedicated to giving you the very best of movie rentals, with a focus on customer service, convenience, and a wide selection of titles.</p>
                <p>Founded in 2020, CinemaGate has come a long way from its beginnings. When we first started out, our passion for providing the best movie rental experience drove us to do intense research, so that CinemaGate can offer you the world's most popular movies. We now serve customers all over the country, and are thrilled that we're able to turn our passion into our own website.</p>
                <p>We hope you enjoy our products as much as we enjoy offering them to you. If you have any questions or comments, please don't hesitate to contact us.</p>
                <hr class="my-4">
                <p>Browse through the latest movies and book your tickets now.</p>
                <a class="btn btn-primary btn-lg" href="signin.jsp" role="button">Learn more</a>
            </div>
        </div>

        <!-- Footer -->
        <footer class="bg-dark text-white py-1">
            <div class="container">
                <hr class="bg-white">
                <p class="text-center m-0">&copy; 2024 CinemaGate MovieTickets. All Rights Reserved.</p>
            </div>
        </footer>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
