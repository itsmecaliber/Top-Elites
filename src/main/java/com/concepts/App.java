package com.concepts;

import com.concepts.email.GEmailSender;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class App {
    public static void main(String[] args) {
        // Check if tournament ID is passed as an argument; if not, fetch from the database
        int tournamentId;

        if (args.length > 0) {
            // Use tournamentId from command-line argument
            tournamentId = Integer.parseInt(args[0]);
            System.out.println("Using tournament ID from argument: " + tournamentId);
        } else {
            // Fetch a valid tournamentId from the database
            tournamentId = fetchFirstAvailableTournamentId();
            if (tournamentId == -1) {
                System.out.println("No tournament IDs found in the database.");
                return;
            }
            System.out.println("Fetched tournament ID from database: " + tournamentId);
        }

        // Call method to fetch match details and send email
        sendMatchDetailsEmail(tournamentId);
    }

    // Method to fetch the first available tournament ID from the database
    public static int fetchFirstAvailableTournamentId() {
        int tournamentId = -1;
        String dbUrl = "jdbc:mysql://localhost:3306/top-elites";  // Replace with your DB URL
        String dbUsername = "root";   // Replace with your DB username
        String dbPassword = "jeet";   // Replace with your DB password

        try (Connection connection = DriverManager.getConnection(dbUrl, dbUsername, dbPassword)) {
            String sql = "SELECT tournament_id FROM match_details ORDER BY tournament_id DESC LIMIT 1"; // Fetch the latest tournament ID
            try (PreparedStatement ps = connection.prepareStatement(sql);
                 ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {
                    tournamentId = rs.getInt("tournament_id");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return tournamentId;
    }

    public static void sendMatchDetailsEmail(int tournamentId) {
        String dbUrl = "jdbc:mysql://localhost:3306/top-elites";
        String dbUsername = "root";
        String dbPassword = "jeet";

        try (Connection connection = DriverManager.getConnection(dbUrl, dbUsername, dbPassword)) {
            // SQL query to get all leader emails and match details for the given tournament ID
            String sql = "SELECT td.leader_email, md.room_id, md.password, md.stream_link " +
                         "FROM team_details td " +
                         "JOIN match_details md ON td.tournament_id = md.tournament_id " +
                         "WHERE md.tournament_id = ?";

            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setInt(1, tournamentId);
                ResultSet rs = ps.executeQuery();

                boolean emailSentAny = false; // Flag to check if any email was sent

                // Loop through each result and send emails to all team leaders
                while (rs.next()) {
                    String leaderEmail = rs.getString("leader_email");
                    String roomId = rs.getString("room_id");
                    String matchPassword = rs.getString("password");
                    String streamLink = rs.getString("stream_link");

                    String subject = "Match Details for Tournament ID: " + tournamentId;
                    String messageText = "Hello,\n\nHere are your match details:\n" +
                            "Room ID: " + roomId + "\n" +
                            "Password: " + matchPassword + "\n" +
                            "Stream Link: " + streamLink + "\n\nGood luck!";

                    GEmailSender gEmailSender = new GEmailSender();
                    boolean emailSent = gEmailSender.sendEmail(leaderEmail, "7488180857jeet@gmail.com", subject, messageText);

                    if (emailSent) {
                        System.out.println("Email sent successfully to " + leaderEmail);
                        emailSentAny = true; // At least one email sent successfully
                    } else {
                        System.out.println("Failed to send email to " + leaderEmail);
                    }
                }

                if (!emailSentAny) {
                    System.out.println("No match details found for the provided tournament ID.");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
