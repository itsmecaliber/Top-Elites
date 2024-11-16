package com.user.servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.DAO.TeamDAOImpl;
import com.DB.DBConnect;
import com.entity.TeamDetails;

@WebServlet("/add_team")
public class TeamsAdd extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String TeamName = req.getParameter("teamName");
            String LeaderName = req.getParameter("leaderName");
            String LeaderEmail = req.getParameter("leaderEmail");
            String Player1IGN = req.getParameter("player1IGN");
            String Player2IGN = req.getParameter("player2IGN");
            String Player3IGN = req.getParameter("player3IGN");
            String Player4IGN = req.getParameter("player4IGN");
            int tournamentId = Integer.parseInt(req.getParameter("tournamentId"));
            
            TeamDAOImpl dao = new TeamDAOImpl(DBConnect.getConn());

            // Check if the number of registered teams is less than 16
            int teamCount = dao.getRegisteredTeamCount(tournamentId);
            
            HttpSession session = req.getSession();
            if (teamCount >= 16) {
                // If there are already 16 teams, display a message
                session.setAttribute("failedMsg", "The tournament has reached the maximum number of teams (16).");
                resp.sendRedirect("registerTournament.jsp");
                return;  // Prevent further execution
            }

            // Proceed with team registration if there is space
            TeamDetails td = new TeamDetails(TeamName, LeaderName, LeaderEmail, Player1IGN, Player2IGN, Player3IGN, Player4IGN, tournamentId);
            boolean f = dao.addTeam(td);

            if (f) {
                session.setAttribute("succMsg", "Team Registered Successfully");
            } else {
                session.setAttribute("failedMsg", "Something went wrong on the server");
            }

            resp.sendRedirect("registerTournament.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            req.getSession().setAttribute("failedMsg", "Server Error: Unable to upload team details.");
            resp.sendRedirect("registerTournament.jsp");
        }

        System.out.println("Tournament ID: " + req.getParameter("tournamentId"));
    }
}
