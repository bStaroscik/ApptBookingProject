/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers;

import business.Users;
import data.BookingDB;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.catalina.realm.SecretKeyCredentialHandler;

/**
 *
 * @author Ashbb
 */
public class Public extends HttpServlet {

    //this page still needs more validation for the rest of the fields
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = "/register.jsp";
        Logger LOG = Logger.getLogger(Public.class.getName());

        String action = request.getParameter("action");
        Users users = new Users();
        Users userCompare = new Users();
        String message = "";
        String success = "";
        String hash = "";

        if (action == null) {
            action = "none";
        }

        if (action.equals("register")) {
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String address = request.getParameter("address");
            String city = request.getParameter("city");
            String state = request.getParameter("state");
            String zip = request.getParameter("zipCode");
            String phoneNumber = request.getParameter("phoneNumber");
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            if (firstName.length() < 1) {
                message += "Must Enter First Name.<br />";
            } else {
                request.setAttribute("firstName", firstName);
                users.setFirstName(firstName);
            }

            if (lastName.length() < 1) {
                message += "Must Enter Last Name.<br />";
            } else {
                request.setAttribute("lastName", lastName);
                users.setLastName(lastName);
            }

            if (address.length() < 1) {
                message += "Must Enter An Address.<br />";
            } else {
                request.setAttribute("address", address);
                users.setAddress(address);
            }

            if (city.length() < 1) {
                message += "Must Enter A City.<br />";
            } else {
                request.setAttribute("city", city);
                users.setCity(city);
            }

            if (state.length() > 2 || state.length() < 1) {
                message += "State Must Be In Abbreviated Format (XX).<br />";
            } else {
                request.setAttribute("state", state);
                users.setState(state);
            }

            if (zip.length() > 6 || zip.length() < 1) {
                message += "Zip Code Must Be 6 Digits.<br />";
            } else {
                int zipCode = Integer.parseInt(zip);
                request.setAttribute("zipCode", zipCode);
                users.setZipCode(zipCode);
            }

            if (phoneNumber.length() < 1) {
                message += "Enter A Phone Number.<br />";
            } else {
                request.setAttribute("phoneNumber", phoneNumber);
                users.setPhoneNumber(phoneNumber);
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
                users.setEmail(email);
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
                users.setPassword(hash);
            }

            users.setRole("patient");

            request.setAttribute("message", message);
            request.setAttribute("users", users);

            if ("".equals(message)) {
                success = "Registration was successful!";
                request.setAttribute("success", success);
                try {
                    BookingDB.insertNewUser(users);
                } catch (SQLException ex) {
                    Logger.getLogger(Public.class.getName()).log(Level.SEVERE, null, ex);
                }
                url = "/AccountConfirmation.jsp";
            }

        }
        getServletContext().getRequestDispatcher(url).forward(request, response);
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
