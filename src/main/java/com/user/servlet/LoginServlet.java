package com.user.servlet;

import java.io.IOException;
import jakarta.servlet.http.Cookie;
import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
            HttpSession session = req.getSession();
            String email = req.getParameter("email");
            String password = req.getParameter("password");
            
            if ("admin@gmail.com".equals(email) && "admin".equals(password)) {
                // Admin login
                User us = new User();
                session.setAttribute("userobj", us);
                
                // Create and set cookie for admin
                Cookie userCookie = new Cookie("username", email);
                userCookie.setMaxAge(60 * 60 * 24 * 7); // Cookie lasts for 1 day
                userCookie.setPath("/"); // Ensure it's available across the entire web app
                resp.addCookie(userCookie);
                
                resp.sendRedirect("admin/adhome.jsp");
            } else {
                // User login
                User us = dao.login(email, password);
                if (us != null) {
                    session.setAttribute("userobj", us);
                    
                    // Create and set cookie for user
                    Cookie userCookie = new Cookie("username", email);
                    userCookie.setMaxAge(60 * 60 * 24); // Cookie lasts for 1 day
                    userCookie.setPath("/"); // Ensure it's available across the entire web app
                    resp.addCookie(userCookie);
                    
                    resp.sendRedirect("userhome.jsp");
                } else {
                    session.setAttribute("failedMsg", "Email & Password Invalid");
                    resp.sendRedirect("index.jsp");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
