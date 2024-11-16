package com.admin.servlet;

import java.io.IOException;
import com.DAO.StreamDAOImpl;
import com.DB.DBConnect;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/deleteStream")
public class DeleteStreamServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));

            StreamDAOImpl dao = new StreamDAOImpl(DBConnect.getConn());
            boolean f = dao.deleteStream(id);
            HttpSession session = req.getSession();

            if (f) {
                session.setAttribute("succMsg", "Stream Deleted Successfully");
            } else {
                session.setAttribute("failedMsg", "Something went wrong on the server");
            }
            resp.sendRedirect("admin/allStreams.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
