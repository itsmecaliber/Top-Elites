package com.entity;

public class ResultDetails {

    private int result_id;
    private String tournament_name;
    private String result_file;

    // Default Constructor
    public ResultDetails() {
        super();
    }

    // Parameterized Constructor
    public ResultDetails( String tournament_name, String result_file) {
        super();
        this.tournament_name = tournament_name;
        this.result_file = result_file;
    }

    // Getters and Setters
    public int getResult_id() {
        return result_id;
    }

    public void setResult_id(int result_id) {
        this.result_id = result_id;
    }

    public String getTournament_name() {
        return tournament_name;
    }

    public void setTournament_name(String tournament_name) {
        this.tournament_name = tournament_name;
    }

    public String getResult_file() {
        return result_file;
    }

    public void setResultFile(String result_file) {
        this.result_file = result_file;  // Corrected assignment
    }

    // toString method for easy debugging
    @Override
    public String toString() {
        return "ResultDetails [result_id=" + result_id + ", tournament_name=" + tournament_name + ", result_file=" + result_file + "]";
    }
}
