/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers;

import business.Appointments;
import data.BookingDB;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author bstar
 */
public class Admin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String url = "/target.jsp";
        String message = "";
        String action = request.getParameter("action");
        String hash = "";
        Logger LOG = Logger.getLogger(Private.class.getName());
        
        if(action == null) {
            action = "none";
        }
        
        switch (action) {
            case "allAppts": {
                url = "/AdminAllAppts.jsp";
                LinkedHashMap<Integer, Appointments> appointments = new LinkedHashMap(); 
                try {
                    appointments = BookingDB.selectAllAppointments();
                } catch (SQLException ex) {
                    Logger.getLogger(Private.class.getName()).log(Level.SEVERE, null, ex);
                }
                
                request.setAttribute("appointments", appointments);
                
                break;
            }
            case "newAppts": {
                
                break;
            }
            case "recentAppts": {
                
                break;
            }
            case "acceptDecline": {
                
            }
        }
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }
}