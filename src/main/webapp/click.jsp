<%-- 
    Document   : click
    Created on : Jul 15, 2012, 11:15:55 AM
    Author     : SuperUser
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,javax.servlet.*" session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Redirect Page</title>
        <link rel="stylesheet" type="text/css" href="style.css" />
    </head>
    <body><%if(session.getAttribute("n1")==null)response.sendRedirect("index.jsp");%>
        <div id="outer">
     <%@include file="header.jsp" %> 
             <%@include file="menu.jsp" %> 
            
            
    <div id="content">
        <div id="primaryContentContainer">
            <div id="primaryContent">
                <div class="box">
                    <div class="boxContent">
                        <%--<h1>Welcome <%=session.getAttribute("n1")%></h1>--%>

        <form method="post" action="IssueApp">
            <table>
                <tr>
                    <td>Patient Registration No.<input type="text" name="pid" value="<%=request.getParameter("pid")%>"></td>
                </tr>
                <tr>
                    <td>Enter Date<input type="text" name="date"></td>
                </tr>
                <tr>
                    <td>Enter Time<input type="text" name="time"></td>
                </tr>
                <tr>
                    <td>Enter Job<input type="text" name="job"></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Issue Appointment"></td>
                </tr>
            </table>
        </form>
</div>
                </div>
            </div>
            <div id="secondaryContent"></div>
        </div>
            
        <div id="footer">
        
    </div>
        
    </div>

</div>
    </body>
</html>