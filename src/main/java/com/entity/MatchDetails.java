package com.entity;

public class MatchDetails {
    private int matchId;          // Unique identifier for the match
    private int tournamentId;     // ID of the tournament the match belongs to
    private int roomId;        // Room ID for the match
    private String password;      // Password for the match room
    private String streamLink;    // Link to the stream of the match
        // Status of the match (e.g., scheduled, ongoing, completed)
    
    // Default constructor
    public MatchDetails() {
        super();
    }

    // Parameterized constructor
    public MatchDetails(int tournamentId, int roomId, String password, String streamLink) {
        super();
        this.tournamentId = tournamentId;
        this.roomId = roomId;
        this.password = password;
        this.streamLink = streamLink;
        
    }

    // Getters and Setters
    public int getMatchId() {
        return matchId;
    }

    public void setMatchId(int matchId) {
        this.matchId = matchId;
    }

    public int getTournamentId() {
        return tournamentId;
    }

    public void setTournamentId(int tournamentId) {
        this.tournamentId = tournamentId;
    }

    public int getRoomId() {
        return roomId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getStreamLink() {
        return streamLink;
    }

    public void setStreamLink(String streamLink) {
        this.streamLink = streamLink;
    }

 

    @Override
    public String toString() {
        return "MatchDetails [matchId=" + matchId + ", tournamentId=" + tournamentId + ", roomId=" + roomId
                + ", password=" + password + ", streamLink=" + streamLink + "]";
    }
}
