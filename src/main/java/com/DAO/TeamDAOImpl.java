package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.TeamDetails;

public class TeamDAOImpl implements TeamDAO{
	
	private Connection conn;
	
	
	

	public TeamDAOImpl(Connection conn) {
		this.conn = conn;
	}
	
	public int getRegisteredTeamCount(int tournamentId) {
	    int count = 0;
	    String query = "SELECT COUNT(*) FROM team_details WHERE tournament_id = ?";
	    try (PreparedStatement ps = conn.prepareStatement(query)) {
	        ps.setInt(1, tournamentId);
	        ResultSet rs = ps.executeQuery();
	        if (rs.next()) {
	            count = rs.getInt(1);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return count;
	}


	@Override
	public boolean addTeam(TeamDetails td) {
		boolean f = false;
		try {
			 String checkSql = "SELECT COUNT(*) FROM tournaments WHERE tournament_id = ?";
             PreparedStatement checkPs = conn.prepareStatement(checkSql);
             checkPs.setInt(1, td.getTournamentId());
             ResultSet rs = checkPs.executeQuery();
			
             if (rs.next() && rs.getInt(1) > 0) {
            	 
            	String sql = "insert into team_details(team_name, team_leader, leader_email, player1_ign, player2_ign, player3_ign, player4_ign, tournament_id) values(?, ?, ?, ?, ?, ?, ?, ?)";
     			PreparedStatement ps = conn.prepareStatement(sql);
     			ps.setString(1, td.getTeam_name());
     			ps.setString(2, td.getTeam_leader());
     			ps.setString(3, td.getLeader_email());
     			ps.setString(4, td.getPlayer1_ign());
     			ps.setString(5, td.getPlayer2_ign());
     			ps.setString(6, td.getPlayer3_ign());
     			ps.setString(7, td.getPlayer4_ign());
     			ps.setInt(8, td.getTournamentId());
     			
     			int  i = ps.executeUpdate();
     			if(i == 1) {
     				f = true;
     			}	 
             }else {
            	 System.out.println("Tournament ID does not exist");
             }
			
		} catch (SQLException e) {
			e.printStackTrace();
		}catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close the connection as shown earlier
        }
		
		
		return f;
	}
	public List<String> getTeamLeadersEmails(int tournamentId) {
	    List<String> emails = new ArrayList<>();
	    try {
	        String query = "SELECT leader_email FROM team_details WHERE tournament_id = ?";
	        PreparedStatement pstmt = conn.prepareStatement(query);
	        pstmt.setInt(1, tournamentId);

	        ResultSet rs = pstmt.executeQuery();
	        while (rs.next()) {
	            emails.add(rs.getString("leader_email"));
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return emails;
	}

		
	
}
