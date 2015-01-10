<%-- 
    Document   : appointment
    Created on : Jul 14, 2012, 9:54:26 PM
    Author     : SuperUser
--%>

<%--<%@page import="java.text.SimpleDateFormat"%>--%>
<%--<%@page import="java.util.Calendar"%>--%>
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
                                
        <table>
            <tr>
                <!--<th>Email : </th>-->
                <th>Patient Id</th>
                <th>Job</th>
                <th>Date</th>
                <th>Time</th>
                <th>Edit</th>
            </tr>
<%
          
        try{
            /**Calendar cal = Calendar.getInstance();
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            dateFormat.setLenient(false);
            String dd1=dateFormat.format(cal.getTime());**/
        String email = (String)session.getAttribute("n1");
        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/nhmsdb";
        String driver = "com.mysql.jdbc.Driver";
        Class.forName(driver);
        Connection con = DriverManager.getConnection(url, user, pass);
        //PreparedStatement pstmt = con.prepareStatement("select * from appointment where email=? and date=?");
        PreparedStatement pstmt = con.prepareStatement("select * from appointment where email=?");
        pstmt.setString(1, email);
        //pstmt.setString(2 ,dd1);
        ResultSet rs = pstmt.executeQuery();
        while(rs.next()){ %>

            <tr>
               <!-- <td><%=rs.getString("email")%></td> -->
                <td><%=rs.getString("pid")%></td>
                <td><%=rs.getString("job")%></td>
                <td><%=rs.getString("date")%></td>
                <td><%=rs.getString("time")%></td>
                <td><a href="editappointment.jsp?pid=<%=rs.getString("pid")%>&date=<%=rs.getString("date")%>&time=<%=rs.getString("time")%>&job=<%=rs.getString("job")%>">Click to Edit Appointment Details</a></td>
            </tr>
        
        <%}%>
        </table>
       <%}
 catch(Exception e){
                    response.sendRedirect("error.jsp");}
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
