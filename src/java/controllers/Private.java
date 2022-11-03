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
import java.time.LocalDateTime;
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
                                break;
                            default:
                                url = "/Admin.jsp";
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
                    default:
                        url = "/Admin.jsp";
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
            case "editProfile": { //for any user
                request.setAttribute("user", user);
                url = "/EditUserProfile.jsp";
                break;
            }
            case "submitProfileEdit": { //for any user
                
                //this needs more validation for other fields
                
                String stringEmail = request.getParameter("email");
                String stringPassword = request.getParameter("password");
                String userName = user.getEmail();
                message = "";

                if (stringEmail.length() < 5) {
                    message += "Email must be more than 5 characters. ";
                } else if (!stringEmail.contains("@") || !stringEmail.contains(".") || stringEmail.lastIndexOf("@") > stringEmail.lastIndexOf(".")) {
                    message += "Email must contain @ and a period, period must be after the @. ";
                } else {
                    try {
                        userCompare = BookingDB.getEmailUsername(stringEmail);
                    } catch (SQLException ex) {
                        Logger.getLogger(Public.class.getName()).log(Level.SEVERE, null, ex);
                    }

                    if (userCompare == null) {
                        user.setEmail(stringEmail);
                    } else {
                        if (user.getEmail().equals(userCompare.getEmail())) {

                        } else {
                            message += "Email already exists. ";
                        }
                    }

                    request.setAttribute("email", stringEmail);

                }

                if (!"".equals(stringPassword)) {
                    if (stringPassword.length() < 10) {
                        message += "Password must be more than 10 characters. ";
                    } else {

                        SecretKeyCredentialHandler ch;

                        try {
                            ch = new SecretKeyCredentialHandler();
                            ch.setAlgorithm("PBKDF2WithHmacSHA256");
                            ch.setKeyLength(256);
                            ch.setSaltLength(16);
                            ch.setIterations(4096);

                            hash = ch.mutate(stringPassword);
                        } catch (Exception ex) {
                            LOG.log(Level.SEVERE, null, ex);

                        }
                        user.setPassword(hash);
                    }
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
                    url = "/UserAppointments.jsp";
                } else {
                    request.setAttribute("message", message);
                    request.setAttribute("user", user);
                    request.setAttribute("userName", userName);
                    url = "/EditUserProfile.jsp";
                }
                break;
            }
            case "getUserAppointments": {
                if (user == null || user.equals("")) {
                    //INVALID LOGIN - set generic error message and take them to index
                    message = "Your password is incorrect";
                    url = "/index.jsp";
                } else {
                    //Gets current user appointments from BookingDB and sets them in a variable sent to the page
                    url = "/UserAppointments.jsp"; //this is the page all patients first come to when they log in
                    LinkedHashMap<Integer, Appointments> Appointments = new LinkedHashMap();
                    try {
                        Appointments = BookingDB.selectLoggedInUserAppointments(user.getUserID());
                        request.setAttribute("Appointments", Appointments);
                    } catch (Exception e) {
                        LOG.log(Level.SEVERE, null, e);
                    }
                }
                break;
            }

        }
        //regardless of what happens put the message in the request and forward
        // to url
        request.setAttribute("message", message);

        getServletContext().getRequestDispatcher(url).forward(request, response);
    }
}
