<%-- 
    Document   : prescription
    Created on : Jul 17, 2012, 3:12:20 PM
    Author     : Manish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                        <h1>Welcome <%=session.getAttribute("n1")%></h1>
                        
                        
        <form method="post" action="IssueApp">
            <table>
                <tr>
                    <td>Patient Registration No.<input readonly type="text" name="pid" value="<%=request.getParameter("pid")%>"></td>
                </tr>
                <tr>
                    <td>Enter New Date<input type="text" name="date" value="<%=request.getParameter("date")%>"></td>
                </tr>
                <tr>
                    <td>Enter New Time<input type="text" name="time" value="<%=request.getParameter("time")%>"></td>
                </tr>
                <tr>
                    <td>Enter New Job<input type="text" name="job" value="<%=request.getParameter("job")%>"></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Update Appointment"></td>
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
