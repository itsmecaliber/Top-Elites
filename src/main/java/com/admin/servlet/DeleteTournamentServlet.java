package com.admin.servlet;

import java.io.IOException;

import com.DAO.TournamentDAOImpl;
import com.DB.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/delete")
public class DeleteTournamentServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));

			TournamentDAOImpl dao = new TournamentDAOImpl(DBConnect.getConn());
			boolean f = dao.deleteTournaments(id);
			HttpSession session = req.getSession();

			if (f) {
				session.setAttribute("succMsg", "Tournament Deleted Successfully");
				resp.sendRedirect("admin/allTournament.jsp");
			} else {
				session.setAttribute("failedMsg", "Something wrong on server");
				resp.sendRedirect("admin/allTournament.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
