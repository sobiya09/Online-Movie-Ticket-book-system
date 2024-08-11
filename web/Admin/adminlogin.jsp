<%-- 
    Document   : adminlogin
    Created on : Jul 15, 2024, 6:45:46 PM
    Author     : sobi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- bootstrap link -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <!-- ----------------------------------------------------------------- -->
        <!-- Title -->
        <title>CinemaGate-Admin</title>
        <!-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->

        <style>
            body {
                background: black;
                font-family: 'Arial', sans-serif;
            }
            .container {
                margin-top: 200px;
                background: maroon;
                width: 50%;
                height: auto;
                text-align: center;
                justify-content: center;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            .form-label {
                font-weight: bold;
                color: white;
            }
            .form-control {
                border-radius: 30px;
                padding: 10px;
                box-shadow: none;
                border: 1px solid #ccc;
                transition: border-color 0.3s;
            }
            .form-control:focus {
                border-color: #6B73FF;
                box-shadow: 0 0 8px rgba(107, 115, 255, 0.3);
            }
            .btn-primary {
                background: black;
                color: white;
                border: none;
                border-radius: 30px;
                padding: 10px;
                transition: background 0.3s;
            }
            .btn-primary:hover {
                background: white;
                color: black;
            }
        </style>
    </head>

    <body>

        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6">

                    <h2 class="text-center" style="color:white">CinemaGate-Admin</h2><br/>

                    <form action="adminloginprocess.jsp" method="post" >
                        <div class="mb-3">
                            <label for="username" class="form-label" >Username:</label>
                            <input type="text" class="form-control" id="username" name="username" autocomplete="off" required>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Password:</label>
                            <input type="password" class="form-control" id="password" name="password" autocomplete="off" required>
                        </div>

                        <button type="submit" class="btn-primary" style="width: 100%; margin-top: 10px">Login</button>
                    </form>

                </div>
            </div>
        </div>

    </body>

</html>
