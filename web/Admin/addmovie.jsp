<%-- 
    Document   : addmovie
    Created on : Jul 13, 2024, 1:27:37 PM
    Author     : sobi
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>

<!DOCTYPE HTML>
<html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>CinemaGate-Admin</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous"

              <!-- font awesome link -->
              <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer"
              />
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
                color: maroon;
                text-align: center;
                margin-bottom: 20px;
            }

            .form-container {
                background: #fff;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .form-container h4 {
                font-size: 2rem;
                font-weight: 600;
                margin-bottom: 20px;
                color: #007bff;
                text-align: center;
            }

            .form-control {
                border-radius: 5px;
                box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1);
                margin-bottom: 15px;
            }

            .btn-primary, .btn-secondary {
                float: left;
                padding: 12px 12px;
                font-size: 11px;
                font-weight: bold;
                background-color: maroon;
                color: white;
                width: 30%;
                text-decoration: none;
                border-radius: 4px;
                margin-right: 5px;
                transition: background-color 0.3s;
            }
            .btn-primary:hover, .btn-secondary:hover{
                background-color: black;
                color: white;
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
            <a href="./admin.jsp"><i class="fas fa-tachometer-alt"></i> DashBoard</a>
            <a class="active" href="./addmovie.jsp"><i class="fas fa-plus"></i> Add Movie</a>
            <a href="./view.jsp"><i class="fas fa-eye"></i> View Movies</a>
            <a href="./search.jsp"><i class="fas fa-search"></i> Search Movies</a>
            <a href="./update.jsp"><i class="fas fa-edit"></i> Update Movies</a>
            <a href="./viewusers.jsp"><i class="fas fa-user"></i>View Users</a>
            <a href="viewbooking.jsp"><i class="fas fa-ticket"></i>Bookings</a>
            <a  href="viewpayment.jsp"><i class="fas fa-money-check-alt"></i>Payments</a>
            <a href="./AdminLogin.html"><i class="fas fa-sign-out-alt"></i> Log Out</a>
        </div>

        <div class="content">
            <div class="container mt-5">
                <div class="form-container">
                    <h1 class="text-center h1hed">Add Movie</h1>

                    <form action="./insertmovie.jsp" method="post">
                        <table class="table table-bordered mt-4">
                            <tr>
                                <td>Enter Movie_ID :</td>
                                <td><input type="text" name="id" class="form-control" placeholder="Movie_ID"></td>
                            </tr>
                            <tr>
                                <td>Enter Movie_Name :</td>
                                <td><input type="text" name="title" class="form-control" placeholder="Movie_Name"></td>
                            </tr>
                            <tr>
                                <td>Enter Releasing_Date:</td>
                                <td><input type="date" name="publication" class="form-control"></td>
                            </tr>
                            <tr>
                                <td>Enter Director:</td>
                                <td><input type="text" name="director" class="form-control" placeholder="Director"></td>
                            </tr>
                            <tr>
                                <td>Enter Review:</td>
                                <td><input type="text" name="review" class="form-control" placeholder="Review"></td>
                            </tr>
                            <tr>
                                <td>Select Categories:</td>
                                <td>
                                    <select name="categories" class="form-control">
                                        <option value="nowshowing">Now showing</option>
                                        <option value="comingsoon">Coming soon</option>

                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Language:</td>
                                <td><input type="text" name="language" class="form-control" placeholder="Language"></td>
                            </tr>
                            <tr>
                                <td>Hours:</td>
                                <td><input type="text" name="hours" class="form-control" placeholder="Hours"></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <input type="submit" value="ADD" class="btn btn-primary">
                                    <input type="reset" value="Reset" class="btn btn-secondary">
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>

    </body>

</html>
