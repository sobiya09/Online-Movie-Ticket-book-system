/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Asiri
 */
public class User {

    private int id;
    private String firstname;
    private String lastname;
    private String username;
    private String password;

    public User(String username, String password) {

        this.username = username;
        this.password = MD5.getMd5(password);

    }

    public User(String firstname, String lastname, String username, String password) {

        this.firstname = firstname;
        this.lastname = lastname;
        this.username = username;
        this.password = MD5.getMd5(password);

    }

    public User() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getFirstname() {
        return firstname;
    }

    public String getLastname() {
        return lastname;
    }

 public String validatePassword(String password) {
        if (password.length() < 10) {
            return "Password must be at least 10 characters long.";
        }
        if (!password.matches("^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{10,}$")) {
            return "Password must contain both letters and numbers.";
        }
        return null;
        
 }
    
    public boolean register(Connection con) {

        try {
            String query = "INSERT INTO user(firstName, lastName, username, password) VALUES(?, ?, ?, ?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, this.firstname);
            pstmt.setString(2, this.lastname);
            pstmt.setString(3, this.username);
            pstmt.setString(4, this.password);

            return pstmt.executeUpdate() > 0;
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }

    }
    
    public boolean isEmailAlreadyRegistered(Connection con){
        
        try {
            String query = "SELECT username from user where username = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, this.username);
            ResultSet rs = pstmt.executeQuery();
         
             if (rs.next()) {
                String username = rs.getString("username");
                if (username.equals(this.username)) {
                    return true;
                } else {
                    return false;
                }
            } else {
                return false;
            }
            
        }
        catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        
    }
    

    public boolean authenticate(Connection con) {
        try {
            String query = "SELECT id,password FROM user WHERE username = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, this.username);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                String db_password = rs.getString("password");
                if (db_password.equals(this.password)) {
                    int user_id = rs.getInt("id");
                    this.setId(user_id);
                    return true;
                } else {
                    return false;
                }
            } else {
                return false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    public User getUserById(Connection con) {

        try {
            String query = "SELECT firstName,lastName FROM user WHERE id = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, this.id);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {

                this.setFirstname(rs.getString("firstName"));
                this.setLastname(rs.getString("lastName"));

            }
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);

        }

        return this;

    }

}
