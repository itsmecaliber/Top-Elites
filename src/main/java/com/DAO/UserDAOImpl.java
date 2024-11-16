package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;

public class UserDAOImpl implements UserDAO{
	
	private Connection conn;

	public UserDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}
	
	@Override
	public boolean userRegister(User us) {
	    boolean f = false;
	    
	    try {
	        String sql = "insert into user(name, email, password) values(?, ?, ?)";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setString(1, us.getName());
	        ps.setString(2, us.getEmail());
	        ps.setString(3, us.getPassword());
	        
	        int i = ps.executeUpdate();
	        if (i == 1) {
	            f = true; // Successful registration
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
	    return f; // Return the correct value here
	}

	@Override
	public User login(String email, String password) {
		
		User us = null;
		
		try {
			String sql = "select * from user where email=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				us = new User();
				us.setName(rs.getString(1));
				us.setEmail(rs.getString(2));
				us.setPassword(rs.getString(3));
				us.setId(rs.getInt(4));
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return us;
		
	}

	
	
}
