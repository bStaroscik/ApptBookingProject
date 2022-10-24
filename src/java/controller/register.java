
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
//import static java.time.Clock.system;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import com.microsoft.sqlserver.jdbc.SQLServerDriver;
import static java.lang.System.out;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.http.HttpSession;

/*
 * Document   : register
 * Created on : Oct 15, 2022, 15:43:28 PM
 * Author     : Haiyan
*/
 
@WebServlet(name = "register", urlPatterns = {"/register"})
public class register extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet register</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Thank you for register! " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
                 
        }
    }

 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
        PrintWriter out = response.getWriter();
        
//        String firstname=request.getParameter("fname");
//        String lastname=request.getParameter("lname");
//        String address=request.getParameter("address");
//        String city=request.getParameter("city");
//        String state=request.getParameter("state");
//        String zipcode=request.getParameter("zipcode");
//        String phone=request.getParameter("phone");
//        String email=request.getParameter("email");
//        String password=request.getParameter("password");
//  
//        try{
//  
//        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");  
//        String connectionUrl = "jdbc:sqlserver://p3nwplsk12sql-v18.shr.prod.phx3.secureserver.net:1433;databaseName=BAHR;encrypt=true;trustServerCertificate=true;";  
//        Connection con = DriverManager.getConnection(connectionUrl,"BAHRdata","Fall@2022");       
////        if(con!=null){
////         System.out.println("good");
////        }
//        }catch(ClassNotFoundException | SQLException e){
//        System.out.println("ERROR 1::"+e.getMessage());         
//        }        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);

        String firstName=request.getParameter("fname");
        String lastName=request.getParameter("lname");
        String address=request.getParameter("address");
        String City=request.getParameter("city");
        String State=request.getParameter("state");
        String ZipCode=request.getParameter("zipcode");
        String phoneNumber=request.getParameter("phone");
        String email=request.getParameter("email");
        String password=request.getParameter("password");
        String role="patient";
        try{
  
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");  
        String connectionUrl = "jdbc:sqlserver://p3nwplsk12sql-v18.shr.prod.phx3.secureserver.net:1433;databaseName=BAHR;encrypt=true;trustServerCertificate=true;";  
        Connection con = DriverManager.getConnection(connectionUrl,"BAHRdata","Fall@2022");       
//        if(con!=null){
//         System.out.println("good");
//        }

        Statement stm=con.createStatement();
        String sql0="select * from Users where email='"+email+"'";
        ResultSet rs0=stm.executeQuery(sql0);

 if(rs0.next()){
 
     //out.println("This email has been regiesterd.");
     String info1="This email has been registered. Please use another email.";
     
     HttpSession session = request.getSession();
     session.setAttribute("info1",info1);   
     
     response.sendRedirect("Thx.jsp");
 }else{



        String sql="insert into Users (firstName,lastName,address,City,State,ZipCode,phoneNumber,email,role,password) values(?,?,?,?,?,?,?,?,?,?);";

        PreparedStatement ps=con.prepareStatement(sql);
        ps.setString(1,firstName);
        ps.setString(2,lastName);
        ps.setString(3,address);
        ps.setString(4,City);
        ps.setString(5,State);
        ps.setString(6,ZipCode);
        ps.setString(7,phoneNumber);
        ps.setString(8,email);
        ps.setString(9,role);
        ps.setString(10,password);
        int x=ps.executeUpdate();
        
        if (x>0){
        out.println("Registration done successfully");
        }else{
            out.println("Registration failed");
        }
         
     String info1="Thanks for registration! Please log in your account to make an appointment.";
     
     HttpSession session = request.getSession();
     session.setAttribute("info1",info1);   
     
     response.sendRedirect("Thx.jsp");
 }
        
        }catch(ClassNotFoundException | SQLException e){
        System.out.println("ERROR 1::"+e.getMessage());         
        }        
        
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

