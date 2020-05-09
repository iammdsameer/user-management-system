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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author iammd
 */
public class AdminScope extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
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
        String birthDate = request.getParameter("birth_date");
        int is_admin = Integer.parseInt(request.getParameter("is_admin"));

        User user = new User();

        user.setEmail(email.toLowerCase());
        user.setUsername(username.toLowerCase());
        user.setPassword(password);
        user.setPhone(phone);
        user.setFirst_name(firstName.toLowerCase());
        user.setLast_name(lastName.toLowerCase());
        user.setBirth_date(birthDate);
        user.setIsAdmin(is_admin);

        try {
            int isSuccess = userDao.register(user);
            if (isSuccess != 0) {
                session.setAttribute("registered", "Your account has been registered. <br> Login to continue.");
            } else {
                // This will redirect user to the registration page telling that account was not created.
                session.setAttribute("error", "A user with your information already exists.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("profile/portal.jsp");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
