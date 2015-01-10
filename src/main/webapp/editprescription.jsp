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
                        
                        
                        
                        <form action="prescriptionsave.jsp" method="post">
                            <table>
                                <tr>
                                    <td>Patient Id</td>
                                    <td><input  type="text" name="pid" readonly  value="<%=request.getParameter("pid")%>" ></td>
                                </tr>
                                <tr>
                                    <td>Prescription                                    
                                    </td>
                                    <%if(request.getParameter("prescription")==null){%>
                                    
                                    <td><input type="hidden" name="status" value="insert"/><input type="text"  name="prescription"  placeholder="Give Presccription"></td>
                                    <%}else{%> 
                                    
                                    <td><input type="hidden" name="status" value="update"/><input type="text"  name="prescription" value="<%=request.getParameter("prescription")%>"></td>
                                    <%}%>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        
                                        <%--<input type="hidden" name="status" value="update"/>--%>
                                        <input type="submit" value="give Prescription"></td>
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
