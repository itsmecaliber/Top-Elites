package com.user.servlet;

import java.io.IOException;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			
			//System.out.println(name+" "+email+" "+password);
			
			User us = new User();
			us.setName(name);
			us.setEmail(email);
			us.setPassword(password);
			
			HttpSession session = req.getSession();
			
			UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
			boolean f = dao.userRegister(us);
			if(f) {
				//System.out.println("User Register Success");
				session.setAttribute("succMsg", "Signup Successful");
				resp.sendRedirect("login.jsp");
			}
			else {
				//System.out.println("Something wrong in server");
				session.setAttribute("failMsg", "Signup Failed");
				resp.sendRedirect("signup.jsp");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
}
