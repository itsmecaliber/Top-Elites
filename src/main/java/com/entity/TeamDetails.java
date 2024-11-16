package com.entity;

public class TeamDetails {
	private int team_id;
	private String team_name;
	private String team_leader;
	private String leader_email;
	private String player1_ign;
	private String player2_ign;
	private String player3_ign;
	private String player4_ign;
	private int tournamentId;
	
	
	public TeamDetails() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TeamDetails(String team_name, String team_leader, String leader_email, String player1_ign,
			String player2_ign, String player3_ign, String player4_ign, int tournamentId) {
		super();
		this.team_name = team_name;
		this.team_leader = team_leader;
		this.leader_email = leader_email;
		this.player1_ign = player1_ign;
		this.player2_ign = player2_ign;
		this.player3_ign = player3_ign;
		this.player4_ign = player4_ign;
		this.tournamentId = tournamentId;
	}
	public int getTeam_id() {
		return team_id;
	}
	public void setTeam_id(int team_id) {
		this.team_id = team_id;
	}
	public String getTeam_name() {
		return team_name;
	}
	public void setTeam_name(String team_name) {
		this.team_name = team_name;
	}
	public String getTeam_leader() {
		return team_leader;
	}
	public void setTeam_leader(String team_leader) {
		this.team_leader = team_leader;
	}
	public String getLeader_email() {
		return leader_email;
	}
	public void setLeader_email(String leader_email) {
		this.leader_email = leader_email;
	}
	public String getPlayer1_ign() {
		return player1_ign;
	}
	public void setPlayer1_ign(String player1_ign) {
		this.player1_ign = player1_ign;
	}
	public String getPlayer2_ign() {
		return player2_ign;
	}
	public void setPlayer2_ign(String player2_ign) {
		this.player2_ign = player2_ign;
	}
	public String getPlayer3_ign() {
		return player3_ign;
	}
	public void setPlayer3_ign(String player3_ign) {
		this.player3_ign = player3_ign;
	}
	public String getPlayer4_ign() {
		return player4_ign;
	}
	public void setPlayer4_ign(String player4_ign) {
		this.player4_ign = player4_ign;
	}

	public int getTournamentId() {
		return tournamentId;
	}
	public void setTournamentId(int tournamentId) {
		this.tournamentId = tournamentId;
	}
	@Override
	public String toString() {
		return "TeamDetails [team_id=" + team_id + ", team_name=" + team_name + ", team_leader=" + team_leader
				+ ", leader_email=" + leader_email + ", player1_ign=" + player1_ign + ", player2_ign=" + player2_ign
				+ ", player3_ign=" + player3_ign + ", player4_ign=" + player4_ign + ", tournamentId=" + tournamentId + "]";
	}
	
	
}
