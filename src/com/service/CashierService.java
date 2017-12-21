package com.service;

import java.sql.SQLException;

import com.Exception.DataLayerException;
import com.Exception.ServiceLayerException;
import com.dao.CashierDAO;

public class CashierService {
	CashierDAO cashierDAO=new CashierDAO();
	public boolean DepositAmount(long AccountId,double Balance) 
	{
		
	
			return cashierDAO.DepositAmount(AccountId, Balance);
		
	}
	public boolean WithDrawAmount(long AccountId,double Balance) 
	{
		
		
				return cashierDAO.WithDrawAmount(AccountId, Balance);
			
	}
	public boolean TransferAmount(long fromCustomerId,long toCustomerId,double Balance)
	{
		
	
			return cashierDAO.TransferAmount(fromCustomerId, toCustomerId, Balance);
		
	}
	
}

