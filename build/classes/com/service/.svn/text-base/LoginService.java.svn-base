package com.service;

import java.sql.SQLException;
import java.util.Map;

import com.Exception.DataLayerException;
import com.Exception.ServiceLayerException;
import com.dao.LoginDAO;

public class LoginService {

	LoginDAO loginDAO = new LoginDAO();

	/* Method to Connect LoginService to LoginDAO.*/
	public Map<String, String> userLogin(String username, String password, String type) throws ServiceLayerException {
		// TODO Auto-generated method stub

		try{
			return loginDAO.userLogin(username, password,type);
		}catch(DataLayerException e)
		{
			throw new ServiceLayerException(e.getMessage());
		}
	}


	/* Method to Connect LoginService to LoginDAO */
	public boolean userLogout(java.util.Date loginTime) throws ServiceLayerException{

		try{
			return loginDAO.userLogout(loginTime);
		}catch(DataLayerException e)
		{
			throw new ServiceLayerException(e.getMessage());
		}
	}

	public String getRole(String username, String password) throws ServiceLayerException {


		try{
			return loginDAO.getRole(username,password);
		}catch(DataLayerException e)
		{
			throw new ServiceLayerException(e.getMessage());
		}
	}
}



