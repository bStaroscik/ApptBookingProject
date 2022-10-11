/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package data;

import business.Users;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.LinkedHashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Ashbb
 */
public class BookingDB {
    private static final Logger LOG = Logger.getLogger(BookingDB.class.getName());
    
//    we need: 
//    get all users
//    get specific user?
//    insert user
//    get doctors
//    get appointments
//    update user
//    delete user
//    get username
//    might need more

    public static void insert(Users user) throws SQLException {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query
                = "INSERT INTO usercredentials (userName, email, password, birthDate) "
                + "VALUES (?, ?, ?, ?)";
        
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setDate(4, Date.valueOf(user.getBirthDate()));
            
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

    public static LinkedHashMap<String, Users> selectAll() throws SQLException {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        String query = "SELECT * FROM usercredentials";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            
            Users user = null;
            LinkedHashMap<String, Users> users = new LinkedHashMap();

            while (rs.next()) {
                
                String userName = rs.getString("userName");
                String email = rs.getString("email");
                String password = rs.getString("password");
                LocalDate birthDate = rs.getDate("birthDate").toLocalDate();
                
                user = new Users(userName, email, password, birthDate);
                users.put(userName, user);
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
    
    public static void update(Users user) throws SQLException {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query
                = "UPDATE usercredentials SET userName = ?, email = ?, password = ?, birthDate = ? "
                + "WHERE userName = ?";
        
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setDate(4, Date.valueOf(user.getBirthDate()));
            ps.setString(5, user.getUsername());
            
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
    
    public static void delete(Users user) throws SQLException {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query
                = "DELETE FROM usercredentials"
                + "WHERE userName = ?";
        
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, user.getUsername());
            
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
    
    public static Users getUsername(String username) throws SQLException {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        String query
                = "SELECT * FROM usercredentials "
                + "WHERE userName = ?";
        
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, username);
            
            rs = ps.executeQuery();
            
            Users user = null;
            
            if(rs.next()) {
                String userName = rs.getString("userName");
                String email = rs.getString("email");
                String password = rs.getString("password");
                LocalDate birthDate = rs.getDate("birthDate").toLocalDate();
                user = new Users(userName, email, password, birthDate);
                
                
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
    
    public static Users getEmail(String email) throws SQLException {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        String query
                = "SELECT * FROM usercredentials "
                + "WHERE email = ?";
        
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, email);
            
            rs = ps.executeQuery();
            
            Users user = null;
            
            if(rs.next()) {
                String userName = rs.getString("userName");
                String userEmail = rs.getString("email");
                String password = rs.getString("password");
                LocalDate birthDate = rs.getDate("birthDate").toLocalDate();
                user = new Users(userName, userEmail, password, birthDate);
                
                
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
}
