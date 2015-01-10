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
public class IssueApp extends HttpServlet {

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
            out.println("<title>Servlet IssueApp</title>");  
            out.println("</head>");
            out.println("<body>");*/
            //out.println("<h1>Servlet IssueApp at " + request.getContextPath () + "</h1>");

            HttpSession session = request.getSession(true);
            String email = (String)session.getAttribute("n1");
            String job = request.getParameter("job");
            String pid = request.getParameter("pid");
            String date = request.getParameter("date");
            String time = request.getParameter("time");
            try{
                //HttpSession ss = request.getSession(true);
                String username = "root";
                String password = "root";
                String url = "jdbc:mysql://localhost:3306/nhmsdb";
                String driver = "com.mysql.jdbc.Driver";
                Class.forName(driver);
                Connection con = DriverManager.getConnection(url, username, password);
                PreparedStatement pstmt = con.prepareStatement("insert into appointment(email,pid,job,date,time)values(?,?,?,?,?)");
                pstmt.setString(1, email);
                pstmt.setString(2, pid);
                pstmt.setString(3, job);
                pstmt.setString(4, date);
                pstmt.setString(5, time);
                int i=pstmt.executeUpdate();
                if(i!=0){
                     response.sendRedirect("index.jsp");
                   //out.println("<h1>Appointment Successfully Issued</h1>");
                }
                //else out.println("<h1>failed</h1>");           
            
            
            }
            catch(Exception e){
                response.sendRedirect("error.jsp");
                //out.println("<h1>"+e+"</h1>");
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
