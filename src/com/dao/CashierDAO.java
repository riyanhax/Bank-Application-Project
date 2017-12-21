package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.Exception.DataLayerException;
import com.bean.DBUtil;

public class CashierDAO {

	/* Deposit Amount into one Account in Account Table.  */
	public boolean DepositAmount(long AccountId,double Balance) 
	{
		int result=0;
		Connection connection;
		try {
			connection = DBUtil.getConnection();
			PreparedStatement preparedStatement=connection.prepareStatement("update Account set Balance=Balance+? where Account_ID=?");
			preparedStatement.setDouble(1, Balance);
			preparedStatement.setLong(2, AccountId);

			result= preparedStatement.executeUpdate();
			DBUtil.closeConnection(connection);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return result>0;
	}

	/* Withdraw amount from one Account in Account Table. */
	public boolean WithDrawAmount(long AccountId,double Balance) 
	{
		int result=0;
	
			Connection connection;
			try {
				connection = DBUtil.getConnection();
				PreparedStatement preparedStatement=connection.prepareStatement("update Account set Balance=Balance-? where Account_ID=?");
				preparedStatement.setDouble(1, Balance);
				preparedStatement.setLong(2, AccountId);
				result= preparedStatement.executeUpdate();
				DBUtil.closeConnection(connection);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		

		return result>0;
	}

	/*Transfer Amount from one Account to another Account in Account Table.*/
	public boolean TransferAmount(long fromCustomerId,long toCustomerId,double Balance)
	{
		
			boolean flag = WithDrawAmount(fromCustomerId, Balance);
			boolean flag1 = DepositAmount(toCustomerId, Balance);
			if(flag & flag1){
				return true;
			}
	

		return false;
	}



}
