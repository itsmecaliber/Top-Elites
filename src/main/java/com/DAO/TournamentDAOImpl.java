package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.TournamentDetails;

public class TournamentDAOImpl implements TournamentDAO{
	
	private Connection conn;

	@Override
	public List<TournamentDetails> getAllTournaments() {
		
		List<TournamentDetails> list = new ArrayList<TournamentDetails>();
		TournamentDetails t = null;
		try {
			String sql = "select * from tournaments";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				t = new TournamentDetails();
				t.setTournament_id(rs.getInt(1));
				t.setTournament_name(rs.getString(2));
				t.setTournament_date(rs.getDate(3).toLocalDate());
				t.setEntry_fee(rs.getDouble(4));
				t.setPrize_pool(rs.getDouble(5));
				t.setLogo(rs.getString(6));
				list.add(t);
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}

	@Override
	public boolean addTournament(TournamentDetails t) {
		boolean f = false;
		try {
			String sql = "Insert into tournaments(tournament_name, tournament_date, entry_fee, prize_pool, logo) values(?, ?, ?, ?, ?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, t.getTournament_name());
			ps.setDate(2, java.sql.Date.valueOf(t.getTournament_date()));
			ps.setDouble(3, t.getEntry_fee());
			ps.setDouble(4, t.getPrize_pool());
			ps.setString(5, t.getLogo());
			
			int i = ps.executeUpdate();
			if(i == 1) {
				f = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}

	public TournamentDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean updateEditTournaments(TournamentDetails t) {
		
		boolean f = false;
		
		try {
			String sql = "update tournaments set tournament_name=?, tournament_date=?, entry_fee=?, prize_pool=? where tournament_id =?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, t.getTournament_name());
			ps.setDate(2, java.sql.Date.valueOf(t.getTournament_date()));
			ps.setDouble(3, t.getEntry_fee());
			ps.setDouble(4, t.getPrize_pool());
			ps.setInt(5, t.getTournament_id());
			
			int i = ps.executeUpdate();
			if(i==1) {
				f = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return f;
	}
	
	@Override
	public TournamentDetails getNewTournament() {
	    TournamentDetails tournament = null;

	    try {
	        String sql = "SELECT * FROM tournaments ORDER BY tournament_date DESC LIMIT 1";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {
	            tournament = new TournamentDetails();
	            tournament.setTournament_id(rs.getInt("tournament_id"));
	            tournament.setTournament_name(rs.getString("tournament_name"));
	            tournament.setTournament_date(rs.getDate("tournament_date").toLocalDate());
	            tournament.setEntry_fee(rs.getDouble("entry_fee"));
	            tournament.setPrize_pool(rs.getDouble("prize_pool"));
	            tournament.setLogo(rs.getString("logo"));
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return tournament;
	}


	/*@Override
	public List<TournamentDetails> getNewTournament() {
		
		List<TournamentDetails> list = new ArrayList<TournamentDetails>();
		TournamentDetails t = null;
		try {
			String sql = "select * from tournaments where tournament_id=? and tournament_name=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,"ID");
			ps.setString(2,"Name");
			ResultSet rs = ps.executeQuery();
			int i=1;
			while(rs.next()) {
				t = new TournamentDetails();
				
			}
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}*/

	@Override
	public boolean deleteTournaments(int id) {
		boolean f = false;
		
		try {
			String sql = "delete from tournaments where tournament_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i = ps.executeUpdate();
			if(i==1) {
				f = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}

	@Override
	public TournamentDetails getTournamentById(int id) {
		
		TournamentDetails t = null;
		try {
			String sql = "select * from tournaments where tournament_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql); 
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				t = new TournamentDetails();
				t.setTournament_id(rs.getInt(1));
				t.setTournament_name(rs.getString(2));
				t.setTournament_date(rs.getDate(3).toLocalDate());
				t.setEntry_fee(rs.getDouble(4));
				t.setPrize_pool(rs.getDouble(5));
				t.setLogo(rs.getString(6));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return t;
	}
	
	
	
	
	
}
