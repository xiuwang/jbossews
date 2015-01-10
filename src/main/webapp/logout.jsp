<%-- 
    Document   : logout
    Created on : Jul 14, 2012, 10:21:42 PM
    Author     : SuperUser
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>logout Page</title>
    </head>
    <body>
        <% session.invalidate();
response.sendRedirect("index.jsp");            
        
%>
    </body>
</html>
