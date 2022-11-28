/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers;

import business.AppointmentTypes;
import business.Appointments;
import business.Users;
import data.BookingDB;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalTime;
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
            case "adminHome": {
                url = "/ADMIN/Admin.jsp";
                
                break;
            }
            case "allAppts": {
                url = "/ADMIN/AdminAllAppts.jsp";
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
                url = "/ADMIN/AdminCreateAppt.jsp";
                
                LinkedHashMap<Integer, AppointmentTypes> appointmentTypes = new LinkedHashMap();
                try {
                    appointmentTypes = BookingDB.getAllApptTypes();

                } catch (Exception e) {
                    LOG.log(Level.SEVERE, null, e);
                }
                request.setAttribute("appointmentType", appointmentTypes);

                LinkedHashMap<Integer, Users> doctors = new LinkedHashMap();
                try {
                    doctors = BookingDB.getAllDoctors("doctor");

                } catch (Exception e) {
                    LOG.log(Level.SEVERE, null, e);
                }
                request.setAttribute("doctors", doctors);
                
                LinkedHashMap<Integer, Users> patients = new LinkedHashMap();
                try {
                    patients = BookingDB.getAllDoctors("patient");

                } catch (Exception e) {
                    LOG.log(Level.SEVERE, null, e);
                }
                request.setAttribute("patients", patients);
                
                break;
            }
            case "submitNewAppt": {
                String apptDate = request.getParameter("apptDate");
                String apptTime = request.getParameter("apptTime");
                
                //String userFirstName = request.getParameter("firstName");
                //String userLastName = request.getParameter("lastName");
                String doctorName = request.getParameter("doctor");

                String apptType = request.getParameter("apptType");
                String reasonForVisit = request.getParameter("reasonForVisit");
                String insuranceProvider = request.getParameter("insuranceProvider");
                String insurancePlanNum = request.getParameter("insurancePlanNum");
                message = "";
                
                //Will need to clean up this code form here to break
                //Create a new object type for Appointments?
                Appointments appointment = new Appointments();
                appointment.setApptDate(LocalDate.parse(apptDate));
                request.setAttribute("apptDate", apptDate);

                appointment.setApptTime(LocalTime.parse(apptTime));
                request.setAttribute("apptTime", apptTime);

                //appointment.setUserID(Integer.parseInt(userID));

                //appointment.setUserFirstName(userFirstName);
                //request.setAttribute("firstName", userFirstName);

               // appointment.setUserLastName(userLastName);
                //request.setAttribute("lastName", userLastName);

                String[] doctorSplitName = doctorName.split(" ");

                appointment.setDoctorFirstName(doctorSplitName[0]);
                request.setAttribute("doctorFirst", doctorSplitName[0]);

                appointment.setDoctorLastName(doctorSplitName[1]);
                request.setAttribute("doctorLast", doctorSplitName[1]);

                //add code here to loop through appt types and put them in a dropdown
                appointment.setApptType(Integer.parseInt(apptType));
                request.setAttribute("apptID", apptType);

                appointment.setReasonForVisit(reasonForVisit);
                request.setAttribute("reasonForVisit", reasonForVisit);

                appointment.setInsuranceProvider(insuranceProvider);
                request.setAttribute("insuranceProvider", insuranceProvider);

                appointment.setInsurancePlanNum(insurancePlanNum);
                request.setAttribute("insurancePlanNum", insurancePlanNum);

                if ("".equals(message)) {
                    try {
                        BookingDB.insertNewAppointment(appointment);
                        message = "Appointment Created!";
                    } catch (SQLException ex) {
                        Logger.getLogger(Private.class.getName()).log(Level.SEVERE, null, ex);
                    }

                    request.setAttribute("message", message);
                    //request.setAttribute("user", user);
//                    request.setAttribute("appointment", appointment);
                    url = "/UserAppointments.jsp";
                    LinkedHashMap<Integer, Appointments> appointments = new LinkedHashMap();
                    try {
                    //    appointments = BookingDB.selectLoggedInUserAppointments(user.getUserID());

                    } catch (Exception e) {
                        LOG.log(Level.SEVERE, null, e);
                    }
                    request.setAttribute("appointments", appointments);
                } else {
                    request.setAttribute("message", message);
                   // request.setAttribute("user", user);
                    url = "/CreateAppointment.jsp";
                }

                break;
            }
            case "recentAppts": {
                
                break;
            }
            case "acceptDecline": {
                
                break;
            }
            case "allUsers": {
                url = "/ADMIN/UpdateRole.jsp";
                
                LinkedHashMap<Integer, Users> users = new LinkedHashMap();
                
                try {
                    users = BookingDB.selectAllUsers();
                } catch (SQLException ex) {
                    Logger.getLogger(Private.class.getName()).log(Level.SEVERE, null, ex);
                }
                
                request.setAttribute("users", users);
                
                break;
            }
        }
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }
}