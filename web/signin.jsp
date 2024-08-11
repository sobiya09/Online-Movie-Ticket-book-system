<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login - CinemaGate</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
            body {
                background: url('images1/signin.jpg') no-repeat center center fixed;
                background-size: cover;
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

            .content {
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 80vh;
            }

            .card {
                background-color: rgba(0, 0, 0, 0.85);
                border: none;
                border-radius: 20px;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);
                padding: 2rem;
                max-width: 450px;
                margin: auto;
                color: #fff;
            }

            .card-header {
                background-color: transparent;
                border-bottom: none;
                text-align: center;
                font-size: 1.8rem;
                margin-bottom: 1rem;
            }

            .btn-primary {
                background-color: #b20000;
                border-color: #b20000;
                transition: background-color 0.3s ease, transform 0.3s ease;
                font-size: 1.1rem;
                padding: 0.75rem;
                border-radius: 50px;
                box-shadow: 0 0 10px rgba(255, 255, 255, 0.3);
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
                background-color: #d3d3d3;
                border-color: #b20000;
                box-shadow: none;
            }

            .form-group label {
                font-weight: bold;
                margin-bottom: 0.5rem;
            }

            .text-danger {
                font-size: 0.9rem;
                margin-top: 1rem;
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
                        <a href="signup.jsp" class="nav-link">Sign Up</a>
                    </li>
                </ul>
            </div>
        </nav>

        <div class="container content">
            <div class="card">
                <div class="card-header">
                    <h3>User Login</h3>
                </div>
                <div class="card-body">
                    <% if (request.getParameter("s") != null && request.getParameter("s").equals("0")) { %>
                    <p class="text-danger">Incorrect username or password</p>
                    <% } %>
                    <form action="loginProcess.jsp" method="post">
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" class="form-control" id="email" name="email" required>
                        </div>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" class="form-control" id="password" name="password" required>
                        </div>
                        <button type="submit" class="btn btn-primary btn-block">Log In</button>
                    </form>
                </div>
            </div>
        </div>

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
