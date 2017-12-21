package com.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import com.Exception.DataLayerException;
import com.bean.DBUtil;

public class LoginDAO {
	Connection connection = null;
	PreparedStatement preparedStatement = null;
	ResultSet resultSet = null;

	/*
	 * Method to Validate a Login User , it returns the Role and Last Login_Time
	 * of the user
	 */
	public Map<String, String> userLogin(String username, String password,
			String type) throws DataLayerException {
		
		
		Map<String, String> lastLoginTime = new HashMap<String, String>();
		
		try{connection = DBUtil.getConnection();
		PreparedStatement preparedStatement = connection
				.prepareStatement("select * from LoginTable where Username=? and Password=? and Role=?");
		preparedStatement.setString(1, username);
		preparedStatement.setString(2, password);
		preparedStatement.setString(3, type);
		ResultSet resultSet = preparedStatement.executeQuery();
		while (resultSet.next()) {
			
			Date date = resultSet.getDate(3);
			
			lastLoginTime.put(date + "", resultSet.getString(1));
		}
		DBUtil.closeConnection(connection);
		preparedStatement.close();
			}
	    	catch(SQLException |ClassNotFoundException e)
	    	{
	    		throw new DataLayerException(e.getMessage());
	    	}
	
		return lastLoginTime;
	}

	/*
	 * Method to update the Logout time in Login_Time field of the UserStore
	 * Table
	 */
	public boolean userLogout(java.util.Date loginTime)
			throws DataLayerException {
		java.sql.Date sqlDate = new java.sql.Date(loginTime.getTime());
		
		try{connection = DBUtil.getConnection();
		preparedStatement = connection
				.prepareStatement("update UserStore set (Login_Time=(select current_date from dual)) where (Login_Time = ?)");
		preparedStatement.setDate(1, sqlDate);
		int flag = preparedStatement.executeUpdate();
		if (flag > 0) {
			return true;
		}
			}
	    	catch(SQLException |ClassNotFoundException e)
	    	{
	    		throw new DataLayerException(e.getMessage());
	    	}
		return false;
	}

	public String getRole(String username, String password)
			throws DataLayerException {
		String role = null;
		
		try{connection = DBUtil.getConnection();
		preparedStatement = connection
				.prepareStatement("select Role from LoginTable where Username=? and Password=?");
		preparedStatement.setString(1, username);
		preparedStatement.setString(2, password);
		resultSet = preparedStatement.executeQuery();
		while (resultSet.next()) {
			role = resultSet.getString(1);
			
		}
			}
	    	catch(SQLException |ClassNotFoundException e)
	    	{
	    		throw new DataLayerException(e.getMessage());
	    	}
		return role;
	}
}
