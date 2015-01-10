<%-- 
    Document   : Iss_app2
    Created on : Jul 15, 2012, 10:57:24 AM
    Author     : SuperUser
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,javax.servlet.http.*" session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Appointments Page</title> 
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
        <table>
            <tr>
                <th>Patient ID</th><th>First Name</th><th>Last Name</th><th>Disease</th><th>Gender</th><th>Issue Appointment</th><th>Give Prescription</th>
            </tr>
        <%
 try {        
        String currdoc = (String)session.getAttribute("n1");
        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/nhmsdb";
        String driver = "com.mysql.jdbc.Driver";
        Class.forName(driver);
        Connection con = DriverManager.getConnection(url, user, pass);
        PreparedStatement pstmt = con.prepareStatement("select pid, fname, lname, disease, gender from pat where currdoc=?");
        pstmt.setString(1, currdoc);
        ResultSet rs = pstmt.executeQuery();
        while(rs.next()) {
    
    
    
    PreparedStatement pstmt2 = con.prepareStatement("select * from appointment where pid=?");
        pstmt2.setString(1, rs.getString("pid"));
        ResultSet rs2 = pstmt2.executeQuery();
        boolean statusap=rs2.next();
    
    
    PreparedStatement pstmt3 = con.prepareStatement("select * from prescription where pid=?");
        pstmt3.setString(1, rs.getString("pid"));
        ResultSet rs3 = pstmt3.executeQuery();
        boolean statuspre=rs3.next();
    
    %>
            <tr>
                <td><%=rs.getInt("pid")%></td>
                <td><%=rs.getString("fname")%></td>
                <td><%=rs.getString("lname")%></td>
                <td><%=rs.getString("disease")%></td>
                <td><%=rs.getString("gender")%></td>
                
                
                
                
                <%if(statusap){%>
                <td><a href="appointment.jsp">Click to See Given Appointment Details</a></td>
                <%}else{%>
                
                <td><a href="click.jsp?pid=<%=rs.getInt("pid")%>">Click to Give Appointment</a></td>
                <%}%>
                
                
                
                
                
               <%if(statuspre){%>
                <td><a href="showprescription.jsp">Click to See Given Prescription Details</a></td>
           <%}else{%>
            
                <td><a href="editprescription.jsp?pid=<%=rs.getInt("pid")%>">Click to Give Prescriptiont</a></td>
            <%}%>
            
            
            
            
            </tr>
            <%}%>
        </table>
        
  
    <%}
 catch(Exception e){ 
    
     response.sendRedirect("error.jsp");
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
