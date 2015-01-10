<%-- 
    Document   : newjspappointmentsave
    Created on : Jul 17, 2012, 9:58:22 PM
    Author     : Manish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<%

            String email = (String)session.getAttribute("n1");
            String job = request.getParameter("job");
            String pid = request.getParameter("pid");
            String date = request.getParameter("date");
            String time = request.getParameter("time");
            try{
               
                String username = "root";
                String password = "root";
                String url = "jdbc:mysql://localhost:3306/nhmsdb";
                String driver = "com.mysql.jdbc.Driver";
                Class.forName(driver);
                Connection con = DriverManager.getConnection(url, username, password);
                PreparedStatement pstmt = con.prepareStatement("INSERT INTO appointment(email, pid, job, date, time) VALUES(?, ?, ?, ?, ?)");
                pstmt.setString(1, email);
                pstmt.setString(2, pid);
                pstmt.setString(3, job);
                pstmt.setString(4, date);
                pstmt.setString(5, time);
                int i=pstmt.executeUpdate();
                if(i!=0){
                     response.sendRedirect("appointment.jsp");
                  
                }
                       
            
            
            }
            catch(Exception e){
               response.sendRedirect("error.jsp");
                
            }
                        
          
   
%>