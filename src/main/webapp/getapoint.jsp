<%-- 
    Document   : getapoint
    Created on : Jul 17, 2012, 11:33:33 PM
    Author     : Manish
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>

    <table>
            <tr>
                <th>Doctor ID</th>
                <th>Patient Id</th>
                <th>Job</th>
                <th>Date</th>
                <th>Time</th>
                
            </tr>
<%
          
        try{
        String email = (String)session.getAttribute("n1");
   String pid=request.getParameter("pid");
        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/nhmsdb";
        String driver = "com.mysql.jdbc.Driver";
        Class.forName(driver);
        PreparedStatement pstmt;
        Connection con = DriverManager.getConnection(url, user, pass);
        if(pid.equals("*") || pid.equals("")) 
                       {
        pstmt = con.prepareStatement("select * from appointment");
        
        }
        else
                       {
        pstmt = con.prepareStatement("select * from appointment where pid=?");
        pstmt.setString(1,pid);
        }
        
        ResultSet rs = pstmt.executeQuery();
        while(rs.next()){ %>

            <tr>
                <td><%=rs.getString("email")%></td>
                <td><%=rs.getString("pid")%></td>
                <td><%=rs.getString("job")%></td>
                <td><%=rs.getString("date")%></td>
                <td><%=rs.getString("time")%></td>
              
            </tr>
        
        <%}%>
        </table>
        
        
       <%
      
        
        }
 catch(Exception e){
     out.println(e);
    
}
%>