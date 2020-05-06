/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.conquerors.usermanagementsystem;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author iammd
 */
public class ConnectDB {

    private static String driver = "org.postgresql.Driver";
    private static String url = "jdbc:postgresql://ec2-52-87-135-240.compute-1.amazonaws.com/d8sdbs1raqifvu";
    private static String root = "msqhhpagomxtlq";
    private static String password = "8da3f0bc68fb5fb5dc6755762b616a944086831dbf642caeb23f7f78a8e5dfda";

    public ConnectDB() {
        
    }
    
    public static void main(String[] args) throws Exception {
        try {
            Class.forName(driver);
            Connection conn = DriverManager.getConnection(url, root, password);
        } catch (Exception e) {
            throw e;
        }
    }
}
