/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.conquerors.usermanagementsystem;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author iammd
 */
public class LoginService {

    private static String driver = "org.postgresql.Driver";
    private static String url = "jdbc:postgresql://ec2-52-87-135-240.compute-1.amazonaws.com/d8sdbs1raqifvu";
    private static String root = "msqhhpagomxtlq";
    private static String password = "8da3f0bc68fb5fb5dc6755762b616a944086831dbf642caeb23f7f78a8e5dfda";

    public static User login(String username, String pass) throws Exception {
        User user = null;
        try {

            Class.forName(driver);
            Connection conn = DriverManager.getConnection(url, root, password);

            String sql = "SELECT * FROM USER WHERE username=? AND password=?;";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, username);
            ps.setString(2, pass);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setFirst_name(rs.getString("first_name"));
                user.setLast_name(rs.getString("last_name"));
                user.setEmail(rs.getString("email"));
            }

        } catch (Exception e) {
            throw e;
        }
        
        return user;
    }
}
