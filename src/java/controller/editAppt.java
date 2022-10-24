package controller;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

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
    Document   : editAppt
    Created on : Oct 21, 2022, 12:03:51 PM
    Author     : Haiyan
 */
@WebServlet(urlPatterns = {"/editAppt"})
public class editAppt extends HttpServlet {

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
            out.println("<title>Servlet editAppt</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet editAppt at " + request.getContextPath() + "</h1>");
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
        String apptID = (String)session.getAttribute("apptID");
         
        int idx = doctorName.lastIndexOf(' ');
 
        String doctorFirstName = doctorName.substring(0, idx);
        String doctorLastName  = doctorName.substring(idx + 1);
      
    
//        System.out.println("desp "+apptDiscription.isEmpty());
        
        try{
  
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");  
        String connectionUrl = "jdbc:sqlserver://p3nwplsk12sql-v18.shr.prod.phx3.secureserver.net:1433;databaseName=BAHR;encrypt=true;trustServerCertificate=true;";  
        Connection con = DriverManager.getConnection(connectionUrl,"BAHRdata","Fall@2022");    
        Statement stm=con.createStatement();
        
        String sql="select * from AppointmentInfo where apptID='"+apptID+"'";
        ResultSet rs=stm.executeQuery(sql);
        rs.next();
                
        if (apptDiscription.isEmpty()){
        apptDiscription=rs.getString("reasonForVisit");
        }
        
        if (insProvider.isEmpty()){
            insProvider=rs.getString("insuranceProvider");
        }
        
        if(insPlanNo.isEmpty()){
            insPlanNo=rs.getString("insurancePlanNum");
        }
        
    String sql2="UPDATE AppointmentInfo set apptDate=?,apptTime=?,doctorFirstName=?,doctorLastName=?,reasonForVisit=?,insuranceProvider=?,insurancePlanNum=? where apptID=?;";
//
        PreparedStatement ps2=con.prepareStatement(sql2);
        ps2.setString(1,date);
        ps2.setString(2,time);
        ps2.setString(3,doctorFirstName);
        ps2.setString(4,doctorLastName);
        ps2.setString(5,apptDiscription);
        ps2.setString(6,insProvider);
        ps2.setString(7,insPlanNo);
        ps2.setString(8,apptID);
//     
        int x =ps2.executeUpdate();
        
        if (x>0){
        out.println("You edited an appointment successfully");
        }else{
            out.println("Editing appointment failed");
        }
         
     String info1="You edited an appointment successfully. You can check, edit your appointment in your account.";
     
    
     session.setAttribute("info1",info1);   
     
     response.sendRedirect("Thx2.jsp");
     
//        response.sendRedirect("ApptInfo.jsp");
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
