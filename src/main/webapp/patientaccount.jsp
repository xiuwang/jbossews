<%-- 
    Document   : account
    Created on : Jul 14, 2012, 10:21:54 PM
    Author     : SuperUser
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true" import="java.sql.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Account Page</title> 
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
                 
<% 
           String userid = (String)session.getAttribute("n1");
           try{
                out.print(userid);
                String username = "root";
                String password = "root";
                String url = "jdbc:mysql://localhost:3306/nhmsdb";
                String driver = "com.mysql.jdbc.Driver";
                Class.forName(driver);
                Connection con = DriverManager.getConnection(url, username, password);
                PreparedStatement pstmt = con.prepareStatement("select * from pat where pid=?");
                pstmt.setString(1,userid);
                ResultSet rs = null;
                rs = pstmt.executeQuery();
                rs.next();%>
              
                
                <form action="updatepatientaccount.jsp">
                <table>
                    
                    <thead>
                        <td><h1>Field Name</h1></td>
                         <td><h1>Old Values</h1></td>
                         <td><h1>Enter New Values</h1></td>
                        
                    </thead>
                    <tr>
                        <td >Email</td>
                         <td><%=rs.getString("email")%></td>
                         <td><%=rs.getString("email")%></td>
                        
                    </tr>
                    <tr>
                        <td >Your Doctor</td>
                         <td><%=rs.getString("currdoc")%></td>
                         <td><%=rs.getString("currdoc")%></td>
                        
                    </tr>
                    <tr>
                        <td >Password</td>
                         <td><%=rs.getString("password")%></td>
                         <td><input type="password" required name="pwd"></td>
                        
                    </tr>
                    <tr>
                        <td>First Name</td>
                        <td><%=rs.getString("fname")%></td>
                         <td><input type="text" name="t1" value="<%=rs.getString("fname")%>"></td>
                    </tr>
                    <tr>                
                        <td>Last Name</td>
                        <td><%=rs.getString("lname")%></td>
                         <td><input type="text" name="t2" value="<%=rs.getString("lname")%>"></td>
                    </tr>
                   
                    <tr>        
                        <td>Address</td>
                        <td><%=rs.getString("address")%></td>
                         <td><input type="text" name="t4" value="<%=rs.getString("address")%>"></td>
                    </tr>                    
                    <tr>    
                        <td>Phone</td>
                         <td><%=rs.getString("phone")%></td>
                 <td><input type="text" name="t5" value="<%=rs.getString("phone")%>"></td>

                    </tr>
                    <tr>                    
                        
                        <td>Gender</td>
                        <td><%=rs.getString("gender")%></td>
              <td><input type="text" name="t6" value="<%=rs.getString("gender")%>"></td>

                    </tr> 
                    
                    <tr>
                        <td>Submit</td>
                        <td><b>-></b></td>
                   <td><input type="submit" value="UPDATE"></td>

                    </tr>
                </table>   
                   
                 </form>  
                <%
              }
            catch(Exception e){ 
                out.println("<h5>"+e+"</h5>");
          //    response.sendRedirect("error.jsp");
            }
%>

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