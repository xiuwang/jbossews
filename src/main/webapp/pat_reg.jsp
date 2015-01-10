<%-- 
    Document   : pat_reg
    Created on : Jul 14, 2012, 10:52:31 PM
    Author     : SuperUser
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Patient Registration Page</title>
        <link rel="stylesheet" type="text/css" href="style.css" />
    </head>
    <body>
        <% if (session.getAttribute("n1")==null)
            response.sendRedirect("index.jsp");%>
        <div id="outer">
    <%@include file="header.jsp" %> 
             <%@include file="menu.jsp" %> 
            
            
    <div id="content">
        <div id="primaryContentContainer">
            <div id="primaryContent">
                <div class="box">
                    <div class="boxContent">
                                   <form method="post" action="patient">
            <table>
                <tr>
                    <td>First Name :</td>
                    <td><input type="text" name="fname" required></td>
                </tr>
                <tr>
                    <td>Last Name :</td>
                    <td><input type="text" name="lname" required></td>
                </tr>
                <tr>
                    <td>Date Of Birth :</td>
                    <td><input type="date" name="dob" required></td>
                </tr>
                <tr>
                    <td>Gender :</td>
                    <td>Male :<input type="radio" name="gender" value="male"><br/>Female :<input type="radio" name="gender" value="female"></td>
                    
                </tr>
                <tr>
                    <td>Email :</td>
                    <td><input type="text" name="email"></td>
                </tr>
                <tr>
                    <td>Address :</td>
                    <td><input type="text" name="address" required></td>
                </tr>
                <tr>
                    <td>Phone :</td>
                    <td><input type="text" name="phone" required></td>
                </tr>
                <tr>
                    <td>Disease :</td>
                    <td><input type="text" name="disease"></td>
                </tr>
                <tr>
                    <td>Doctor Assigned :</td>
                    <td><select name="currdoc">
<% 
    try{ 
         String user = "root";
         String pass = "root";
         String url = "jdbc:mysql://localhost:3306/nhmsdb";
         String driver = "com.mysql.jdbc.Driver";
         Connection con = null;
         Class.forName(driver);
         con = DriverManager.getConnection(url, user, pass);
         PreparedStatement stmt = con.prepareStatement("select email from doc");
         ResultSet rs = null;
          rs = stmt.executeQuery();
          while(rs.next()){ %>
              
   
                    <option value="<%=rs.getString("email")%>"><%=rs.getString("email")%></option>
        <%  }
    
    
    
    }
    catch(Exception e){ 
        out.println("<h6>"+e+"</h6>");
        //response.sendRedirect("error.jsp");
        }
%> 
</select></td>
                </tr>
                <tr>
                    
                    <td colspan="2"><input type="submit" value="Submit"></td>
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