<%-- 
    Document   : update
    Created on : Jul 15, 2024, 4:45:06 PM
    Author     : sobi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- bootstrap link -->
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
            crossorigin="anonymous"
            />
        <!-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
        <!-- CSS stylesheet -->
        <link rel="stylesheet" href="./Styles/admin.css " />
        <!-- ------------------------------------------------------------------->
        <!-- font awesome link -->
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
            integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />
        <!--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
        <title>CinemaGate-Admin</title>
        <style>
            body {
                font-family: 'Arial', sans-serif;
                background-color: #f4f4f4;
            }

            .sidebar {
                margin: 0;
                padding: 0;
                width: 250px;
                background-color: #343a40;
                position: fixed;
                height: 100%;
                overflow: auto;
                transition: width 0.3s;
            }
            .sidebar a {
                display: block;
                color: white;
                padding: 18px;
                text-decoration: none;
                transition: background-color 0.3s, color 0.3s;
                font-size: 1.1rem;
            }
            .sidebar img {
                margin-top: 20px;
                margin-left: 75px;
                width: 100px;
                height: 100px;
                border-radius: 50%;
                border: 3px solid #fff;
                margin-bottom: 20px;
            }
            .sidebar a.active {
                background-color: maroon;
                color: white;
            }
            .sidebar a:hover:not(.active) {
                background-color: #575d63;
                color: white;
            }
            .sidebar a i {
                margin-right: 10px;
            }



            div.content {
                margin-left: 250px;
                padding: 20px;
                height: 1000px;
                transition: margin-left 0.3s;
            }

            .h1hed {
                font-size: 4rem;
                font-weight: 700;
                color: #000066;
            }
            .input-group {
                max-width: 600px; /* Adjust width as needed */
                margin: 0 auto; /* Center align the form */
            }



            .form-control {
                border-color: #8b0000; /* Customize input field border color */
            }

            .form-control:focus {
                border-color: #6a0000; /* Darker shade when input field is focused */
                box-shadow: 0 0 0 0.2rem rgba(139, 0, 0, 0.25); /* Optional: Add focus effect */
            }

            .btn-primary {
                background-color: #8b0000; /* Customize primary button color */
                color: white;
                border-color: #8b0000; /* Customize primary button border color */
                border-radius: 10px;
            }

            .btn-primary:hover {
                background-color: #6a0000; /* Darker shade on hover */
                color: white;
                border-color: #6a0000;
            }


            @media screen and (max-width: 700px) {
                .sidebar {
                    width: 100%;
                    height: auto;
                    position: relative;
                }
                .sidebar a {
                    float: left;
                    width: 100%;
                }
                div.content {
                    margin-left: 0;
                }
            }

            @media screen and (max-width: 400px) {
                .sidebar a {
                    text-align: center;
                    float: none;
                }
            }
        </style>
    </head>
    <body>
        <div class="sidebar">
            <img src="./images/Admin.jpg" alt="">
            <a  href="./admin.jsp"><i class="fas fa-tachometer-alt"></i> DashBoard</a>
            <a href="./addmovie.jsp"><i class="fas fa-plus"></i> Add Movie</a>
            <a href="./view.jsp"><i class="fas fa-eye"></i> View Movies</a>
            <a href="./search.jsp"><i class="fas fa-search"></i> Search Movies</a>
            <a class="active" href="./update.jsp"><i class="fas fa-edit"></i> Update Movies</a>
            <a href="./viewusers.jsp"><i class="fas fa-user"></i>View Users</a>
            <a href="viewbooking.jsp"><i class="fas fa-ticket"></i>Bookings</a>
            <a  href="viewpayment.jsp"><i class="fas fa-money-check-alt"></i>Payments</a>
            <a href="./adminlogin.jsp"><i class="fas fa-sign-out-alt"></i> Log Out</a>
        </div>

        <div class="content">
            <div class="container mt-5">
                <h1 class="text-center h1hed" style="color:maroon">Update Movie</h1>

                <form action="updatemovie.jsp" method="post" class="mt-4">
                    <div class="input-group">
                        <input type="text" name="search" class="form-control" placeholder="Search for the Movie by Movie_ID whose is going to update">
                        <button type="submit" class="btn-primary">Search</button>
                    </div>

                </form>
            </div>
        </div>
    </body>
</html>


