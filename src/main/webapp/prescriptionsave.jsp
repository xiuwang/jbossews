<%-- 
    Document   : prescriptionsave
    Created on : Jul 17, 2012, 3:31:39 PM
    Author     : Manish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
        String pid=request.getParameter("pid"); 
              String prescription = request.getParameter("prescription");
               String status = request.getParameter("status");
               Connection con=null; 
            try
              {
                //HttpSession ss = request.getSession(true);
                String username = "root";
                String password = "root";
                String url = "jdbc:mysql://localhost:3306/nhmsdb";
                String driver = "com.mysql.jdbc.Driver";
                Class.forName(driver);
                PreparedStatement pstmt=null;
                 con = DriverManager.getConnection(url, username, password);
                if(status.equals("update"))
                                       {
                    out.print(pid+prescription+(String)session.getAttribute("n1")+status);
              PreparedStatement  pstmt1 = con.prepareStatement("update prescription set prescription=? where pid=?");
                pstmt1.setString(2,pid); 
                pstmt1.setString(1,prescription);
                int i=pstmt1.executeUpdate();
                if(i!=0){
                     response.sendRedirect("showprescription.jsp");
                   //out.println("<h1>U have Successfully Registered</h1>");
                }
                }
               else if(status.equals("insert"))
                                       {
                     out.print(pid+prescription+(String)session.getAttribute("n1")+status);
            PreparedStatement      pstmt2 = con.prepareStatement("insert into prescription values(?,?,?)");
                                                                                                                                        pstmt = con.prepareStatement("insert into prescription values(?,?)");
                pstmt2.setString(1,pid);
                pstmt2.setString(2,prescription);
                pstmt2.setString(3,(String)session.getAttribute("n1"));
                int i=pstmt2.executeUpdate();
                if(i!=0){
                     response.sendRedirect("showprescription.jsp");
                   //out.println("<h1>U have Successfully Registered</h1>");
                }
                              }
                
               
              }

                catch(Exception e)
                    {
                        
                        response.sendRedirect("error.jsp");
                    }
            
         finally { con.close();           
            
        }

%>
    </body>
</html>
