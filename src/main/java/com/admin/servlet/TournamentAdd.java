package com.admin.servlet;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import com.DAO.TournamentDAOImpl;
import com.DB.DBConnect;
import com.entity.TournamentDetails;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/add_tournaments")
@MultipartConfig

public class TournamentAdd extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String TournamentName = req.getParameter("tournament_name");
			String tournamentDateString = req.getParameter("tournament_date");
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			LocalDate tournamentDate = LocalDate.parse(tournamentDateString, formatter);
			Double PrizePool = Double.parseDouble(req.getParameter("prize_pool"));
			Double EntryFee = Double.parseDouble(req.getParameter("entry_fee"));
			Part part = req.getPart("logo");
			String fileName = part.getSubmittedFileName();
			
			TournamentDetails t = new TournamentDetails(TournamentName, tournamentDate, EntryFee, PrizePool, fileName);
			
			TournamentDAOImpl dao = new TournamentDAOImpl(DBConnect.getConn());
			
			
			boolean f = dao.addTournament(t);
			HttpSession session = req.getSession();
			if(f == true) {
				
				String path = getServletContext().getRealPath("") + "tournament-logo";
				
				File file = new File(path);
				part.write(path+File.separator+fileName);
				
				
				session.setAttribute("succMsg", "Tournament Added Successfully");
				resp.sendRedirect("admin/addTournament.jsp");
			}else {
				session.setAttribute("failedMsg", "Something Wrong on server");
				resp.sendRedirect("admin/addTournament.jsp");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
