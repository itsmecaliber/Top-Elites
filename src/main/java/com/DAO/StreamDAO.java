package com.DAO;

import java.util.List;

import com.entity.StreamDetails;

public interface StreamDAO {
	
	public boolean addStream(StreamDetails streamDetails);
	
	public List<StreamDetails> getAllStreams();
	
	public boolean deleteStream(int id);
	
}
