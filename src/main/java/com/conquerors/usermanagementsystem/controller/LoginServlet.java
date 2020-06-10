/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.conquerors.usermanagementsystem.controller;

import com.conquerors.usermanagementsystem.ConnectDB;
import com.conquerors.usermanagementsystem.dao.UserDao;
import com.conquerors.usermanagementsystem.model.User;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.time.LocalDate;
import java.time.LocalTime;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class LoginServlet extends HttpServlet {

    private UserDao userDao = new UserDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String nextPage = "";
            HttpSession session = request.getSession(true);

            User checkUser = userDao.login(username, password);
            session.setAttribute("is_admin", 0);

            if (checkUser != null) {
                if (checkUser.getIsBlocked() == 0) {
                    nextPage = "profile/dashboard.jsp";
                    session.setAttribute("isLoggedIn", "true");
                    session.setAttribute("first_name", checkUser.getFirst_name());
                    session.setAttribute("last_name", checkUser.getLast_name());
                    session.setAttribute("email", checkUser.getEmail());
                    session.setAttribute("username", checkUser.getUsername());
                    session.setAttribute("pass", checkUser.getPassword());
                    session.setAttribute("birth_date", checkUser.getBirth_date());
                    session.setAttribute("phone", checkUser.getPhone());
                    session.setAttribute("id", checkUser.getId());
                    session.setAttribute("is_admin", checkUser.getIsAdmin());
                    session.setAttribute("is_blocked", checkUser.getIsBlocked());
                    Connection conn = ConnectDB.getConnection();
                    String sql = "INSERT INTO history(uid, logged_on, logged_at) values(?, ?, ?);";
                    PreparedStatement ps = conn.prepareStatement(sql);
                    ps.setInt(1, checkUser.getId());
                    ps.setObject(2, LocalDate.now());
                    ps.setObject(3, java.sql.Time.valueOf(LocalTime.now()));

                    ps.execute();

                    conn.close();
                    ps.close();
                } else {
                    session.setAttribute("loginuser", "Sorry, you have been blocked by the admin.");
                    nextPage = "login.jsp";
                }

            } else {
                // This will redirect user to the login page telling that account was unable to login.
                session.setAttribute("loginuser", "Re-check your credentials.");
                nextPage = "login.jsp";
            }

            response.sendRedirect(nextPage);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public String getServletInfo() {
        return "It's Login Page";
    }// </editor-fold>

}
