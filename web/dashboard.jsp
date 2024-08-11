<%-- 
    Document   : dashboard
    Created on : Jul 25, 2024, 2:20:38 PM
    Author     : Asiri
--%>

<%@page import="app.classes.User"%>
<%@page import="app.classes.DbConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%! User user = new User(); %>

<%
    if (session.getAttribute("user_id") != null) {

        int user_id = (Integer) session.getAttribute("user_id");
        user.setId(user_id);
        user = user.getUserById(DbConnector.getConnection());
    } else {
        response.sendRedirect("index.jsp");
    }

%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        
                  <%= user.getId() %>
                  
                  
                  <a href="sinout.jsp">    <h4>Sin Out </h4> </a>
    </body>
</html>
