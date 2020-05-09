/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.conquerors.usermanagementsystem.controller;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class SessionCounterListener implements HttpSessionListener {

    private static int totalActiveSessions;

    public static int getTotalActiveSession() {
        return totalActiveSessions;
    }

    @Override
    public void sessionCreated(HttpSessionEvent arg0) {
        totalActiveSessions++;
        System.out.println("sessionCreated - add one session into counter");
        // database call to log the log in event of the user with current time
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent arg0) {
        if (totalActiveSessions > 0)  {
            totalActiveSessions--;
            System.out.println("sessionDestroyed - deduct one session from counter");
        }
        // database call to log the log out event of the user with current time
    }
}
