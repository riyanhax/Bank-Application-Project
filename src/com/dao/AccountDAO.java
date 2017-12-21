package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.Exception.DataLayerException;
import com.bean.Account;
import com.bean.AccountSchedule;
import com.bean.DBUtil;

public class AccountDAO {
	Connection connection = null;
	PreparedStatement preparedStatement = null;
	ResultSet resultSet = null;
	//Adding account for the customer
	public String addAccount(Account account){
		String message="Error adding account";
	
			try {
				connection = DBUtil.getConnection();

				preparedStatement = connection
						.prepareStatement("insert into Account values(?,account_id.nextval,?,?,?,?,?)");
				preparedStatement.setInt(1, account.getCustomerId());
			
				preparedStatement.setString(2, account.getAccountType());
				preparedStatement.setDouble(3, account.getBalance());
				preparedStatement.setString(4, account.getStatus());
				preparedStatement.setString(5, account.getMessage());
				preparedStatement.setTimestamp(6,account.getLastUpdated());
				int rowsaffected = preparedStatement.executeUpdate();
				if (rowsaffected > 0) {
					message="Your account will be activated within 24 hours";
				}
				DBUtil.closeConnection(connection);
			
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		

		return message;
	}



	/* Method for Deleting Single Account Details from Account Table. */
	public String deleteAccount(Long accountId)  {
String message="Error in deleting account";
		int rowsUpdated = 0;
	
			try {
				connection = DBUtil.getConnection();
				preparedStatement = connection
						.prepareStatement("delete from Account where Account_Id=?");
				preparedStatement.setLong(1, accountId);
				rowsUpdated = preparedStatement.executeUpdate();
				DBUtil.closeConnection(connection);
			
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			
			
		
		if (rowsUpdated>0) {
			message="Account deleted successfully";
		} 
		return message;
	}

	//Selecting all customer IDs from Customer table
	 public ArrayList<Integer> getCustomerId(){
	    	ArrayList<Integer> result=new ArrayList<Integer>();
	   try {
		connection=DBUtil.getConnection();
		preparedStatement=connection.prepareStatement("select Customer_ID from Customer order by Customer_ID");
    	resultSet=preparedStatement.executeQuery();
    	while(resultSet.next())
    	{
    		int temp=resultSet.getInt(1);
    		result.add(temp);
    	}
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	    	
	    	
			
	    	return result;
	    }

	//Selecting all customer Names from Customer table
	public ArrayList<String> getCustomerName()  {
		ArrayList<String> result=new ArrayList<String>();
    	
		try {
			connection=DBUtil.getConnection();
			preparedStatement=connection.prepareStatement("select Customer_Name from Customer order by Customer_ID");
	    	resultSet=preparedStatement.executeQuery();
	    	while(resultSet.next())
	    	{
	    		String temp=resultSet.getString(1);
	    		result.add(temp);
	    	}
	    	
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
		
    	return result;
	}
//Method for making account active
	public ArrayList<AccountSchedule> getAccountNoOnStatus()  {
		// TODO Auto-generated method stub
		ArrayList<AccountSchedule> accList=new ArrayList<>();
		
	
			try {
				connection=DBUtil.getConnection();
				preparedStatement=connection.prepareStatement("select account_id,Last_Updated,status from account where status=?");
		    	preparedStatement.setString(1, "InActive");
		    	resultSet=preparedStatement.executeQuery();
		    	while(resultSet.next())
		    	{
		    		AccountSchedule account=new AccountSchedule(resultSet.getInt(1), resultSet.getString(3), resultSet.getTimestamp(2));
		    		accList.add(account);
		    	}
				
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    	
		
		return accList;
	}
//Selecting all Accounts
	public ArrayList<Account> viewAccount()  {
Account account=null;
ArrayList<Account> arrayList = new ArrayList<>();

try {
	connection = DBUtil.getConnection();
	preparedStatement = connection.prepareStatement("select * from Account");
	resultSet = preparedStatement.executeQuery();
	while (resultSet.next()) {
	account=new Account(resultSet.getInt(1), resultSet.getLong(2), resultSet.getString(3), resultSet.getDouble(4), resultSet.getString(5), resultSet.getString(6), resultSet.getTimestamp(7));
		arrayList.add(account);
	}
} catch (ClassNotFoundException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}




return arrayList;

}

	
	//Making account active
	public void setStatusActive(long accountId){

			try {
				connection=DBUtil.getConnection();
				preparedStatement=connection.prepareStatement("update Account set status=? where Account_ID=?");
		    	preparedStatement.setString(1,"Active");
		    	preparedStatement.setLong(2, accountId);
		    	preparedStatement.executeUpdate();

			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    	
    	
    	
		
	}
//selecting an account based on the account ID
	public Account getAccById(long accId)  {
		// TODO Auto-generated method stub
		Account account=null;
			try {
				connection=DBUtil.getConnection();
				preparedStatement=connection.prepareStatement("select * from account where Account_ID=?");
		    	preparedStatement.setLong(1,accId);
		    	resultSet =preparedStatement.executeQuery();
		    	while(resultSet.next())
		    	{
		account=new Account(resultSet.getInt(1), resultSet.getLong(2),resultSet.getString(3), resultSet.getDouble(4), resultSet.getTimestamp(7));
		    	}
				
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    	
		return account;
	}
	
	//getting account based on customer ID and Account ID
	public Account getCashierAccount(long l){
		Account account=new Account();
	
		try {
			connection=DBUtil.getConnection();
			preparedStatement=connection.prepareStatement("select C.Customer_Name,A.Customer_ID,A.Account_ID,A.Balance, A.Account_Type"
					+" from Account  A inner join Customer  C on A.Customer_ID=C.Customer_ID and A.Account_ID=? where A.Status='Active'");

			preparedStatement.setLong(1, l);
			resultSet=preparedStatement.executeQuery();
			while(resultSet.next()){
			 account=new Account(resultSet.getString(1),resultSet.getInt(2),resultSet.getLong(3),resultSet.getDouble(4),resultSet.getString(5));
				
			}
			DBUtil.closeConnection(connection);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return account ;

	}  
	//getting accounts based on customer ID and Account ID
	public ArrayList<Account> getAllAccount(){
		Account account=new Account();
		ArrayList<Account> accounts=new ArrayList<>();

	
		try {
			connection=DBUtil.getConnection();
			preparedStatement=connection.prepareStatement("select C.Customer_Name,A.Customer_ID,A.Account_ID,A.Balance"
					+" from Account  A inner join Customer  C on A.Customer_ID=C.Customer_ID  where A.Status='Active'");

		
			resultSet=preparedStatement.executeQuery();
			while(resultSet.next()){
			 account=new Account(resultSet.getString(1),resultSet.getInt(2),resultSet.getLong(3),resultSet.getDouble(4));
				accounts.add(account);
			}
			DBUtil.closeConnection(connection);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		
	return accounts ;

	}
	//Getting Balance based on Account ID
	public double getBalance(long accountId){
		
		double currentBalance=0.0;

			try {
				connection=DBUtil.getConnection();
				preparedStatement=connection.prepareStatement("select Balance from Account where Account_ID=?");
				preparedStatement.setLong(1, accountId);
				resultSet=preparedStatement.executeQuery();
				if(resultSet.next()){
					currentBalance=resultSet.getDouble(1);
				}
				DBUtil.closeConnection(connection);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		
		return currentBalance ;
	}
	
	//selecting account Id based on Customer ID
	public ArrayList<Long> getAccountIdByCustomerId(int customerId){
		ArrayList<Long> accountIdList=new ArrayList<>();
	
		try {
			connection = DBUtil.getConnection();

			preparedStatement = connection
			.prepareStatement("select Account_ID from Account where Customer_ID=? and Status='Active'");

			preparedStatement.setInt(1, customerId);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
			accountIdList.add(resultSet.getLong(1));

			}
			DBUtil.closeConnection(connection);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
		return accountIdList;

	}
	    
}
