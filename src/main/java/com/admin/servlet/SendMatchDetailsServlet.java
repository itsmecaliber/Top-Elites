package com.admin.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.DAO.MatchDAOImpl;
import com.DB.DBConnect;
import com.entity.MatchDetails;
import com.concepts.email.GEmailSender;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/matchdetail")
public class SendMatchDetailsServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int tournamentId = Integer.parseInt(req.getParameter("tournamentId"));
            int roomId = Integer.parseInt(req.getParameter("roomId"));
            String password = req.getParameter("password");
            String streamLink = req.getParameter("streamLink");

            MatchDetails matchDetails = new MatchDetails(tournamentId, roomId, password, streamLink);
            MatchDAOImpl matchDAO = new MatchDAOImpl(DBConnect.getConn());
            HttpSession session = req.getSession();

            // Insert match details into the database
            boolean uploadSuccess = matchDAO.uploadMatchDetails(matchDetails);

            if (uploadSuccess) {
                // Once the match details are uploaded, send emails to team leaders
                boolean emailSent = sendMatchDetailsEmail(tournamentId);
                if (emailSent) {
                    session.setAttribute("succMsg", "Match Details Uploaded and Emails Sent Successfully");
                } else {
                    session.setAttribute("failedMsg", "Match Details Uploaded, but failed to send some emails.");
                }
            } else {
                session.setAttribute("failedMsg", "Failed to upload match details.");
            }
            resp.sendRedirect("admin/allTournament.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            req.getSession().setAttribute("failedMsg", "Server Error: Unable to upload match details.");
            resp.sendRedirect("admin/allTournament.jsp");
        }
    }

    private boolean sendMatchDetailsEmail(int tournamentId) {
        boolean emailSentAny = false;

        try (Connection connection = DBConnect.getConn()) {
            // Query to get the latest match ID for the given tournament ID
            String getLatestMatchIdSql = "SELECT match_id FROM match_details WHERE tournament_id = ? ORDER BY match_id DESC LIMIT 1";
            int latestMatchId = -1;

            try (PreparedStatement ps = connection.prepareStatement(getLatestMatchIdSql)) {
                ps.setInt(1, tournamentId);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    latestMatchId = rs.getInt("match_id");
                }
            }

            // If no match ID is found, abort the email process
            if (latestMatchId == -1) {
                System.out.println("No match ID found for tournamentId " + tournamentId + ". Aborting email process.");
                return false;
            }

            // Query to get leader emails and match details
            String sql = "SELECT td.leader_email, md.room_id, md.password, md.stream_link " +
                         "FROM team_details td " +
                         "JOIN match_details md ON td.tournament_id = md.tournament_id " +
                         "WHERE md.match_id = ? AND md.tournament_id = ?";

            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setInt(1, latestMatchId);
                ps.setInt(2, tournamentId);
                ResultSet rs = ps.executeQuery();

                // Send email to each team leader
                while (rs.next()) {
                    String leaderEmail = rs.getString("leader_email");
                    String roomId = rs.getString("room_id");
                    String matchPassword = rs.getString("password");
                    String streamLink = rs.getString("stream_link");

                    String subject = "Match Details for Match ID: " + latestMatchId;
                    String messageText = "Hello,\n\nHere are your match details:\n" +
                            "Room ID: " + roomId + "\n" +
                            "Password: " + matchPassword + "\n" +
                            "Stream Link: " + streamLink + "\n\nGood luck!";

                    GEmailSender gEmailSender = new GEmailSender();
                    boolean emailSent = gEmailSender.sendEmail(leaderEmail, "7488180857jeet@gmail.com", subject, messageText);

                    if (emailSent) {
                        System.out.println("Email sent successfully to " + leaderEmail);
                        emailSentAny = true;
                    } else {
                        System.out.println("Failed to send email to " + leaderEmail);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return emailSentAny;
    }
}
