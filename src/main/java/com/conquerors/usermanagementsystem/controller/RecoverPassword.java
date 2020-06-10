/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.conquerors.usermanagementsystem.controller;

import com.conquerors.usermanagementsystem.dao.UserDao;
import com.conquerors.usermanagementsystem.model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class RecoverPassword extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        UserDao userDao = new UserDao();
        HttpSession session = request.getSession();
        
        String phone = request.getParameter("phone");
        
        User user = new User();
        user.setPhone(phone);
        
        try {
            int result = userDao.recoverPassword(user);
            if (result != 0) {
                session.setAttribute("msg", "For the fact that we can't afford OTP-Verification, we assume that it is you who want to recover your password. <br><br> <strong>Your password is:<strong> ");
                
            } else {
                session.setAttribute("msg", "Oops! No user with that exists.");
            }
            response.sendRedirect("help.jsp");      
        } catch (Exception ex) {
            Logger.getLogger(RecoverPassword.class.getName()).log(Level.SEVERE, null, ex);
        }
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
