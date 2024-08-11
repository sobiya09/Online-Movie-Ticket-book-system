<%-- 
    Document   : updatemovie
    Created on : Jul 16, 2024, 4:56:28 PM
    Author     : sobi
--%>


<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
        <title>CinemaGate-Admin</title>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
            crossorigin="anonymous"
            />

        <!-- font awesome link -->
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
            integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />


        <style>
            body {
                font-family: 'Arial', sans-serif;
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
                color: #6a0000;
            }

            /* Optional: Add custom styles here */
            .form-container {
                max-width: 600px;
                margin: auto;
                padding: 20px;
                background-color: #f9f9f9;
                border: 1px solid #ddd;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .form-container h2 {
                margin-bottom: 20px;
                text-align: center;
                color: #333;
            }

            .form-control {
                margin-bottom: 10px;
            }

            .btn-group {
                margin-top: 20px;
                text-align: center;
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
            <a href="./addmovie.jsp"><i class="fas fa-plus"></i> Add Movie</a>
            <a href="./view.jsp"><i class="fas fa-eye"></i> View Movies</a>
            <a href="./search.jsp"><i class="fas fa-search"></i> Search Movies</a>
            <a class="active" href="./update.jsp"><i class="fas fa-edit"></i> Update Movies</a>
            <a  href="./viewusers.jsp"><i class="fas fa-user"></i>View Users</a>
            <a href="viewbooking.jsp"><i class="fas fa-ticket"></i>Bookings</a>
            <a  href="viewpayment.jsp"><i class="fas fa-money-check-alt"></i>Payments</a>
            <a href="./adminlogin.jsp"><i class="fas fa-sign-out-alt"></i> Log Out</a>
        </div>

        <div class="content">
            <div class="container mt-5">


                <h1 class="text-center h1hed">Movie Update</h1>

                <%
                    String searchMovieID = request.getParameter("search");
                    if (searchMovieID != null && !searchMovieID.isEmpty()) {
                        Connection connection = null;
                        PreparedStatement preparedStatement = null;
                        ResultSet resultSet = null;

                        try {
                            //establish database connection 
                            String jdbcUrl = "jdbc:mysql://localhost:3306/movie";
                            String dbUser = "root";
                            String dbPassword = "";

                            Class.forName("com.mysql.jdbc.Driver");
                            connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

                            String query = "SELECT * FROM movie WHERE Movie_ID = ?";
                            preparedStatement = connection.prepareStatement(query);
                            preparedStatement.setString(1, searchMovieID);
                            resultSet = preparedStatement.executeQuery();

                            if (resultSet.next()) {
                                String movieName = resultSet.getString("Movie_Name");
                                String categories = resultSet.getString("Categories");
                                String director = resultSet.getString("Director");
                                String publication = resultSet.getString("Release_date");
                                String review = resultSet.getString("Review");
                                String language = resultSet.getString("Language");
                                String hours = resultSet.getString("Hours");


                %>
                <form action="updatemovieprocess.jsp" method="post">
                    <table class="table table-bordered mt-4">
                        <tr>
                            <td>Enter Movie_ID :</td>
                            <td><input type="text" name="movie_id" class="form-control" value="<%= searchMovieID%>">
                            </td>
                        </tr>
                        <tr>
                            <td>Enter Movie_Name :</td>
                            <td><input type="text" name="name" class="form-control" value="<%= movieName%>"></td>
                        </tr>


                        <tr>
                            <td>Enter Releasing_Date:</td>
                            <td><input type="date" name="publication" class="form-control" value="<%= publication%>"></td>
                        </tr>
                        <tr>
                            <td>Enter Director:</td>
                            <td><input type="text" name="director" class="form-control" value="<%= director%>"></td>
                        </tr>
                        <tr>
                            <td>Enter Review:</td>
                            <td><input type="text" name="review" class="form-control" placeholder="Review" value="<%= review%>"></td>
                        </tr>
                        <tr>
                            <td>Select Categories:</td>
                            <td>
                                <select type="text" name="categories" class="form-control" value="<%= categories%>">
                                    <option value="nowshowing"selected>Now showing</option>
                                    <option value="comingsoon">Coming soon</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Enter Language:</td>
                            <td><input type="text" name="language" class="form-control" placeholder="Language" value="<%= language%>"></td>
                        </tr>
                        <tr>
                            <td>Hours of movie:</td>
                            <td><input type="text" name="hours" class="form-control" placeholder="Hours" value="<%= hours%>"></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <input type="submit" value="Update" name="action" class="btn btn-primary">
                                <input type="submit" value="Delete" name="action" class="btn btn-danger">
                                <a href="./update.jsp" class="btn btn-secondary">Cancel</a>
                            </td>
                        </tr>
                    </table>
                </form>

                <%
                } else {%>

                <script>
                    alert("No movie found");
                    window.location = 'update.jsp';
                </script>
                <%  }
                        } catch (Exception e) {
                            out.println("<p>An error occurred: " + e.getMessage() + "</p>");
                        } finally {
                            try {
                                if (resultSet != null) {
                                    resultSet.close();
                                }
                            } catch (SQLException e) {
                            }
                            try {
                                if (preparedStatement != null) {
                                    preparedStatement.close();
                                }
                            } catch (SQLException e) {
                            }
                            try {
                                if (connection != null) {
                                    connection.close();
                                }
                            } catch (SQLException e) {
                            }
                        }
                    }
                %>
            </div>
        </div>
    </body>
</html>

