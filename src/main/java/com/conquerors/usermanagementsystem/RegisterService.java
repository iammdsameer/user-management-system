/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.conquerors.usermanagementsystem;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 *
 * @author iammd
 */
public class RegisterService {
    
    private static String driver = "org.postgresql.Driver";
    private static String url = "jdbc:postgresql://ec2-34-202-7-83.compute-1.amazonaws.com/d2eiku6ahai58o";
    private static String root = "txigaxyjbnpcal";
    private static String password = "38b0ecef6a21e338823173c6d464d18d895dbfbf7e0ddad29fea8d576e45460b";
    
    public static void register(User user) throws Exception {
        
        try {
            
            Class.forName(driver);
            Connection conn = DriverManager.getConnection(url, root, password);
            
            String sql = "INSERT INTO client(email,username,phone,pass,first_name,last_name) " +
                    "VALUES (?,?,?,?,?,?);";
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.setString(1, user.getEmail());
            ps.setString(2, user.getUsername());
            ps.setString(3, user.getPhone());
            ps.setString(4, user.getPassword());
            ps.setString(5, user.getFirst_name());
            ps.setString(6, user.getLast_name());
            
            ps.executeUpdate();
            return;
            
        } catch(Exception e) {
            throw e;
        }
        
    }
}
