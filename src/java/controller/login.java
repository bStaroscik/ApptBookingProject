/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
//import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
//import java.sql.PreparedStatement;
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
    Document   : login
    Created on : Oct 16, 2022, 11:36:07 PM
    Author     : Haiyan
 */
@WebServlet(name = "login", urlPatterns = {"/login"})
public class login extends HttpServlet {

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
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet login</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet login at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
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
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String connectionUrl = "jdbc:sqlserver://p3nwplsk12sql-v18.shr.prod.phx3.secureserver.net:1433;databaseName=BAHR;encrypt=true;trustServerCertificate=true;";
            Connection con = DriverManager.getConnection(connectionUrl, "BAHRdata", "Fall@2022");
            Statement stm = con.createStatement();

            String sql = "select * from Users where email='" + email + "' and password='" + password + "'";
            ResultSet rs = stm.executeQuery(sql);

            if (rs.next()) {
                Integer userID = rs.getInt(1);
                String fname = rs.getString(2);
                String lname = rs.getString(3);
                String address = rs.getString(4);
                String City = rs.getString(5);

                String State = rs.getString(6);
                String ZipCode = rs.getString(7);
                String phoneNumber = rs.getString(8);

                HttpSession session = request.getSession();
                session.setAttribute("userID", userID);
                session.setAttribute("email", email);
                session.setAttribute("fname", fname);
                session.setAttribute("lname", lname);
                session.setAttribute("address", address);
                session.setAttribute("City", City);
                session.setAttribute("State", State);
                session.setAttribute("ZipCode", ZipCode);
                session.setAttribute("phoneNumber", phoneNumber);
                session.setAttribute("password", password);

                String sql2 = "select * from AppointmentInfo where userID='" + userID + "'";
                ResultSet rs2 = stm.executeQuery(sql2);
//           
//          if (rs2.next()){
//                    String apptDate=rs2.getString(2);
//                    String apptTime=rs2.getString(3);
//                    String doctorFirstName=rs2.getString(7);
//                    String doctorLastName=rs2.getString(8);
//                    String reasonForVisit=rs2.getString(10);
//                    String insuranceProvider=rs2.getString(11);
//                    String insurancePlanNum=rs2.getString(12);
//                    
//                    session.setAttribute("aDate", apptDate);
//                    session.setAttribute("aTime", apptTime);
//                    session.setAttribute("Doctor1stName", doctorFirstName);
//                    session.setAttribute("DoctorLstName", doctorLastName);
//                    session.setAttribute("reason", reasonForVisit);
//                    session.setAttribute("Insurance", insuranceProvider);
//                    session.setAttribute("InsuranceNum", insurancePlanNum);  

//                    session.setAttribute("rs2", rs2);
                response.sendRedirect("ApptInfo.jsp");

//          }else{
//              
//           response.sendRedirect("userInfo.jsp");
//           
//          }
            } else {
                out.println("wrong email or password...");
            }

        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("ERROR 1::" + e.getMessage());
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
