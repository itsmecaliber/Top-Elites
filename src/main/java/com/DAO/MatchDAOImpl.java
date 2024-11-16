package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.entity.MatchDetails;

public class MatchDAOImpl implements MatchDAO {
    private Connection conn;
    
    public MatchDAOImpl(Connection conn) {
        this.conn = conn;
    }

    @Override
    public boolean uploadMatchDetails(MatchDetails d) {
        boolean f = false;
        try {
        	 String checkSql = "SELECT COUNT(*) FROM tournaments WHERE tournament_id = ?";
             PreparedStatement checkPs = conn.prepareStatement(checkSql);
             checkPs.setInt(1, d.getTournamentId());
             ResultSet rs = checkPs.executeQuery();
        	
             if (rs.next() && rs.getInt(1) > 0) {
            	 String sql = "INSERT INTO match_details (tournament_id, room_id, password, stream_link) VALUES (?, ?, ?, ?)";
                 PreparedStatement ps = conn.prepareStatement(sql);
                 ps.setInt(1, d.getTournamentId());
                 ps.setInt(2, d.getRoomId());
                 ps.setString(3, d.getPassword());
                 ps.setString(4, d.getStreamLink());

                 int i = ps.executeUpdate();
                 if (i == 1) {
                     f = true;
                 }
             }else {
                 System.out.println("Tournament ID does not exist.");
             }
        }
             catch (SQLException e) {
                 e.printStackTrace();
             } catch (Exception e) {
                 e.printStackTrace();
             } finally {
                 // Close the connection as shown earlier
             }
             return f;
           
       
    }
}
