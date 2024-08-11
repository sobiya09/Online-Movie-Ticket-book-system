<%-- 
    Document   : signup
    Created on : Jul 26, 2024, 11:13:31 AM
    Author     : Asiri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Register - CinemaGate</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
            body {
                background-color: #000;
                background: url('images1/signin.jpg') no-repeat center center fixed;
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

            .card {
                background-color: #1c1c1c;
                border: none;
                border-radius: 10px;
                box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
            }

            .card-header {
                background-color: #900000;
                border-bottom: none;
                color: #fff;
                text-align: center;
                border-top-left-radius: 10px;
                border-top-right-radius: 10px;
                font-size: 1.5rem;
                font-weight: bold;
                padding: 1rem;
            }

            .btn-primary {
                background-color: #900000;
                border-color: #b20000;
                transition: background-color 0.3s ease, transform 0.3s ease;
            }

            .btn-primary:hover {
                background-color: #900000;
                border-color: #900000;
                transform: translateY(-2px);
            }

            .form-control {
                background-color: #222;
                color: #fff;
                border: 1px solid #444;
                padding: 0.75rem;
                font-size: 1rem;
                border-radius: 10px;
            }

            .form-control:focus {
                background-color:#d3d3d3;
                border-color: #fff;
                box-shadow: none;
            }

            .form-group label {
                font-weight: bold;
                margin-bottom: 0.5rem;
                color: #fff;
            }

            .content {
                flex: 1;
                padding: 20px;
            }

            .form-image {
                background: url('images1/pic3.jpg') no-repeat center center;
                background-size: cover;
                border-top-left-radius: 10px;
                border-bottom-left-radius: 10px;
                min-height: 400px;
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

        <div class="container mt-5 content">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="card">
                        <div class="row no-gutters form-container">
                            <div class="col-md-6 form-image"></div>
                            <div class="col-md-6">
                                <div class="card-header">
                                    Register
                                </div>
                                <div class="card-body">
                                    <% if (request.getParameter("s") != null) {
                                            String message;
                                            if (request.getParameter("s").equals("1")) {
                                                message = "<h6 class='text-success'>You have successfully registered with CinemaGate.</h6>";
                                            } else if(request.getParameter("s").equals("0")) {
                                                message = "<h6 class='text-danger'>An Error occurred. Please try again.</h6>";
                                        }else if(request.getParameter("s").equals("2")){
                                               message = "<h6 class='text-danger'>Email Already Registered.</h6>";
                                        }
               
                                            else {
                                                message = "<h6 class='text-danger'>"+request.getParameter("s")+"</h6>";
                                            }
                                        
                                        out.println(message);
                                    }%>
                                    <form action="registration.jsp" method="post">
                                        <div class="form-group">
                                            <label for="firstName">First Name</label>
                                            <input type="text" class="form-control" id="firstName" name="firstName" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="lastName">Last Name</label>
                                            <input type="text" class="form-control" id="lastName" name="lastName" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="email">Email</label>
                                            <input type="email" class="form-control" id="email" name="email" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="password">Password</label>
                                            <input type="password" class="form-control" id="password" name="password" required>
                                        </div>
                                        <button type="submit" class="btn btn-primary btn-block">Sign Up</button>
                                        <br>
                                        <div class="text-center">
                                            <p>Already have an account? <a href="signin.jsp" class="footer-link" style="text-decoration: none">Login</a></p>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
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

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
