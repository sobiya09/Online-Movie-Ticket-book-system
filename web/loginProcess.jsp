<%-- 
    Document   : login
    Created on : Jul 26, 2024, 8:54:53 AM
    Author     : Asiri
--%>

<%@page import="classes.DbConnector"%>
<%@page import="user.User"%>
<%@page import="user.MD5"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    
    String username = request.getParameter("email");
    String password = request.getParameter("password");

       User user = new User(username,password);
       
        if(user.authenticate(DbConnector.getConnection())){
            session.setAttribute("user_id",user.getId());
             session.setAttribute("firstname",user.getFirstname());
              session.setAttribute("lastname",user.getLastname());
            response.sendRedirect("Categories.jsp");
        }else{
            response.sendRedirect("signin.jsp?s=0");
        }
        


%>