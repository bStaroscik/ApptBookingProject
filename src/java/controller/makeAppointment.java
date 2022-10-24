/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*
   Document   : makeAppointment
   Created on : Oct 16, 2022, 12:27:09 PM
   Author     : Haiyan
 */
@WebServlet(name = "makeAppointment", urlPatterns = {"/makeAppointment"})
public class makeAppointment extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet makeAppointment</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet makeAppointment at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
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
        String apptDiscription=request.getParameter("apptDescription");
        String reason=request.getParameter("reason");
        String doctorName=request.getParameter("doctorName");
        String date=request.getParameter("date");
        String time=request.getParameter("time");
        String insProvider=request.getParameter("insProvider");
        String insPlanNo=request.getParameter("insPlanNo");
    
        HttpSession session = request.getSession();
        Object userFirstName=session.getAttribute("fname");    
        Object userLastName=session.getAttribute("lname");
        Object email=session.getAttribute("email"); 
        Integer userID=(Integer)session.getAttribute("userID");
 
         
        int idx = doctorName.lastIndexOf(' ');
 
        String doctorFirstName = doctorName.substring(0, idx);
        String doctorLastName  = doctorName.substring(idx + 1);
      
    

        
        
        try{
  
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");  
        String connectionUrl = "jdbc:sqlserver://p3nwplsk12sql-v18.shr.prod.phx3.secureserver.net:1433;databaseName=BAHR;encrypt=true;trustServerCertificate=true;";  
        Connection con = DriverManager.getConnection(connectionUrl,"BAHRdata","Fall@2022");       

        String sql="insert into AppointmentInfo(apptDate,apptTime,userID,userFirstName,userLastName,doctorFirstName,doctorLastName,reasonForVisit,insuranceProvider,insurancePlanNum) values(?,?,?,?,?,?,?,?,?,?);";

        PreparedStatement ps=con.prepareStatement(sql);
        ps.setString(1,date);
        ps.setString(2,time);
        ps.setString(3,userID.toString());
        ps.setString(4,userFirstName.toString());
        ps.setString(5,userLastName.toString());
        ps.setString(6,doctorFirstName);
        ps.setString(7,doctorLastName);
        ps.setString(8,apptDiscription);
        ps.setString(9,insProvider);
        ps.setString(10,insPlanNo);
          
     
        int x=ps.executeUpdate();
        
        if (x>0){
        out.println("You made an appointment successfully");
        }else{
            out.println("Appointment failed");
        }
         
     String info1="Thanks for your appointment.You can check, edit your appointment in your account.";
     
    
     session.setAttribute("info1",info1);   
     
//     response.sendRedirect("Thx.jsp");
        response.sendRedirect("ApptInfo.jsp");
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
