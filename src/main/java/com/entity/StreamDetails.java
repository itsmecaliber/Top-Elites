package com.entity;

public class StreamDetails {
    private int stream_id;         // Unique identifier for the stream
    private String tournament_name; // Name of the tournament
    private String stream_link;     // URL of the stream link

    // Default constructor
    public StreamDetails() {
        super();
    }

    // Parameterized constructor
    public StreamDetails(String tournament_name, String stream_link) {
        super();
        this.tournament_name = tournament_name;
        this.stream_link = stream_link;
        
    }

    // Getters and Setters
    public int getStream_id() {
        return stream_id;
    }

    public void setStream_id(int stream_id) {
        this.stream_id = stream_id;
    }

    public String getTournament_name() {
        return tournament_name;
    }

    public void setTournament_name(String tournament_name) {
        this.tournament_name = tournament_name;
    }

    public String getStream_link() {
        return stream_link;
    }

    public void setStream_link(String stream_link) {
        this.stream_link = stream_link;
    }

    // Override toString method
    @Override
    public String toString() {
        return "StreamDetails [stream_id=" + stream_id + ", tournament_name=" + tournament_name +
               ", stream_link=" + stream_link + "]";
    }
}
