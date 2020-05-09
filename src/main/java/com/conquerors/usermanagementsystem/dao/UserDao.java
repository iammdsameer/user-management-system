/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.conquerors.usermanagementsystem.dao;

import com.conquerors.usermanagementsystem.ConnectDB;
import com.conquerors.usermanagementsystem.model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author iammd
 */
public class UserDao {

    public int register(User user) throws ClassNotFoundException {

        int result = 0;

        try {

            String sql = "INSERT INTO client(email,username,phone,pass,first_name,last_name,birth_date, is_admin) "
                    + "VALUES (?,?,?,?,?,?,?,?);";

            Connection conn = ConnectDB.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, user.getEmail());
            ps.setString(2, user.getUsername());
            ps.setString(3, user.getPhone());
            ps.setString(4, user.getPassword());
            ps.setString(5, user.getFirst_name());
            ps.setString(6, user.getLast_name());
            ps.setString(7, user.getBirth_date());
            ps.setInt(8, user.getIsAdmin());


            int status = ps.executeUpdate();

            conn.close();
            ps.close();

            return status;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public User login(String username, String pass) throws Exception {
        User user = null;
        try {

            Connection conn = ConnectDB.getConnection();
            String sql = "SELECT * FROM client WHERE username=? AND pass=?;";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, username);
            ps.setString(2, pass);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setFirst_name(rs.getString("first_name"));
                user.setLast_name(rs.getString("last_name"));
                user.setEmail(rs.getString("email"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("pass"));
                user.setBirth_date(rs.getString("birth_date"));
                user.setPhone(rs.getString("phone"));
                user.setId(rs.getInt("id"));
                user.setIsAdmin(rs.getInt("is_admin"));
                user.setIsBlocked(rs.getInt("is_blocked"));
            }
            conn.close();
            ps.close();

        } catch (Exception e) {
            throw e;
        }

        return user;
    }

    public int makeChanges(User user) throws Exception {
        int result = 0;

        Connection conn = ConnectDB.getConnection();

        try {
            String sql = "UPDATE client set "
                    + "email = ?," + "username = ?," + "phone = ?,"
                    + "pass = ?," + "first_name = ?," + "last_name = ?," + "birth_date = ? "
                    + "where id=?" + ";";

            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.setString(1, user.getEmail());
            ps.setString(2, user.getUsername());
            ps.setString(3, user.getPhone());
            ps.setString(4, user.getPassword());
            ps.setString(5, user.getFirst_name());
            ps.setString(6, user.getLast_name());
            ps.setString(7, user.getBirth_date());
            ps.setInt(8, user.getId());

            int pss =  ps.executeUpdate();
            conn.close();
            ps.close();
            
            return pss;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    
    public int recoverPassword(User user) throws Exception {
        int result = 0;
        
        try {
            String sql = "UPDATE client SET pass=? WHERE phone=?;";
            Connection conn = ConnectDB.getConnection();
            
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "helloworld");
            ps.setString(2, user.getPhone());
            
            int pss =  ps.executeUpdate();
            conn.close();
            ps.close();
            
            return pss;
                
        } catch(SQLException e) {
            e.printStackTrace();
        }
        
        return result;
    }
    
    public void blockUser(int id) throws Exception {       
        try {
            String sql = "UPDATE client SET is_blocked=1 where id=?;";
            Connection conn = ConnectDB.getConnection();
            
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
                
        } catch(SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void unblockUser(int id) throws Exception {       
        try {
            String sql = "UPDATE client SET is_blocked=0 where id=?;";
            Connection conn = ConnectDB.getConnection();
            
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
                
        } catch(SQLException e) {
            e.printStackTrace();
        }
    }

}
