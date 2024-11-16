package com.admin.servlet;

import java.io.IOException;
import com.DAO.ResultDAOImpl;
import com.DB.DBConnect;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/deleteResult")
public class DeleteResultServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int resultId = Integer.parseInt(req.getParameter("id"));

            ResultDAOImpl dao = new ResultDAOImpl(DBConnect.getConn());
            boolean f = dao.deleteResult(resultId);
            HttpSession session = req.getSession();

            if (f) {
                session.setAttribute("succMsg", "Result Deleted Successfully");
            } else {
                session.setAttribute("failedMsg", "Something went wrong on the server");
            }
            resp.sendRedirect("admin/allResults.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
