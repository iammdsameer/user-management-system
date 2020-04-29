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

    private static String driver = "com.mysql.cj.jdbc.Driver";
    private static String url = "jdbc:mysql://localhost:3306/usermodel?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
    private static String root = "root";
    private static String password = "helloworld";

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
