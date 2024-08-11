<%-- 
    Document   : index
    Created on : Jul 20, 2024, 5:08:05 PM
    Author     : Asiri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Movie Ticketing Site</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="scripts.js"></script>
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

        .hero {
            position: relative;
            background: url('path-to-your-hero-image.jpg') no-repeat center center/cover;
            height: 60vh;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #fff;
            text-align: center;
        }

        .jumbotron {
            padding: 2rem 2rem;
            margin-top: 2rem;
            border-radius: 10px;
            background: linear-gradient( #800000, #000000);
        }

        .jumbotron .btn-primary {
            background: linear-gradient( #800000, #000000);
            border: none;
        }

        .jumbotron .btn-primary:hover {
            background-color: #660000;
        }

        .card {
            background-color: #333;
            border: none;
            transition: transform 0.3s;
        }

        .card:hover {
            transform: scale(1.05);
        }

        .card-text {
            color: #fff;
        }

        .card-img-top {
            height: 450px;
            width: 100%;
            object-fit: cover;
        }

        .btn-outline-secondary {
            color: #fff;
            border-color: #fff;
        }

        .btn-outline-secondary:hover {
            background-color: #fff;
            color: #000;
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



    </style>
</head>
<body>
    <!-- Header -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
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
                    <a href="signup.jsp" class="nav-link">Sign Up</a>
                </li>
            </ul>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container mt-5">
        <div class="jumbotron text-center text-white bg-maroon">
            <h1 class="display-4">Welcome to CinemaGate</h1>
            <p class="lead">Book your favorite movies online with ease.</p>
            <hr class="my-4">
            <p>Browse through the latest movies and book your tickets now.</p>
            <a class="btn btn-primary btn-lg" href="signin.jsp" role="button">Learn more</a>
        </div>
    </div>

    <!-- Movie Images -->
    <div class="container">
        <div class="row">
            <div class="col-sm-6 col-md-4 col-lg-3 mb-4">
                <div class="card shadow-sm">
                    <img src="images1/insideout.png" class="card-img-top" alt="Inside Out 2">
                    
                </div>
            </div>
            <div class="col-sm-6 col-md-4 col-lg-3 mb-4">
                <div class="card shadow-sm">
                    <img src="images1/godzila.png" class="card-img-top" alt="Godzila X Kong">
                   
                </div>
            </div>
            <div class="col-sm-6 col-md-4 col-lg-3 mb-4">
                <div class="card shadow-sm">
                    <img src="images1/dsc.png" class="card-img-top" alt="Despicable Me 3">
                  
                </div>
            </div>
            <div class="col-sm-6 col-md-4 col-lg-3 mb-4">
                <div class="card shadow-sm">
                    <img src="images1/dune2.png" class="card-img-top" alt="Dune Part 2">
                   
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="bg-dark text-white py-1">
    <div class="container">
        <hr class="bg-white">
        <p class="text-center m-0">&copy; 2024 CinemaGate MovieTickets. All Rights Reserved.</p>
    </div>
</footer>

    
</body>
</html>
