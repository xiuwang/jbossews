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
//import javax.servlet.http.HttpSession;

/**
 *
 * @author SuperUser
 */
public class insert extends HttpServlet {

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
              String email = request.getParameter("email");
              String passwd = request.getParameter("passwd");
              String fname = request.getParameter("fname");
              String lname = request.getParameter("lname");
              String gender = request.getParameter("gender");
              String qual = request.getParameter("qual");
              String add = request.getParameter("add");
              String phone = request.getParameter("phone");
              String sq = request.getParameter("sq");
              String sa = request.getParameter("sa");
            try
              {
                //HttpSession ss = request.getSession(true);
                String username = "root";
                String password = "root";
                String url = "jdbc:mysql://localhost:3306/nhmsdb";
                String driver = "com.mysql.jdbc.Driver";
                Class.forName(driver);
                Connection con = DriverManager.getConnection(url, username, password);
                PreparedStatement pstmt = con.prepareStatement("insert into doc(fname,lname,qualification,address,email,phone,password,gender,SQ,SA)values(?,?,?,?,?,?,?,?,?,?)");
                pstmt.setString(1,fname);
                pstmt.setString(2,lname);
                pstmt.setString(3, qual);
                pstmt.setString(4, add);
                pstmt.setString(5, email);
                pstmt.setString(6, phone);
                pstmt.setString(7, passwd);
                pstmt.setString(8, gender);
                pstmt.setString(9, sq);
                pstmt.setString(10, sa);
                int i=pstmt.executeUpdate();
                if(i!=0){
                     response.sendRedirect("index.jsp");
                   //out.println("<h1>U have Successfully Registered</h1>");
                }
                //else out.println("<h1>failed</h1>");
              }

                catch(Exception e)
                    {
                        //out.println("<h2>"+e+"</h2>");
                        response.sendRedirect("error.jsp");
                    }
                out.println("</body>");
                out.println("</html>");

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
