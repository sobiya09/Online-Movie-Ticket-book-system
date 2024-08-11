<%-- 
    Document   : registration
    Created on : Jul 26, 2024, 9:29:00 AM
    Author     : Asiri
--%>

<%@page import="classes.DbConnector"%>
<%@page import="user.User"%>
<%@page import="user.MD5" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
     

    String firstname = request.getParameter("firstName");
    String lastname = request.getParameter("lastName");
    String username = request.getParameter("email");
    String password = request.getParameter("password");
    
  
      
      User user = new User(firstname, lastname, username, password);
      
      String msg  = user.validatePassword(password);
      boolean reg = user.isEmailAlreadyRegistered(DbConnector.getConnection());
      
      if(msg==null && !reg ){
      
    if (user.register(DbConnector.getConnection())) {
        response.sendRedirect("signup.jsp?s=1");
    } else {
        response.sendRedirect("signup.jsp?s=0");
    }
      }else if(msg!=null ) {
          response.sendRedirect("signup.jsp?s="+msg);
      }else{
           response.sendRedirect("signup.jsp?s=2");
      }
      


       
    

%>


