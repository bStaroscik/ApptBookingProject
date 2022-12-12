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
import static java.lang.Integer.parseInt;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.Properties;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.mail.*;
//import javax.mail.internet.*;
//import javax.activation.*;

     

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
                
                LinkedHashMap<Integer, Appointments> recentAppointments = new LinkedHashMap(); 
                try {
                    recentAppointments = BookingDB.getTodaysAppointments();
                } catch (SQLException ex) {
                    Logger.getLogger(Private.class.getName()).log(Level.SEVERE, null, ex);
                }
                
                request.setAttribute("appointments", recentAppointments);
                
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
                String patientName = request.getParameter("patient");
                //String userFirstName = request.getParameter("firstName");
                //String userLastName = request.getParameter("lastName");
                String doctorName = request.getParameter("doctor");

                String apptType = request.getParameter("apptType");
                String reasonForVisit = request.getParameter("reasonForVisit");
                String insuranceProvider = request.getParameter("insuranceProvider");
                String insurancePlanNum = request.getParameter("insurancePlanNum");
                message = "";
                
                
                Appointments appointment = new Appointments();
                appointment.setApptDate(LocalDate.parse(apptDate));
                

                appointment.setApptTime(LocalTime.parse(apptTime));
                
                
                String[] patientSplitName = patientName.split(" ");
                
                appointment.setUserID(Integer.parseInt(patientSplitName[0]));
                

                appointment.setUserFirstName(patientSplitName[1]);

                appointment.setUserLastName(patientSplitName[2]);

                String[] doctorSplitName = doctorName.split(" ");

                appointment.setDoctorFirstName(doctorSplitName[0]);

                appointment.setDoctorLastName(doctorSplitName[1]);

                appointment.setApptType(Integer.parseInt(apptType));

                appointment.setReasonForVisit(reasonForVisit);

                appointment.setInsuranceProvider(insuranceProvider);

                appointment.setInsurancePlanNum(insurancePlanNum);

                if ("".equals(message)) {
                    try {
                        BookingDB.insertNewAppointment(appointment);
                        message = "Appointment Created!";
                    } catch (SQLException ex) {
                        Logger.getLogger(Private.class.getName()).log(Level.SEVERE, null, ex);
                    }

                    request.setAttribute("message", message);

                    url = "/ADMIN/Admin.jsp";
                    
                    
                } else {
                    request.setAttribute("message", message);
                   // request.setAttribute("user", user);
                    url = "/ADMIN/AdminCreateAppt.jsp";
                }

                break;
            }
            case "recentAppts": {
                url = "/ADMIN/Admin.jsp";
                LinkedHashMap<Integer, Appointments> recentAppointments = new LinkedHashMap(); 
                try {
                    recentAppointments = BookingDB.getTodaysAppointments();
                } catch (SQLException ex) {
                    Logger.getLogger(Private.class.getName()).log(Level.SEVERE, null, ex);
                }
                
                request.setAttribute("appointments", recentAppointments);
                break;
            }
            case "confirmAppt": {
                url = "/ADMIN/AdminAllAppts.jsp";
                String confirmApptID = request.getParameter("idValue");
                
                Appointments confirmAppt = new Appointments();
                
                try {
                    confirmAppt = BookingDB.getAppointment(confirmApptID);
                    
                    if (confirmAppt.isConfirmed()) {
                        message = "This appointment has already been confirmed";
                    } else {
                        confirmAppt.setConfirmed(true);
                        
                        try {
                            BookingDB.confirmAppointment(confirmAppt);
                            message = "Appointment has been confirmed";
                            Users user = new Users();
                            try {
                                user = BookingDB.getUser(confirmAppt.getUserID());
                            } catch (SQLException ex) {
                                Logger.getLogger(Private.class.getName()).log(Level.SEVERE, null, ex);
                            }
//                            //Begin to send email
//                            
//                            String to = user.getEmail();
//                            String from = "family_medicine@gmail.com";
//                            //String host = "smtp.gmail.com";
//                            
////                            // Get system properties object
//                            Properties properties = System.getProperties();
////
////                            // Setup mail server
////                            properties.setProperty("mail.smtp.host", host);
//
//                            //Properties properties = new Properties();
//                            //properties.put("mail.transport.protocol", "smtp");
//                            properties.put("mail.smtps.host", "smtp.gmail.com");
//                            properties.put("mail.smtps.port", 465);
//                            properties.put("mail.smtp.ssl.enable", "true");
//                            properties.put("mail.smtps.auth", "true");
//                            properties.put("mail.smtps.quitwait", "false");
//
//                            // Get the default Session object.
//                            Session mailSession = Session.getInstance(properties, new javax.mail.Authenticator() {
//                                protected PasswordAuthentication getPasswordAuthentication() {
//                                    return new PasswordAuthentication("emailAddress@gmail.com", "Password123");
//                                }
//                            });
//
//                            try {
//                                // Create a default MimeMessage object.
//                                MimeMessage emailMessage = new MimeMessage(mailSession);
//
//                                // Set From: header field of the header.
//                                emailMessage.setFrom(new InternetAddress(from));
//
//                                // Set To: header field of the header.
//                                emailMessage.addRecipient(Message.RecipientType.TO,
//                                        new InternetAddress(to));
//                                // Set Subject: header field
//                                emailMessage.setSubject("Your Appointment!");
//
//                                // Now set the actual message
//                                emailMessage.setText("Your Appointment has been confirmed.");
//
//                                // Send message
//                                //Transport Transport = mailSession.getTransport();
//                                //Transport.connect("bstaroscik10@gmail.com", "PHoraf09?%$");
//                                Transport.send(emailMessage);
//                                //Transport.close();
//                                
//                            } catch (MessagingException mex) {
//                                mex.printStackTrace();
//                                
//                            }
//                            
//                            //End Email function
                        } catch (SQLException ex) {
                            Logger.getLogger(Private.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(Private.class.getName()).log(Level.SEVERE, null, ex);
                }
                
                LinkedHashMap<Integer, Appointments> appointments = new LinkedHashMap(); 
                try {
                    appointments = BookingDB.selectAllAppointments();
                } catch (SQLException ex) {
                    Logger.getLogger(Private.class.getName()).log(Level.SEVERE, null, ex);
                }
                
                
                
                request.setAttribute("message", message);
                request.setAttribute("appointments", appointments);
                break;
            }
            case "editAppt": {
                url = "/ADMIN/AdminEditAppt.jsp";
                String editApptID = request.getParameter("idValue");
                
                Appointments editAppt = new Appointments();
                
                try {
                    editAppt = BookingDB.getAppointment(editApptID);
                } catch (SQLException ex) {
                    Logger.getLogger(Private.class.getName()).log(Level.SEVERE, null, ex);
                }
                
                request.setAttribute("editAppt", editAppt);
                
                
                break;
            }
            //Will need review and validation
            case "submitApptEdit": {
                url = "/ADMIN/AdminAllAppts.jsp";
                
                String editApptDate = (String) request.getAttribute("apptDate");
                String editApptTime = (String) request.getAttribute("apptTime");
                String editApptID = (String) request.getAttribute("idValue");
                message = "";
                
                Appointments submitEditAppt = new Appointments();
                
                LocalDate dateApptDate = LocalDate.parse(editApptDate);
                LocalTime timeApptTime = LocalTime.parse(editApptTime);

                
                try {
                    submitEditAppt = BookingDB.getAppointment(editApptID);

                    submitEditAppt.setApptDate(dateApptDate);
                    submitEditAppt.setApptTime(timeApptTime);
                    try {
                        BookingDB.updateAppointment(submitEditAppt);
                    } catch (SQLException ex) {
                        Logger.getLogger(Private.class.getName()).log(Level.SEVERE, null, ex);
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(Private.class.getName()).log(Level.SEVERE, null, ex);
                }
                break;
            }
            case "allUsers": {
                url = "/ADMIN/UpdateRole.jsp";
                
                LinkedHashMap<Integer, Users> users = new LinkedHashMap();
                
                String[] allRoles = {"doctor", "patient", "admin"};
                
                try {
                    users = BookingDB.selectAllUsers();
                } catch (SQLException ex) {
                    Logger.getLogger(Private.class.getName()).log(Level.SEVERE, null, ex);
                }
                
                request.setAttribute("users", users);
                request.setAttribute("allRoles", allRoles);
                
                break;
            }
            case "deleteAppt": {
                url = "/ADMIN/AdminAllAppts.jsp";
                String delApptID = request.getParameter("idValue");
                
                Appointments delAppt = new Appointments();
                
                try {
                    delAppt = BookingDB.getAppointment(delApptID);
                    
                    try {
                        BookingDB.deleteAppointment(delAppt);
                    } catch (SQLException ex) {
                        Logger.getLogger(Private.class.getName()).log(Level.SEVERE, null, ex);
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(Private.class.getName()).log(Level.SEVERE, null, ex);
                }
                
                
                
                LinkedHashMap<Integer, Appointments> appointments = new LinkedHashMap(); 
                try {
                    appointments = BookingDB.selectAllAppointments();
                } catch (SQLException ex) {
                    Logger.getLogger(Private.class.getName()).log(Level.SEVERE, null, ex);
                }
                
                request.setAttribute("appointments", appointments);
                
                break;
            }
            case "updateRole": {
                url = "/ADMIN/UpdateRole.jsp";
                String userEmail = request.getParameter("userEmail");
                String updateRole = request.getParameter("role");
                Users user = new Users();
                
                try {
                    user = BookingDB.getEmailUsername(userEmail);
                } catch (SQLException ex) {
                    Logger.getLogger(Private.class.getName()).log(Level.SEVERE, null, ex);
                }
                
                user.setRole(updateRole);
                
                try {
                    BookingDB.updateUser(user);
                } catch (SQLException ex) {
                    Logger.getLogger(Private.class.getName()).log(Level.SEVERE, null, ex);
                }
                
                LinkedHashMap<Integer, Users> users = new LinkedHashMap();
                
                String[] allRoles = {"doctor", "patient", "admin"};
                
                try {
                    users = BookingDB.selectAllUsers();
                } catch (SQLException ex) {
                    Logger.getLogger(Private.class.getName()).log(Level.SEVERE, null, ex);
                }
                
                request.setAttribute("users", users);
                request.setAttribute("allRoles", allRoles);
                break;
            }
            case "deleteUser": {
                url = "/ADMIN/UpdateRole.jsp";
                String userEmail = request.getParameter("userEmail");

                Users user = new Users();
                
                try {
                    user = BookingDB.getEmailUsername(userEmail);
                } catch (SQLException ex) {
                    Logger.getLogger(Private.class.getName()).log(Level.SEVERE, null, ex);
                }
                
                try {
                    BookingDB.deleteUsers(user);
                } catch (SQLException ex) {
                    Logger.getLogger(Private.class.getName()).log(Level.SEVERE, null, ex);
                }
                
                LinkedHashMap<Integer, Users> users = new LinkedHashMap();
                
                String[] allRoles = {"doctor", "patient", "admin"};
                
                try {
                    users = BookingDB.selectAllUsers();
                } catch (SQLException ex) {
                    Logger.getLogger(Private.class.getName()).log(Level.SEVERE, null, ex);
                }
                
                request.setAttribute("users", users);
                request.setAttribute("allRoles", allRoles);
                
                break;
            }
        }
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }
}