/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package data;

import business.Appointments;
import business.Users;
import java.sql.*;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.LinkedHashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Ashbb
 */
public class BookingDB {
    private static final Logger LOG = Logger.getLogger(BookingDB.class.getName());

    public static void insertNewUser(Users user) throws SQLException {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query
                = "INSERT INTO users (firstName, lastName, address, city, state, zipCode, phoneNumber, email, Role, password) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, user.getFirstName());
            ps.setString(2, user.getLastName());
            ps.setString(3, user.getAddress());
            ps.setString(4, user.getCity());
            ps.setString(5, user.getState());
            ps.setInt(6, user.getZipCode());
            ps.setString(7, user.getPhoneNumber());
            ps.setString(8, user.getEmail());
            ps.setString(9, user.getRole());
            ps.setString(10, user.getPassword());
            
            ps.executeUpdate();
        } catch (SQLException e) {
            LOG.log(Level.SEVERE, "*** insert sql", e);
            throw e;
            
        } finally {
            try {
                ps.close();
                pool.freeConnection(connection);
            } catch (Exception e) {
                LOG.log(Level.SEVERE, "*** insert null pointer??", e);
                throw e;
            }
        }
    }

    public static LinkedHashMap<Integer, Users> selectAllUsers() throws SQLException {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        String query = "SELECT * FROM users";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            
            Users user = null;
            LinkedHashMap<Integer, Users> users = new LinkedHashMap();

            while (rs.next()) {
                
                int userID = rs.getInt("userID");
                String firstName = rs.getString("firstName");
                String lastName = rs.getString("lastName");
                String address = rs.getString("address");
                String city = rs.getString("city");
                String state = rs.getString("state");
                int zipCode = rs.getInt("zipCode");
                String phoneNumber = rs.getString("phoneNumber");
                String email = rs.getString("email");
                String role = rs.getString("role");
                String password = rs.getString("password");
                
                user = new Users(userID, firstName, lastName, address, city, state, zipCode, phoneNumber, email, role, password);
                users.put(userID, user);
            }
            return users;
        } catch (SQLException e) {
            LOG.log(Level.SEVERE, "*** select all sql", e);
            throw e;
            
        } finally {
            try {
                rs.close();
                ps.close();
                pool.freeConnection(connection);
            } catch (Exception e) {
                LOG.log(Level.SEVERE, "*** select all null pointer??", e);
                throw e;
            }
        }
    }
    
    public static void updateUser(Users user) throws SQLException {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query
                = "UPDATE users SET firstName = ?, lastName = ?, address = ?, city = ?, state = ?, zipCode = ?, phoneNumber = ?, email = ?, role = ?, password = ? "
                + "WHERE userID = ?";
        
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, user.getUserID());
            ps.setString(2, user.getFirstName());
            ps.setString(3, user.getLastName());
            ps.setString(4, user.getAddress());
            ps.setString(5, user.getCity());
            ps.setString(6, user.getState());
            ps.setInt(7, user.getZipCode());
            ps.setString(8, user.getPhoneNumber());
            ps.setString(9, user.getEmail());
            ps.setString(10, user.getRole());
            
            ps.executeUpdate();
        } catch (SQLException e) {
            LOG.log(Level.SEVERE, "*** insert sql", e);
            throw e;
            
        } finally {
            try {
                ps.close();
                pool.freeConnection(connection);
            } catch (Exception e) {
                LOG.log(Level.SEVERE, "*** insert null pointer??", e);
                throw e;
            }
        }
    }
    
    public static void deleteUsers(Users user) throws SQLException {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query
                = "DELETE FROM users "
                + "WHERE userID = ?";
        
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, user.getUserID());
            
            ps.executeUpdate();
        } catch (SQLException e) {
            LOG.log(Level.SEVERE, "*** insert sql", e);
            throw e;
            
        } finally {
            try {
                ps.close();
                pool.freeConnection(connection);
            } catch (Exception e) {
                LOG.log(Level.SEVERE, "*** insert null pointer??", e);
                throw e;
            }
        }
    }
    
    public static Users getEmailUsername(String emailAddress) throws SQLException {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        String query
                = "SELECT * FROM users "
                + "WHERE email = ?";
        
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, emailAddress);
            
            rs = ps.executeQuery();
            
            Users user = null;
            
            if(rs.next()) {
                int userID = rs.getInt("userID");
                String firstName = rs.getString("firstName");
                String lastName = rs.getString("lastName");
                String address = rs.getString("address");
                String city = rs.getString("city");
                String state = rs.getString("state");
                int zipCode = rs.getInt("zipCode");
                String phoneNumber = rs.getString("phoneNumber");
                String email = rs.getString("email");
                String role = rs.getString("role");
                String password = rs.getString("password");
                user = new Users(userID, firstName, lastName, address, city, state, zipCode, phoneNumber, email, role, password);
                
                
            }
            return user;
                
        } catch (SQLException e) {
            LOG.log(Level.SEVERE, "*** insert sql", e);
            throw e;
            
        } finally {
            try {
                ps.close();
                pool.freeConnection(connection);
            } catch (Exception e) {
                LOG.log(Level.SEVERE, "*** insert null pointer??", e);
                throw e;
            } 
        }
    }
    
    public static LinkedHashMap<Integer, Appointments> selectLoggedInUserAppointments(int loggedInUserID) throws SQLException {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        String query = "SELECT * FROM appointmentinfo "
                     + "WHERE userID = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, loggedInUserID);
            rs = ps.executeQuery();
            
            Appointments appointment = null;
            LinkedHashMap<Integer, Appointments> appointments = new LinkedHashMap();

            while (rs.next()) {
                int apptID = rs.getInt("apptID");
                LocalDate apptDate = rs.getDate("apptDate").toLocalDate();
                LocalTime apptTime = rs.getTime("apptTime").toLocalTime();
                int userID = rs.getInt("userID");
                String userFirstName = rs.getString("userFirstName");
                String userLastName = rs.getString("userLastName");
                String doctorFirstName = rs.getString("doctorFirstName");
                String doctorLastName = rs.getString("doctorLastName");
                String apptType = rs.getString("apptType");
                String reasonForVisit = rs.getString("reasonForVisit");
                String insuranceProvider = rs.getString("insuranceProvider");
                String insurancePlanNum = rs.getString("insurancePlanNum");
                String notes = rs.getString("notes");                
                
                appointment = new Appointments(apptID, apptDate, apptTime, userID, userFirstName, userLastName, doctorFirstName, doctorLastName, apptType, reasonForVisit, insuranceProvider, insurancePlanNum, notes);
                
                appointments.put(userID, appointment);
            }
            return appointments;
        } catch (SQLException e) {
            LOG.log(Level.SEVERE, "*** select all sql", e);
            throw e;
            
        } finally {
            try {
                rs.close();
                ps.close();
                pool.freeConnection(connection);
            } catch (Exception e) {
                LOG.log(Level.SEVERE, "*** select all null pointer??", e);
                throw e;
            }
        }
    }
    
    public static Users getAllDoctors(String roleName) throws SQLException {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        String query
                = "SELECT * FROM users "
                + "WHERE role = ?";
        
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, roleName);
            
            rs = ps.executeQuery();
            
            Users user = null;
            
            if(rs.next()) {
                int userID = rs.getInt("userID");
                String firstName = rs.getString("firstName");
                String lastName = rs.getString("lastName");
                String address = rs.getString("address");
                String city = rs.getString("city");
                String state = rs.getString("state");
                int zipCode = rs.getInt("zipCode");
                String phoneNumber = rs.getString("phoneNumber");
                String email = rs.getString("email");
                String role = rs.getString("role");
                String password = rs.getString("password");
                user = new Users(userID, firstName, lastName, address, city, state, zipCode, phoneNumber, email, role, password);   
            }
            return user;
                
        } catch (SQLException e) {
            LOG.log(Level.SEVERE, "*** insert sql", e);
            throw e;
            
        } finally {
            try {
                ps.close();
                pool.freeConnection(connection);
            } catch (Exception e) {
                LOG.log(Level.SEVERE, "*** insert null pointer??", e);
                throw e;
            } 
        }   
    }
    
    public static void insertNewAppointment(Appointments appointment) throws SQLException {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query
                = "INSERT INTO appointmentinfo (apptDate, apptTime, userID, userFirstName, userLastName, doctorFirstName, doctorLastName, apptType, reasonForVisit, insuranceProvider, insurancePlanNum) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        try {
            ps = connection.prepareStatement(query);
            ps.setDate(1, Date.valueOf(appointment.getApptDate()));
            ps.setTime(2, Time.valueOf(appointment.getApptTime()));
            ps.setInt(3, appointment.getUserID());
            ps.setString(4, appointment.getUserFirstName());
            ps.setString(5, appointment.getUserLastName());
            ps.setString(6, appointment.getDoctorFirstName());
            ps.setString(7, appointment.getDoctorLastName());
            ps.setString(8, appointment.getApptType());
            ps.setString(9, appointment.getReasonForVisit());
            ps.setString(10, appointment.getInsuranceProvider());
            ps.setString(10, appointment.getInsurancePlanNum());
            
            ps.executeUpdate();
        } catch (SQLException e) {
            LOG.log(Level.SEVERE, "*** insert sql", e);
            throw e;
            
        } finally {
            try {
                ps.close();
                pool.freeConnection(connection);
            } catch (Exception e) {
                LOG.log(Level.SEVERE, "*** insert null pointer??", e);
                throw e;
            }
        }
    }
    
    public static LinkedHashMap<Integer, Appointments> selectAllAppointments() throws SQLException {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        String query = "SELECT * FROM appointmentinfo";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            
            Appointments appointment = null;
            LinkedHashMap<Integer, Appointments> appointments = new LinkedHashMap();

            while (rs.next()) {
                int apptID = rs.getInt("apptID");
                LocalDate apptDate = rs.getDate("apptDate").toLocalDate();
                LocalTime apptTime = rs.getTime("apptTime").toLocalTime();
                int userID = rs.getInt("userID");
                String userFirstName = rs.getString("userFirstName");
                String userLastName = rs.getString("userLastName");
                String doctorFirstName = rs.getString("doctorFirstName");
                String doctorLastName = rs.getString("doctorLastName");
                String apptType = rs.getString("apptType");
                String reasonForVisit = rs.getString("reasonForVisit");
                String insuranceProvider = rs.getString("insuranceProvider");
                String insurancePlanNum = rs.getString("insurancePlanNum");
                String notes = rs.getString("notes");                
                
                appointment = new Appointments(apptID, apptDate, apptTime, userID, userFirstName, userLastName, doctorFirstName, doctorLastName, apptType, reasonForVisit, insuranceProvider, insurancePlanNum, notes);
                
                appointments.put(userID, appointment);
            }
            return appointments;
        } catch (SQLException e) {
            LOG.log(Level.SEVERE, "*** select all sql", e);
            throw e;
            
        } finally {
            try {
                rs.close();
                ps.close();
                pool.freeConnection(connection);
            } catch (Exception e) {
                LOG.log(Level.SEVERE, "*** select all null pointer??", e);
                throw e;
            }
        }
    }
    
    public static void updateAppointment(Appointments appointment) throws SQLException {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query
                = "UPDATE appointmentInfo SET apptDate = ?, apptTime = ?, userID = ?, userFirstName = ?, userLastName = ?, doctorFirstName = ?, doctorLastName = ?, apptType = ?, reasonForVisit = ?, insuranceProvider = ?, insurancePlanNum = ? "
                + "WHERE apptID = ?";
        
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, appointment.getApptID());
            ps.setDate(2, Date.valueOf(appointment.getApptDate()));
            ps.setTime(3, Time.valueOf(appointment.getApptTime()));
            ps.setInt(4, appointment.getUserID());
            ps.setString(5, appointment.getUserFirstName());
            ps.setString(6, appointment.getUserLastName());
            ps.setString(7, appointment.getDoctorFirstName());
            ps.setString(8, appointment.getDoctorLastName());
            ps.setString(9, appointment.getApptType());
            ps.setString(10, appointment.getReasonForVisit());
            ps.setString(11, appointment.getInsuranceProvider());
            ps.setString(12, appointment.getInsurancePlanNum());
            
            ps.executeUpdate();
        } catch (SQLException e) {
            LOG.log(Level.SEVERE, "*** insert sql", e);
            throw e;
            
        } finally {
            try {
                ps.close();
                pool.freeConnection(connection);
            } catch (Exception e) {
                LOG.log(Level.SEVERE, "*** insert null pointer??", e);
                throw e;
            }
        }
    }
    
    public static void deleteAppointment(Appointments appointment) throws SQLException {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query
                = "DELETE FROM appointmentinfo"
                + "WHERE apptID = ?";
        
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, appointment.getApptID());
            
            ps.executeUpdate();
        } catch (SQLException e) {
            LOG.log(Level.SEVERE, "*** insert sql", e);
            throw e;
            
        } finally {
            try {
                ps.close();
                pool.freeConnection(connection);
            } catch (Exception e) {
                LOG.log(Level.SEVERE, "*** insert null pointer??", e);
                throw e;
            }
        }
    }
    
    public static void updateNotes(int id, String notes) throws SQLException {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        String query = "UPDATE Appointments SET notes = ? WHERE apptID = ?";
        try {
            ps = connection.prepareStatement(query);
       
            ps.setString(1, notes);
            ps.setInt(2, id);
          
            ps.executeUpdate();
        } catch (SQLException e) {
            LOG.log(Level.SEVERE, "*** select all sql", e);
            throw e;
        } finally {
            try {
                ps.close();
                pool.freeConnection(connection);
            } catch (Exception e) {
                LOG.log(Level.SEVERE, "*** select all null pointer??", e);
                throw e;
            }
        }
    }
    
    public static LinkedHashMap<Integer, Appointments> getAllNotes() throws SQLException {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "SELECT * FROM Appointments";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            Appointments appointment = null;
            LinkedHashMap<Integer, Appointments> appointments = new LinkedHashMap();
            while (rs.next()) {
                int apptID = rs.getInt("apptID");
                LocalDate apptDate = rs.getDate("apptDate").toLocalDate();
                LocalTime apptTime = rs.getTime("apptTime").toLocalTime();
                int userID = rs.getInt("userID");
                String userFirstName = rs.getString("userFirstName");
                String userLastName = rs.getString("userLastName");
                String doctorFirstName = rs.getString("doctorFirstName");
                String doctorLastName = rs.getString("doctorLastName");
                String apptType = rs.getString("apptType");
                String reasonForVisit = rs.getString("reasonForVisit");
                String insuranceProvider = rs.getString("insuranceProvider");
                String insurancePlanNum = rs.getString("insurancePlanNum");
                String notes = rs.getString("notes");
                
                appointment = new Appointments(apptID, apptDate, apptTime, userID, userFirstName, userLastName, doctorFirstName, doctorLastName, apptType, reasonForVisit, insuranceProvider, insurancePlanNum, notes);
                
                appointments.put(apptID, appointment);
            }
            return appointments;
        } catch (SQLException e) {
            LOG.log(Level.SEVERE, "*** select all sql", e);
            throw e;
        } finally {
            try {
                rs.close();
                ps.close();
                pool.freeConnection(connection);
            } catch (Exception e) {
                LOG.log(Level.SEVERE, "*** select all null pointer??", e);
                throw e;
            }
        }
    }
    

}
