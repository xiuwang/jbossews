<%-- 
    Document   : appointment
    Created on : Jul 14, 2012, 9:54:26 PM
    Author     : SuperUser
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true" import="java.sql.*,javax.servlet.http.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Appointment Page</title>
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
                                <table width="100%">
                                    <tr><th>PID</th><th>Prescription</th><th>Edit GIven Prescription</th></tr>
<%
          
        try{
        String email = (String)session.getAttribute("n1");
       // out.print(email);
        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/nhmsdb";
        String driver = "com.mysql.jdbc.Driver";
        Class.forName(driver);
        Connection con = DriverManager.getConnection(url, user, pass);
        PreparedStatement pstmt = con.prepareStatement("select * from prescription where did=?");
        pstmt.setString(1,email);
       
        ResultSet rs = pstmt.executeQuery();
        while(rs.next()){ %>

            <tr>
                <td><%=rs.getString("pid")%></td>
                <td><%=rs.getString("prescription")%></td>
                <td><a href="editprescription.jsp?pid=<%=rs.getString("pid")%>&prescription=<%=rs.getString("prescription")%>">Edit</a></td>
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
            <div id="secondaryContent">
            </div>
</div>
</div>
        <div id="footer">
        
    </div>
        
    </div>
    </body>
</html>
