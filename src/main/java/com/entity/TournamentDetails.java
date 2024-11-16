package com.entity;

import java.time.LocalDate;

public class TournamentDetails {
		@Override
	public String toString() {
		return "TournamentDetails [tournament_id=" + tournament_id + ", tournament_name=" + tournament_name
				+ ", tournament_date=" + tournament_date + ", entry_fee=" + entry_fee + ", prize_pool=" + prize_pool
				+ ", logo=" + logo + "]";
	}
		public int getTournament_id() {
		return tournament_id;
	}
	public void setTournament_id(int tournament_id) {
		this.tournament_id = tournament_id;
	}
	public String getTournament_name() {
		return tournament_name;
	}
	public void setTournament_name(String tournament_name) {
		this.tournament_name = tournament_name;
	}
	public LocalDate getTournament_date() {
		return tournament_date;
	}
	public void setTournament_date(LocalDate tournament_date) {
		this.tournament_date = tournament_date;
	}
	public Double getEntry_fee() {
		return entry_fee;
	}
	public void setEntry_fee(Double entry_fee) {
		this.entry_fee = entry_fee;
	}
	public Double getPrize_pool() {
		return prize_pool;
	}
	public void setPrize_pool(Double prize_pool) {
		this.prize_pool = prize_pool;
	}
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
		public TournamentDetails(String tournament_name, LocalDate tournament_date, Double entry_fee, Double prize_pool,
			String logo) {
		super();
		this.tournament_name = tournament_name;
		this.tournament_date = tournament_date;
		this.entry_fee = entry_fee;
		this.prize_pool = prize_pool;
		this.logo = logo;
	}
		private int tournament_id;
		private String tournament_name;
	    private LocalDate tournament_date;
	    private Double entry_fee;
	    private Double prize_pool;
	    private String logo;
		public TournamentDetails() {
			super();
			// TODO Auto-generated constructor stub
		}
}
