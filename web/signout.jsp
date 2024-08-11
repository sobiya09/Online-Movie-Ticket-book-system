<%-- 
    Document   : signout.jsp
    Created on : Jul 25, 2024, 2:30:30 PM
    Author     : Asiri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
  session.invalidate();
  response.sendRedirect("index.jsp");
%>