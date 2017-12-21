package com.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.Exception.DataLayerException;
import com.bean.DBUtil;
import com.bean.Transaction;

public class TransactionDAO {
	ResultSet resultset=null;


	//inserting Transaction for account
	public void addTransaction(Transaction transaction) throws DataLayerException
	{
		try{
			Connection connection=DBUtil.getConnection();
			PreparedStatement preparedStatement=connection.prepareStatement("insert into transaction values(?,?,?,?,?)");
			preparedStatement.setString(1, transaction.getTransactionDescription());
			preparedStatement.setDate(2,  (Date) transaction.getTransactionDate());
			preparedStatement.setString(3,transaction.getStatus());
			preparedStatement.setDouble(4, transaction.getBalance());
			preparedStatement.setLong(5, transaction.getAccountId());
			preparedStatement.executeUpdate();
		}
		catch(SQLException |ClassNotFoundException e)
		{
			throw new DataLayerException(e.getMessage());
		}
	}



	//viewing mini statement based on Account and date
	public ArrayList<Transaction> viewtransaction(Date startdate,Date enddate,int id) throws DataLayerException
	{
		int temp=0;
		ArrayList<Transaction> transactionList=new ArrayList<>();
		try{
			Connection connection=DBUtil.getConnection();
			Transaction transaction=null;
			PreparedStatement preparedStatement=connection.prepareStatement("select * from TRANSACTION where transactiondate>=? and transactiondate<=? and Account_ID=?");
			preparedStatement.setDate(1,startdate );
			preparedStatement.setDate(2, enddate);
			preparedStatement.setInt(3, id);
			resultset=preparedStatement.executeQuery();
			while(resultset.next())
			{	temp=1;
				transaction=new Transaction(resultset.getDate(2), resultset.getString(1), resultset.getDouble(4), resultset.getString(3), resultset.getLong(5));
				transactionList.add(transaction);
			}
		}
		catch(SQLException |ClassNotFoundException e)
		{
			throw new DataLayerException(e.getMessage());
		}
		
		return transactionList;
		
	}





}
