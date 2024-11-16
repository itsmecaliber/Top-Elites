package com.user.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/logoutUser")
public class LogoutUserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Remove the session attribute for user (user details)
            HttpSession session = req.getSession();
            session.removeAttribute("userobj");

            // Expire the "username" cookie by setting its Max-Age to 0
            Cookie userCookie = new Cookie("username", "");
            userCookie.setMaxAge(0); // Expire the cookie immediately
            userCookie.setPath("/"); // Ensure it's deleted across the entire web app
            resp.addCookie(userCookie);

            // Optionally, you can add a logout success message here
            session.setAttribute("succMsg", "Logout Successfully");

            // Redirect to the login page after logout
            resp.sendRedirect("login.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
