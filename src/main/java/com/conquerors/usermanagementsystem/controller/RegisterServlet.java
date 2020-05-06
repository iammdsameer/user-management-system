/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.conquerors.usermanagementsystem.controller;

import com.conquerors.usermanagementsystem.dao.UserDao;
import com.conquerors.usermanagementsystem.model.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author iammd
 */
public class RegisterServlet extends HttpServlet {

    private UserDao userDao = new UserDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone_number");
        String firstName = request.getParameter("first_name");
        String lastName = request.getParameter("last_name");

        User user = new User();

        user.setEmail(email);
        user.setUsername(username);
        user.setPassword(password);
        user.setPhone(phone);
        user.setFirst_name(firstName);
        user.setLast_name(lastName);
        
        try {
            userDao.register(user);
            response.sendRedirect("profile/dashboard.jsp");
        } catch (Exception e) {
            // This will redirect user to the registration page telling that account was not created.
            session.setAttribute("error", "A user with your information already exists.");
            response.sendRedirect("index.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
