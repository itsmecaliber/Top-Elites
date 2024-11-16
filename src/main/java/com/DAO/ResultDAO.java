package com.DAO;

import java.util.List;
import com.entity.ResultDetails;
import com.entity.TournamentDetails;

public interface ResultDAO {

    // Adds a new result
    public boolean addResult(ResultDetails r);
    
    public List<ResultDetails> getAllResults();
    
    public boolean deleteResult(int resultId);

    
}
