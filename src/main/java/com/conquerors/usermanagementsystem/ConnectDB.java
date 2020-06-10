/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.conquerors.usermanagementsystem;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class ConnectDB {

    private static String driver = "org.postgresql.Driver";
    private static String url = "jdbc:postgresql://ec2-18-232-143-90.compute-1.amazonaws.com/d1pd93qkh24v0h";
    private static String root = "jyopgpxnkrnmen";
    private static String password = "006ebffe6b8dcac9c2e7bb980823a295ea659c0c6d3fdf3c1ce9a82d59fd78f1";

    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName(driver);
        Connection conn = DriverManager.getConnection(url, root, password);
        return conn;
    }
      
}
