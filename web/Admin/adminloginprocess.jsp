<%-- 
    Document   : adminloginprocess
    Created on : Jul 13, 2024, 7:26:26 PM
    Author     : sobi
--%>

<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>CinemaGate-AdminLogin</title>
    </head>
    <body>
        <%
            // Get username and password from the form
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            try {
                // Establish database connection
                Class.forName("com.mysql.jdbc.Driver");
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/movie", "root", "");

                // Query database
                PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM admin WHERE username=? AND password=?");
                preparedStatement.setString(1, username);    // Set the first parameter in the prepared statement to the username
                preparedStatement.setString(2, password);
                ResultSet resultSet = preparedStatement.executeQuery();

                if (resultSet.next()) {
                    // Valid credentials, redirect to a success page
                    response.sendRedirect("admin.jsp");
                } else {
        %>
        <script>
            alert('Invalid username or password.');
            window.location.href = 'adminlogin.jsp'; // Change this login form
        </script>
        <%
                }

                // Close resources
                resultSet.close();
                preparedStatement.close();
                connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </body>
</html>
