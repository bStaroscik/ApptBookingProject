/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers;

import business.Users;
import data.BookingDB;
import java.io.IOException;
import java.util.HashMap;
import java.util.HashSet;
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
public class Private extends HttpServlet{
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
        
        HttpSession session = request.getSession();
        
        //Check for user already logged in
        Users user = (Users) session.getAttribute("user");
        Users userCompare = new Users();
        
        if (user == null) {
            message = "Please login";
            url = "index.jsp";
            
            user = new Users();
            
            if(action.equals("attemptLogin")) {
                String userName = request.getParameter("userName");
                String password = request.getParameter("password");
                boolean passCheck = false;
                
                HashMap<String, String> errors = new HashMap();
                try {
                    //Not active yet in BookingDB
                    user = BookingDB.getEmailUserName(userName);
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
                        url="/index.jsp";
                    } else if (ch.matches(password, user.getPassword())){
                        //VALID LOGIN
                        session.setAttribute("user", user);
                        message = "Login Success";
                        
                        url = "/target.jsp";
                    } else {
                        message = "Incorrect Password";
                        request.setAttribute("message", message);
                        url="/index.jsp";
                    }
                } catch (Exception ex) {
                    LOG.log(Level.SEVERE, null, ex);
                }
            } else {
                //User still logged in
                message = "You are still logged in";
                url = "/target.jsp";
            }
        }
    }
}
