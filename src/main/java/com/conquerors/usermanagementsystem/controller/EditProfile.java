package com.conquerors.usermanagementsystem.controller;

import com.conquerors.usermanagementsystem.dao.UserDao;
import com.conquerors.usermanagementsystem.model.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class EditProfile extends HttpServlet {
    
    private UserDao userDao = new UserDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(); 
        
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String firstName = request.getParameter("first_name");
        String lastName = request.getParameter("last_name");
        String birthDate = request.getParameter("birth_date");
        String id = request.getParameter("id");

        User user = new User();

        user.setEmail(email.toLowerCase());
        user.setUsername(username.toLowerCase());
        user.setPassword(password);
        user.setPhone(phone);
        user.setFirst_name(firstName.toLowerCase());
        user.setLast_name(lastName.toLowerCase());
        user.setBirth_date(birthDate);
        user.setId(Integer.parseInt(id));
        
        try {
            int isSuccess = userDao.makeChanges(user);
            if (isSuccess != 0) {
                session.setAttribute("changesMade", "Your changes has been updated succesfully!");
            } else {
                // This will redirect user to the registration page telling that account was not created.
                session.setAttribute("changesMade", "Oops! Something went wrong.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("profile/me.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
