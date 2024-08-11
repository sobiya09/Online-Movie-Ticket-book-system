<%-- 
    Document   : insertmovie
    Created on : Jul 14, 2024, 1:53:39 PM
    Author     : sobi
--%>


<%@page import="classes.DbConnector"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
    // get datas from insert form
    String id = request.getParameter("id");
    String title = request.getParameter("title");
    String publication = request.getParameter("publication");
    String director = request.getParameter("director");
    String review = request.getParameter("review");
    String category = request.getParameter("categories");
    String language = request.getParameter("language");
    String hours = request.getParameter("hours");

    String query = "INSERT INTO movie (Movie_ID, Movie_Name, Release_Date, Director, Review, Categories, Language, Hours) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
    Connection con = DbConnector.getConnection();
    PreparedStatement pstmt = con.prepareStatement(query);
    pstmt.setString(1, id);
    pstmt.setString(2, title);
    pstmt.setString(3, publication);
    pstmt.setString(4, director);
    pstmt.setString(5, review);
    pstmt.setString(6, category);
    pstmt.setString(7, language);
    pstmt.setString(8, hours);
    int a = pstmt.executeUpdate();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CinemaGate-Admin</title>
    </head>
    <body>
        <% if (a > 0) { %>
        <script>
            alert("Successfully Saved");
            window.location = 'admin.jsp';
        </script>
        <% } else { %>
        <script>
            alert("Error Occurred");
        </script>
        <% }%>
    </body>
</html>
