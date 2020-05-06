<%-- 
    Document   : logout.jsp
    Created on : May 6, 2020, 4:24:24 PM
    Author     : iammd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
session.invalidate();
response.sendRedirect("../index.jsp");
%>
