/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package business;

/**
 *
 * @author Ashbb
 */
public class UserLogins {
    private int userID;
    private String userName;
    private String password;

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public UserLogins(int userID, String userName, String password) {
        this.userID = userID;
        this.userName = userName;
        this.password = password;
    }

    public UserLogins() {
    }
}
