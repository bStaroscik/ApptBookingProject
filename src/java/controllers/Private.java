/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers;

import business.Appointments;
import business.Users;
import data.BookingDB;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.catalina.realm.SecretKeyCredentialHandler;

/**
 *
 * @author Ashbb
 */
public class Private extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String url = "/index.jsp";
        String message = "";
        String action = request.getParameter("action");
        String hash = "";
        Logger LOG = Logger.getLogger(Private.class.getName());

        if (action == null) {
            action = "none";
        }

        HttpSession session = request.getSession();

        //Check for user already logged in
        Users user = (Users) session.getAttribute("user");
        Users userCompare = new Users();

        if (user == null) {
            message = "Please login";
            url = "index.jsp";

            user = new Users();

            if (action.equals("attemptLogin")) {
                String userName = request.getParameter("userName");
                String password = request.getParameter("password");
                boolean passCheck = false;

                HashMap<String, String> errors = new HashMap();
                try {
                    //Not active yet in BookingDB
                    user = BookingDB.getEmailUsername(userName);
                } catch (Exception ex) {
                    errors.put("SelectAll", "Something went wrong with the Database, please try again");
                }

                request.setAttribute("errors", errors);
                request.setAttribute("user", user);

                SecretKeyCredentialHandler ch;

                try {
                    ch = new SecretKeyCredentialHandler();
                    ch.setAlgorithm("PBKDF2WithHmacSHA256");
                    ch.setKeyLength(256);
                    ch.setSaltLength(16);
                    ch.setIterations(4096);

                    if (user == null) {
                        //INVALID LOGIN
                        message = "Incorrect username";
                        request.setAttribute("message", message);
                        url = "/index.jsp";
                    } else if (ch.matches(password, user.getPassword())) {
                        //VALID LOGIN
                        session.setAttribute("user", user);
                        message = "Login Success";
                        switch (user.getRole()) {
                            case "doctor":
                                url = "/DoctorsAppointments.jsp";
                                break;
                            case "patient":
                                url = "/UserAppointments.jsp";
                                //how to get to the appt page with the appts on it?  currently only goes to right page if using menu button
                                break;
                            case "admin":
                                url = "/AdminAllAppointments.jsp";
                                break;
                            default:
                                url = "/index.jsp";
                                break;
                        }

                    } else {
                        message = "Incorrect Password";
                        request.setAttribute("message", message);
                        url = "/index.jsp";
                    }
                } catch (Exception ex) {
                    LOG.log(Level.SEVERE, null, ex);
                }
            } else {
                //User still logged in
                message = "You are still logged in";
                switch (user.getRole()) {
                    case "doctor":
                        url = "/DoctorsAppointments.jsp";
                        break;
                    case "patient":
                        url = "/UserAppointments.jsp";
                        break;
                    case "admin":
                        url = "/AdminAllAppointments.jsp";
                        break;
                    default:
                        url = "/index.jsp";
                        break;
                }
            }
            request.setAttribute("message", message);
        }
        switch (action) {
            case "logout": {
                session.invalidate();
                url = "/index.jsp";
                break;
            }

            //<editor-fold desc="Get Doctor Appointments">
            case "getDoctorsAppointments": {
                if (user == null || user.equals("")) {
                    //INVALID LOGIN - set generic error message and take them to index
                    message = "Your password is incorrect";
                    url = "/index.jsp";
                } else {
                    //Gets current doctors appointments from BookingDB and sets them in a variable sent to the page
                    url = "/DoctorsAppointments.jsp";
                    LinkedHashMap<Integer, Appointments> Appointments = new LinkedHashMap();
                    try {
                        Appointments = BookingDB.selectAllAppointments();
                        request.setAttribute("Appointments", Appointments);
                    } catch (Exception e) {
                        LOG.log(Level.SEVERE, null, e);
                    }
                }
                break;
            }
            //</editor-fold>

            //<editor-fold desc="Edit Doctor Notes">
            case "editNotes": {
                url = "/editNotes.jsp";

                LinkedHashMap<Integer, Appointments> notes = new LinkedHashMap();
                try {
                    notes = BookingDB.getAllNotes();

                } catch (Exception e) {
                }
                request.setAttribute("notes", notes);
                String idValue = request.getParameter("idValue");

                Appointments currentNotes = notes.get(Integer.valueOf(idValue));
                request.setAttribute("idValue", idValue);
                request.setAttribute("noteText", currentNotes.getNotes());

                break;
            }
            //</editor-fold>

            //<editor-fold desc="Submit Doctor Notes">
            case "submitNotesEdit": {
                LinkedHashMap<Integer, Appointments> notes = new LinkedHashMap();
                try {
                    notes = BookingDB.getAllNotes();
                } catch (Exception e) {
                }
                String idValue = (String) request.getParameter("idValue");
                String noteText = (String) request.getParameter("noteText");

                Appointments newNotes = notes.get(Integer.valueOf(idValue));
                try {
                    BookingDB.updateNotes(newNotes.getApptID(), noteText);
                } catch (Exception e) {
                }
                try {
                    notes = BookingDB.selectAllAppointments();

                } catch (Exception e) {
                }
                request.setAttribute("Appointments", notes);
                url = "/DoctorsAppointments.jsp";
                break;
            }
            //</editor-fold>

            //<editor-fold desc="Edit Profile Redirect">
            case "editProfile": { //for any user
                request.setAttribute("user", user);
                url = "/EditUserProfile.jsp";
                break;
            }
            //</editor-fold>

            //<editor-fold desc="Submit Edit Profile">
            case "submitProfileEdit": { //for any user
                String firstName = request.getParameter("firstName");
                String lastName = request.getParameter("lastName");
                String address = request.getParameter("address");
                String city = request.getParameter("city");
                String state = request.getParameter("state");
                String zip = request.getParameter("zipCode");
                String phoneNumber = request.getParameter("phoneNumber");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                message = "";

                if (firstName.length() < 1) {
                    message += "Must Enter First Name.<br />";
                } else {
                    request.setAttribute("firstName", firstName);
                    user.setFirstName(firstName);
                }

                if (lastName.length() < 1) {
                    message += "Must Enter Last Name.<br />";
                } else {
                    request.setAttribute("lastName", lastName);
                    user.setLastName(lastName);
                }

                if (address.length() < 1) {
                    message += "Must Enter An Address.<br />";
                } else {
                    request.setAttribute("address", address);
                    user.setAddress(address);
                }

                if (city.length() < 1) {
                    message += "Must Enter A City.<br />";
                } else {
                    request.setAttribute("city", city);
                    user.setCity(city);
                }

                if (state.length() > 2 || state.length() < 1) {
                    message += "State Must Be In Abbreviated Format (XX).<br />";
                } else {
                    request.setAttribute("state", state);
                    user.setState(state);
                }

                if (zip.length() > 6 || zip.length() < 1) {
                    message += "Zip Code Must Be 6 Digits.<br />";
                } else {
                    int zipCode = Integer.parseInt(zip);
                    request.setAttribute("zipCode", zipCode);
                    user.setZipCode(zipCode);
                }

                if (phoneNumber.length() < 1) {
                    message += "Enter A Phone Number.<br />";
                } else {
                    request.setAttribute("phoneNumber", phoneNumber);
                    user.setPhoneNumber(phoneNumber);
                }

                if (email.length() < 5) {
                    message += "Email must be more than 5 characters.<br />";
                } else if (!email.contains("@") || !email.contains(".") || email.lastIndexOf("@") > email.lastIndexOf(".")) {
                    message += "Email must contain @ and a period, period must be after the @.<br />";
                } else {
                    try {
                        userCompare = BookingDB.getEmailUsername(email);
                    } catch (SQLException ex) {
                        Logger.getLogger(Public.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    if (userCompare != null) {
                        message += "Email already exists.<br />";
                    }
                    request.setAttribute("email", email);
                    user.setEmail(email);
                }

                if (password.length() < 10) {
                    message += "Password must be more than 10 characters.<br />";
                } else {
                    SecretKeyCredentialHandler ch;
                    try {
                        ch = new SecretKeyCredentialHandler();
                        ch.setAlgorithm("PBKDF2WithHmacSHA256");
                        ch.setKeyLength(256);
                        ch.setSaltLength(16);
                        ch.setIterations(4096);
                        hash = ch.mutate(password);
                    } catch (Exception ex) {
                        LOG.log(Level.SEVERE, null, ex);
                    }
                    request.setAttribute("password", password);
                    user.setPassword(hash);
                }

                if ("".equals(message)) {
                    try {
                        BookingDB.updateUser(user);
                        message = "Update Success!";
                    } catch (SQLException ex) {
                        Logger.getLogger(Private.class.getName()).log(Level.SEVERE, null, ex);
                    }

                    request.setAttribute("message", message);
                    request.setAttribute("user", user);

                    switch (user.getRole()) {
                        case "doctor":
                            url = "/DoctorsAppointments.jsp";
                            break;
                        case "patient":
                            url = "/UserAppointments.jsp";
                            break;
                        case "admin":
                            url = "/AdminAllAppointments.jsp";
                            break;
                        default:
                            url = "/index.jsp";
                            break;
                    }
                } else {
                    request.setAttribute("message", message);
                    request.setAttribute("user", user);
                    request.setAttribute("email", email);
                    url = "/EditUserProfile.jsp";
                }
                break;
            }
            //</editor-fold>

            //<editor-fold desc="Get Patient Appts"> 
            case "getUserAppointments": {
                if (user == null || user.equals("")) {
                    //INVALID LOGIN - set generic error message and take them to index
                    message = "Your password is incorrect";
                    url = "/index.jsp";
                } else {
                    //Gets current user appointments from BookingDB and sets them in a variable sent to the page
                    url = "/UserAppointments.jsp"; //this is the page all patients first come to when they log in
                    LinkedHashMap<Integer, Appointments> appointments = new LinkedHashMap();
                    try {
                        appointments = BookingDB.selectLoggedInUserAppointments(user.getUserID());

                    } catch (Exception e) {
                        LOG.log(Level.SEVERE, null, e);
                    }
                    request.setAttribute("appointments", appointments);
                }
                break;
            }
            //</editor-fold>

            //<editor-fold desc="Edit Patient Appts">
            case "editPatientAppointment": {
                request.setAttribute("user", user);
                url = "/EditPatientAppointment.jsp";

                LinkedHashMap<Integer, Appointments> appointments = new LinkedHashMap();
                try {
                    appointments = BookingDB.selectLoggedInUserAppointments(user.getUserID());

                } catch (Exception e) {
                }
                request.setAttribute("appointments", appointments);
                String idValue = request.getParameter("idValue");

                Appointments currentAppointments = appointments.get(Integer.valueOf(idValue));
                request.setAttribute("idValue", idValue);
                request.setAttribute("apptDate", currentAppointments.getApptDate());
                request.setAttribute("apptTime", currentAppointments.getApptTime());

                break;
            }

            //</editor-fold>
            
            //<editor-fold desc="Submit Patient Appointment Edit">
            case "submitPatientApptEdit": {
                Appointments appointment = new Appointments();
                String apptDate = request.getParameter("apptDate");
                String apptTime = request.getParameter("apptTime");
                String apptID = request.getParameter("idValue");
                message = "";

                appointment.setApptDate(LocalDate.parse(apptDate));
                appointment.setApptTime(LocalTime.parse(apptTime));
                appointment.setApptID(Integer.parseInt(apptID));

                try {
                    //UsersDB.updatePosts(postString, LocalDateTime.parse(postDate, formatter), Integer.parseInt(postID));
                    BookingDB.updateAppointment(appointment);
                    message = "Appointment successfully edited";
                } catch (SQLException ex) {
                    Logger.getLogger(Private.class.getName()).log(Level.SEVERE, null, ex);
                    message = "Appointment could not be edited";
                }

                request.setAttribute("message", message);
                request.setAttribute("appointment", appointment);
                url = "/UserAppointments.jsp";
                break;
            }
            //</editor-fold>

            //<editor-fold desc="Create Patient Appointment">
            case "createUserAppointments": {
                request.setAttribute("user", user);
                if (user == null || user.equals("")) {
                    //INVALID LOGIN - set generic error message and take them to index
                    message = "Your are not logged in";
                    url = "/index.jsp";
                } else {
                    url = "/CreateAppointment.jsp";

                    String apptDate = request.getParameter("apptDate");
                    String apptTime = request.getParameter("apptTime");
                    String userID = request.getParameter("userID");
                    String userFirstName = request.getParameter("firstName");
                    String userLastName = request.getParameter("lastName");
                    String doctorFirstName = request.getParameter("doctorFirst");
                    String doctorLastName = request.getParameter("doctorLast");
                    String apptTypeID = request.getParameter("apptID");
                    String reasonForVisit = request.getParameter("reasonForVisit");
                    String insuranceProvider = request.getParameter("insuranceProvider");
                    String insurancePlanNum = request.getParameter("insurancePlanNum");
                    message = "";

                    Appointments appointment = new Appointments();
                    appointment.setApptDate(LocalDate.parse(apptDate));
                    request.setAttribute("apptDate", apptDate);

                    appointment.setApptTime(LocalTime.parse(apptTime));
                    request.setAttribute("apptTime", apptDate);

                    appointment.setUserID(Integer.parseInt(userID));

                    appointment.setUserFirstName(userFirstName);
                    request.setAttribute("firstName", apptDate);

                    appointment.setUserLastName(userLastName);
                    request.setAttribute("lastName", apptDate);

                    appointment.setDoctorFirstName(doctorFirstName);
                    request.setAttribute("doctorFirst", apptDate);

                    appointment.setDoctorLastName(doctorLastName);
                    request.setAttribute("doctorLast", apptDate);

                    appointment.setApptID(Integer.parseInt(apptTypeID));
                    request.setAttribute("apptID", apptDate);

                    appointment.setReasonForVisit(reasonForVisit);
                    request.setAttribute("reasonForVisit", apptDate);

                    appointment.setInsuranceProvider(insuranceProvider);
                    request.setAttribute("insuranceProvider", apptDate);

                    appointment.setInsurancePlanNum(insurancePlanNum);
                    request.setAttribute("insurancePlanNum", apptDate);

                    if ("".equals(message)) {
                        try {
                            BookingDB.insertNewAppointment(appointment);
                            message = "Appointment Created!";
                        } catch (SQLException ex) {
                            Logger.getLogger(Private.class.getName()).log(Level.SEVERE, null, ex);
                        }

                        request.setAttribute("message", message);
                        request.setAttribute("user", user);
                        request.setAttribute("appointment", appointment);
                    } else {
                        request.setAttribute("message", message);
                        request.setAttribute("user", user);
                        url = "/CreateAppointment.jsp";
                    }
                    break;
                }
            }
            //</editor-fold>

            case "": {

            }

        }
        //regardless of what happens put the message in the request and forward
        // to url

        request.setAttribute(
                "message", message);

        getServletContext()
                .getRequestDispatcher(url).forward(request, response);
    }
}
