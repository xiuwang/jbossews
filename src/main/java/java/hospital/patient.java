/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package hospital;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;

/**
 *
 * @author SuperUser
 */
public class patient extends HttpServlet {

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
            
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String dob = request.getParameter("dob");
            //SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            //dateFormat.setLenient(false);
            //String dd1=dateFormat.format(dob);
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            String disease = request.getParameter("disease");
            String currdoc = request.getParameter("currdoc");
            String gender = request.getParameter("gender");
            try{

                String username = "root";
                String password = "root";
                String url = "jdbc:mysql://localhost:3306/nhmsdb";
                String driver = "com.mysql.jdbc.Driver";
                Class.forName(driver);
                Connection con = DriverManager.getConnection(url, username, password);
                PreparedStatement pstmt = con.prepareStatement("insert into pat(fname,lname,dob,email,address,phone,disease,currdoc,gender)values(?,?,?,?,?,?,?,?,?)");
                pstmt.setString(1, fname);
                pstmt.setString(2, lname);
                //pstmt.setString(3, dd1);
                pstmt.setString(3, dob);
                pstmt.setString(4, email);
                pstmt.setString(5, address);
                pstmt.setString(6, phone);
                pstmt.setString(7, disease);
                pstmt.setString(8, currdoc);
                pstmt.setString(9, gender);
                int i=pstmt.executeUpdate();
                if(i!=0){
                     response.sendRedirect("index.jsp");
                  /*out.println("<h1>U have Successfully Registered</h1>");*/
                }
                /*else out.println("<h1>failed</h1>");*/
            }
            catch(Exception e){
                response.sendRedirect("error.jsp");
              //out.println("<h1>"+e+"</h1>");
            }
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
