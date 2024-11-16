package com.DAO;

import java.util.List;

import com.entity.TeamDetails;

public interface TeamDAO {
	
	
	public boolean addTeam(TeamDetails td);
	
	public List<String> getTeamLeadersEmails(int tournamentId); 
	
	public int getRegisteredTeamCount(int tournamentId);
	
}
