<%-- 
    Document   : billing
    Created on : Apr 7, 2013, 4:05:50 PM
    Author     : SuperUser
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Billing</title>
        <link rel="stylesheet" type="text/css" href="style.css" />
    </head>
    <body><%if(session.getAttribute("n1")==null)response.sendRedirect("index.jsp");%>
        <%--<h1>Hello World!</h1>--%>         
        <div id="outer">
            
            
            <%@include file="header.jsp" %> 
             <%@include file="menu.jsp" %> 
            
            
            
            
            
	
	<div id="content">
		<div id="primaryContentContainer">
			<div id="primaryContent">
				<div class="box">
					<h2>Welcome to Hospital Management System</h2>
                                           <form>
            <table>
                <tr><th colspan="3">Patient Details</th></tr>
<% 
        String pid  = (String)session.getAttribute("n1");
  try{
     
        String user   = "root";
        String pass   = "root";
        String url    = "jdbc:mysql://localhost:3306/nhmsdb";
        String driver = "com.mysql.jdbc.Driver";
        Class.forName(driver);
        Connection con = DriverManager.getConnection(url, user, pass);
        PreparedStatement pstmt = con.prepareStatement("select * from pat where pid = ?");
        pstmt.setString(1, pid);
        ResultSet rs = null;
        rs = pstmt.executeQuery();
        rs.next();
%>
                <tr><td colspan="3"><%=rs.getString("fname")+" "+rs.getString("lname")%></td></tr>
                <tr><td colspan="3"><%=rs.getString("dob")%></td></tr>
                <tr><td colspan="3"><%=rs.getString("address")%></td></tr>
                <tr><td colspan="3"><%=rs.getString("phone")%></td></tr>
                <tr><td colspan="3"><%=rs.getString("email")%></td></tr>
            </table>
            <hr>
            <table>
                 <tr>
                     <th colspan="3">Charges</th>
                 </tr>
                 <tr>
                     <th>Appointment</th>
                     <th>Date</th>
                     <th>Doctor</th>
                 </tr>
           
<% 
   PreparedStatement pstmt1 = con.prepareStatement("select * from appointment where pid = ? and EMAIL = (select currdoc from pat where pid = ?)");
   pstmt1.setString(1, pid);
   pstmt1.setString(2 ,pid);
   ResultSet rs2 = pstmt1.executeQuery();
   int i = 0;
   while(rs2.next()){%>        
  
                <tr>
                    <td><label><%=i+1%></label></td>
                    <td><%=rs2.getString("date")%></td>
                    <td><%=rs2.getString("email")%></td>
                    
                </tr> 
              <% i = i+1 ;}%>
              <tr>
                  <th>No. of Appointments</th>
                  <th>Fees per Appointment</th>
                  <th>Total Charges</th>
              </tr>
              <tr>
                  <td><%=i%></td>
                  <td><label><% double fees = 100.00 ;%><%=fees%></label></td>
                  <td><label><%=i*fees%></label></td>
              </tr>
              
            </table>
         
 </form>
<%     
    } catch(Exception e){
        /*response.sendRedirect("error.jsp");*/
        out.println("<h1>"+e+"</h1>");}
      
                      
%>
                                        <div class="boxContent">
				</div>
			</div>
		</div>
		
		<div class="clear">
                    
                </div>
	</div>
<div id="footer">
    
</div>
</div>
</div>
    </body>
</html>
