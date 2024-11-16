package com.DAO;

import java.util.List;

import com.entity.TournamentDetails;

public interface TournamentDAO {

	public boolean addTournament(TournamentDetails t);
		
	public List<TournamentDetails> getAllTournaments();
	
	public TournamentDetails getTournamentById(int id);
	
	public boolean updateEditTournaments(TournamentDetails t);
	
	public boolean deleteTournaments(int id);
	
	//public List<TournamentDetails> getNewTournament();
	
	public TournamentDetails getNewTournament();
	
	
	

	
}
