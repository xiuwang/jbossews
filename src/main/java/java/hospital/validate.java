/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package hospital;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author SuperUser
 */
public class validate extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /*out.println("<html>");
              out.println("<head>");
              out.println("<title>Your Details</title>");
              out.println("</head>");
              out.println("<body bgcolor=yellow>");*/
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
                PreparedStatement pstmt = con.prepareStatement("select password from doc where email=?");
                pstmt.setString(1,userid);
                ResultSet rs = null;
                rs = pstmt.executeQuery();
                rs.next();
                if(passwd.equals(rs.getString("password"))){
                   ss = request.getSession(true);
                   ss.setAttribute("n1", userid);
                    ss.setAttribute("type", "doctor");
                   /*out.println("<h5>Successfully Logged In</h5>");*/
                 response.sendRedirect("profile.jsp");

                }else { response.sendRedirect("index.jsp");
                        /*out.println("<h5>failed to log in</h5>");*/
                }




            }
            catch(Exception e){ /*out.println("<h5>"+e+"</h5>");*/
                response.sendRedirect("error.jsp");
            }
           /*out.println("</body>");
            out.println("</html>");*/
        } finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
