<%-- 
    Document   : search-result
    Created on : Jul 14, 2024, 4:01:46 PM
    Author     : sobi
--%>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
        <title>CinemaGate-Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
              rel="stylesheet"
              integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
              crossorigin="anonymous"
              />
        <!-- CSS stylesheet -->

        <!-- font awesome link -->
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
              integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
              crossorigin="anonymous"
              referrerpolicy="no-referrer"
              />
        <style>
            body {
                font-family: 'Arial', sans-serif;
                background-color: #f0f0f0;
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
                height: 100%;
                transition: margin-left 0.3s;
                background-color: #fff;
            }

            .h1hed {
                font-size: 3rem;
                font-weight: 700;
                color: #000066;
                margin-bottom: 30px;
            }

            table.table {
                background-color: #fff;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            table.table th {
                background-color: #f8f9fa;
                position: sticky;
                top: 0;
                z-index: 2;
            }

            table.table th,
            table.table td {
                padding: 12px;
                text-align: center;
            }

            table.table th:nth-child(2),
            table.table td:nth-child(2) {
                width: 130px;
            }

            table.table tbody tr:nth-child(even) {
                background-color: #f0f0f0;
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
                    padding: 10px;
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
            <a class="active"  href="./search.jsp"><i class="fas fa-search"></i> Search Movies</a>
            <a href="./update.jsp"><i class="fas fa-edit"></i> Update Movies</a>
            <a href="./viewusers.jsp"><i class="fas fa-user"></i>View Users</a>
            <a href="viewbooking.jsp"><i class="fas fa-ticket"></i>Bookings</a>
            <a  href="viewpayment.jsp"><i class="fas fa-money-check-alt"></i>Payments</a>
            <a href="./adminlogin.jsp"><i class="fas fa-sign-out-alt"></i> Log Out</a>
        </div>

        <div class="content">
            <div class="container mt-5">
                <h1 class="text-center h1hed" style="color: maroon">Search Movies Result</h1>


                <%
                    String searchMovieID = request.getParameter("search");
                    if (searchMovieID != null && !searchMovieID.isEmpty()) {
                        Connection connection = null;
                        PreparedStatement preparedStatement = null;
                        ResultSet resultSet = null;

                        try {
                            // establish the connection
                            String jdbcUrl = "jdbc:mysql://localhost:3306/movie";
                            String dbUser = "root";
                            String dbPassword = "";

                            Class.forName("com.mysql.jdbc.Driver");
                            connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

                            String query = "SELECT * FROM movie WHERE Movie_Name LIKE ? OR Director LIKE ? OR Categories LIKE ? OR Movie_ID LIKE ? OR Language LIKE ?";
                            preparedStatement = connection.prepareStatement(query);
                            preparedStatement.setString(1, "%" + searchMovieID + "%"); // Search by Movie_Name
                            preparedStatement.setString(2, "%" + searchMovieID + "%"); // Search by Director
                            preparedStatement.setString(3, "%" + searchMovieID + "%");  // Search by Categories
                            preparedStatement.setString(4, "%" + searchMovieID + "%");  // Search by MovieID
                            preparedStatement.setString(5, "%" + searchMovieID + "%"); //Search by LAnguage
                            resultSet = preparedStatement.executeQuery();
                            if (resultSet.next()) {

                %>
                <div style="max-height: 700px; overflow-y: scroll;">
                    <table class="table table-bordered mt-4">
                        <thead style="position: sticky; top: -1px; z-index: 1; background-color: white">
                            <tr>
                                <th>No</th>
                                <th style="width: 130px;">Movie_ID</th>
                                <th>Title</th>
                                <th>Category</th>
                                <th>Release_Date</th>
                                <th style="width: 100px;">Director</th>
                                <th>Review</th>
                                <th>Language</th>
                                <th>Hours</th>
                            </tr>
                        </thead>

                        <tbody>
                            <%  int rowNumber = 1;
                                do {
                                    String movieID = resultSet.getString("Movie_ID");
                                    String movieName = resultSet.getString("Movie_Name");
                                    String categories = resultSet.getString("Categories");
                                    String director = resultSet.getString("Director");
                                    String publication = resultSet.getString("Release_date");
                                    String review = resultSet.getString("Review");
                                    String language = resultSet.getString("Language");
                                    String hours = resultSet.getString("Hours");
                            %>
                            <tr>
                                <td><%= rowNumber++%></td>
                                <td><%= movieID%></td>
                                <td><%= movieName%></td>
                                <td><%= categories%></td>
                                <td><%= publication%></td>
                                <td><%= director%></td>
                                <td><%= review%></td>
                                <td><%=language%></td>
                                <td><%=hours%></td>
                            </tr>
                            <% } while (resultSet.next()); %>
                        </tbody>
                    </table>
                </div>

                <%
                } else {
                %>
                <script>
                    alert("No movie found");
                    window.location = 'search.jsp';
                </script>
                <%
                            }
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
