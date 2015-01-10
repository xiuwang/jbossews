<%-- 
    Document   : patientvalidate
    Created on : Jul 18, 2012, 12:18:25 AM
    Author     : Manish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>

<%
String userid = request.getParameter("t1");
            String passwd = request.getParameter("t2");
            HttpSession ss= null;

            try{
                String username = "root";
                String password = "root";
                String url = "jdbc:mysql://localhost:3306/nhmsdb";
                String driver = "com.mysql.jdbc.Driver";
                Class.forName(driver);
                Connection con = DriverManager.getConnection(url, username, password);
                PreparedStatement pstmt = con.prepareStatement("select password from pat where pid=?");
                pstmt.setString(1,userid);
                ResultSet rs = null;
                rs = pstmt.executeQuery();
                rs.next();
                if(passwd.equals(rs.getString("password"))){
                   ss = request.getSession(true);
                   ss.setAttribute("n1", userid);
                   ss.setAttribute("type", "patient");
                   /*out.println("<h5>Successfully Logged In</h5>");*/
                 response.sendRedirect("profile.jsp");

                }else { response.sendRedirect("index.jsp");
                        /*out.println("<h5>failed to log in</h5>");*/
                }




            }
            catch(Exception e){ /*out.println("<h5>"+e+"</h5>");*/
                response.sendRedirect("error.jsp");
            }


%>
