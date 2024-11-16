package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.ResultDetails;
import com.entity.TournamentDetails;

public class ResultDAOImpl implements ResultDAO {

    private Connection conn;

    public ResultDAOImpl(Connection conn) {
        this.conn = conn;
    }
    
    public boolean deleteResult(int resultId) {
        boolean f = false;
        try {
            String query = "DELETE FROM result_details WHERE result_id=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, resultId);
            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }


    @Override
    public boolean addResult(ResultDetails r) {
        boolean success = false;
        String sql = "INSERT INTO result_details(tournament_name, result_file) VALUES(?, ?)";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, r.getTournament_name());
            ps.setString(2, r.getResult_file());

            int affectedRows = ps.executeUpdate();
            success = (affectedRows == 1);
        } catch (Exception e) {
            e.printStackTrace(); // Use a logging framework instead
        }

        return success;
    }
    
    
    @Override
	public List<ResultDetails> getAllResults() {
		
		List<ResultDetails> list = new ArrayList<ResultDetails>();
		ResultDetails r = null;
		try {
			String sql = "select * from result_details";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				r = new ResultDetails();
				r.setResult_id(rs.getInt(1));
				r.setTournament_name(rs.getString(2));
				r.setResultFile(rs.getString(3));
				list.add(r);
				
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}

    // You can add more methods here for retrieving results as needed
}
