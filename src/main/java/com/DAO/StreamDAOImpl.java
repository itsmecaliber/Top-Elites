package com.DAO;

import com.entity.StreamDetails;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StreamDAOImpl implements StreamDAO {
    private Connection conn;

    public StreamDAOImpl(Connection connection) {
        this.conn = connection;
    }
    
    public boolean deleteStream(int id) {
        boolean f = false;
        try {
            String query = "DELETE FROM stream_details WHERE stream_id=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, id);
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
    public boolean addStream(StreamDetails streamDetails) {
        String query = "INSERT INTO stream_details (tournament_name, stream_link) VALUES (?, ?)";
        try (PreparedStatement preparedStatement = conn.prepareStatement(query)) {
            preparedStatement.setString(1, streamDetails.getTournament_name());
            preparedStatement.setString(2, streamDetails.getStream_link());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public List<StreamDetails> getAllStreams() {
        List<StreamDetails> list = new ArrayList<>();
        StreamDetails stream;

        try {
            String sql = "SELECT * FROM stream_details"; // Adjust the table name if necessary
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                stream = new StreamDetails();
                stream.setStream_id(rs.getInt("stream_id"));
                stream.setTournament_name(rs.getString("tournament_name")); // Match the column names to your DB
                stream.setStream_link(convertToEmbedURL(rs.getString("stream_link"))); // Convert URL to embeddable
                list.add(stream);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // Method to convert YouTube URL to embedded format
    private String convertToEmbedURL(String url) {
        if (url.contains("youtube.com/watch?v=")) {
            String videoId = url.substring(url.indexOf("v=") + 2);
            int ampersandPosition = videoId.indexOf("&"); // Handle additional parameters
            if (ampersandPosition != -1) {
                videoId = videoId.substring(0, ampersandPosition);
            }
            return "https://www.youtube.com/embed/" + videoId;
        }
        // Return the original URL if it's not a YouTube link
        return url;
    }
}
