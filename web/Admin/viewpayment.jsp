<%-- 
    Document   : viewpayment
    Created on : Aug 9, 2024, 3:15:14 PM
    Author     : sobi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.sql.DataSource" %>

<!DOCTYPE html>
<html>
    <head>
        <title>CinemaGate-Admin</title>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
            crossorigin="anonymous"
            />
        <!-- Font Awesome Link -->
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
            .table thead {
                background-color: #007bff;
                color: black;
            }
            .table tbody tr:nth-child(odd) {
                background-color: #f9f9f9;
            }
            .table tbody tr:nth-child(even) {
                background-color: #f1f1f1;
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
            <a href="./update.jsp"><i class="fas fa-edit"></i> Update Movies</a>
            <a  href="./viewusers.jsp"><i class="fas fa-user"></i>View Users</a>
            <a href="viewbooking.jsp"><i class="fas fa-ticket"></i>Bookings</a>
            <a class="active" href="viewpayment.jsp"><i class="fas fa-money-check-alt"></i>Payments</a>
            <a href="./adminlogin.jsp"><i class="fas fa-sign-out-alt"></i> Log Out</a>
        </div>

        <div class="content">
            <div class="container mt-5">
                <h1 class="text-center h1hed" style="color:maroon;">Payment Details</h1>

                <%-- Establish the database connection --%>
                <%
                    Connection conn = null;
                    Statement stmt = null;
                    ResultSet rs = null;
                    try {
                        InitialContext ctx = new InitialContext();
                        Class.forName("com.mysql.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/movie", "root", "");
                        stmt = conn.createStatement();

                        String query = "SELECT * FROM payments";
                        rs = stmt.executeQuery(query);
                %>

                <!-- Search Results Table with Fixed Header and Scrolling Content -->
                <div style="max-height: 700px; overflow-y: scroll;">
                    <table class="table table-bordered mt-4">
                        <thead style="position: sticky; top: -1px; z-index: 1; background-color:white">
                            <tr>
                                <th>Id</th>
                                <th>FirstName</th>
                                <th>LastName</th>
                                <th>Email</th>
                                <th>Address</th>
                                <th>City</th>
                                <th>Gender</th>
                                <th>Payment Method</th>
                                <th>Amount</th>

                            </tr>
                        </thead>
                        <tbody>
                            <%-- Loop through the result set and display each row --%>
                            <%
                                int rowNumber = 1;
                                while (rs.next()) {
                            %>
                            <tr>
                                <td><%= rowNumber++%></td>

                                <td><%= rs.getString("first_name")%></td>
                                <td><%= rs.getString("last_name")%></td>
                                <td><%= rs.getString("email")%></td>
                                <td><%= rs.getString("address")%></td>
                                <td><%= rs.getString("city")%></td>
                                <td><%= rs.getString("gender")%></td>
                                <td><%= rs.getString("payment_method")%></td>
                                <td><%= rs.getString("amount")%></td>

                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>

                <%
                        rs.close();
                        stmt.close();
                        conn.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>

            </div>
        </div>
    </body>
</html>


