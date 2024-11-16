package com.admin.servlet;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import com.DAO.TournamentDAOImpl;
import com.DB.DBConnect;
import com.entity.TournamentDetails;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/edit_tournaments")
public class EditTournamentServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String TournamentName = req.getParameter("tournament_name");
			String tournamentDateString = req.getParameter("tournament_date");
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			LocalDate tournamentDate = LocalDate.parse(tournamentDateString, formatter);
			Double PrizePool = Double.parseDouble(req.getParameter("prize_pool"));
			Double EntryFee = Double.parseDouble(req.getParameter("entry_fee"));
			
			
			TournamentDetails t = new TournamentDetails();
			t.setTournament_id(id);
			t.setTournament_name(TournamentName);
			t.setTournament_date(tournamentDate);
			t.setEntry_fee(EntryFee);
			t.setPrize_pool(PrizePool);
			
			TournamentDAOImpl dao = new TournamentDAOImpl(DBConnect.getConn());
			boolean f = dao.updateEditTournaments(t);
			HttpSession session = req.getSession();
			
			if(f) {
				session.setAttribute("succMsg", "Tournament Updated Successfully");
				resp.sendRedirect("admin/allTournament.jsp");
			}else {
				session.setAttribute("failedMsg", "Something wrong on server");
				resp.sendRedirect("admin/allTournament.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
