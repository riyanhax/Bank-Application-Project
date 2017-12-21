package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.Exception.DataLayerException;
import com.bean.Customer;
import com.bean.DBUtil;

public class CustomerDAO {
	Connection connection = null;
	PreparedStatement preparedStatement=null;

	ResultSet resultSet=null;
	String message="Error in adding customer";


	//Adding Customer
	public String addCustomer(Customer customer) {
		// TODO Auto-generated method stub
		int rowsAffected=0;
		int custID=0;
		
			try {
				connection=DBUtil.getConnection();
			
			PreparedStatement preparedStatement1=connection.prepareStatement("select Customer_ID.nextval from dual");
			resultSet =preparedStatement1.executeQuery();
			while(resultSet.next())
			{
				custID=resultSet.getInt(1);
			}
			PreparedStatement preparedStatement=connection.prepareStatement("insert into Customer values(?,?,?,?,?,?)");
			preparedStatement.setLong(1, customer.getSsnId());
			preparedStatement.setInt(2, custID);
			preparedStatement.setString(3,customer.getCustomerName());
			preparedStatement.setInt(4, customer.getAge());
			preparedStatement.setString(5, customer.getAddress()+" "+customer.getCity()+" "+customer.getState());

			preparedStatement.setString(6, customer.getMessage());
			rowsAffected =preparedStatement.executeUpdate();
			if(rowsAffected>0)
			{
				message="Customer instantiated successfully with Customer ID : "+custID+". Now you can create the account" ;
			}
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		return message;
	}

	//deleting the customer based on customer Id 
	public String deleteCustomer(int id) throws DataLayerException{

		int rowsDeleted=0;
		String message="Customer already mapped to an account(s)";
		try {
			connection=DBUtil.getConnection();
			preparedStatement=connection.prepareStatement("delete from Customer where customer_id=?");
			preparedStatement.setInt(1, id);
			rowsDeleted=preparedStatement.executeUpdate();



			DBUtil.closeConnection(connection);

			if(rowsDeleted==1){
				message="Customer with ID : "+id+" deleted successfully";
			}
		}
		catch(SQLException |ClassNotFoundException e)
		{
			throw new DataLayerException(e.getMessage());
		}
		return message;

	}

	//selecting all customers
	public ArrayList<Customer> viewcustomer() throws DataLayerException
	{
		Customer customerobj=null;
		ArrayList<Customer> list=new ArrayList<>();
		try{
			connection=DBUtil.getConnection();
			preparedStatement=connection.prepareStatement("select * from Customer");
			resultSet=preparedStatement.executeQuery();
			while(resultSet.next())
			{
				customerobj=new Customer(resultSet.getLong(1),resultSet.getInt(2), resultSet.getString(3), resultSet.getInt(4),resultSet.getString(5) ,resultSet.getString(6));
				list.add(customerobj);
			}
		}
		catch(SQLException |ClassNotFoundException e)
		{
			throw new DataLayerException(e.getMessage());
		}
		return list;

	}


	public Customer getCustomerOnCustomerId(int customerId) throws DataLayerException {
		// TODO Auto-generated method stub
		Customer customerobj=null;

		try{connection=DBUtil.getConnection();
		preparedStatement=connection.prepareStatement("select * from Customer where Customer_ID=? ");
		preparedStatement.setInt(1, customerId);

		resultSet=preparedStatement.executeQuery();
		while(resultSet.next())
		{
			customerobj=new Customer(resultSet.getLong(1),resultSet.getInt(2), resultSet.getString(3), resultSet.getInt(4),resultSet.getString(5) ,resultSet.getString(6));
		}
		}
		catch(SQLException |ClassNotFoundException e)
		{
			throw new DataLayerException(e.getMessage());
		}
		return customerobj;
	}
	public Customer viewCustomerById(int customerId,long ssnId) throws DataLayerException{
		Customer customerById=null;

		try{connection=DBUtil.getConnection();
		preparedStatement=connection.prepareStatement("select * from Customer where Customer_ID=? and SSN_ID=?");
		preparedStatement.setInt(1, customerId);
		preparedStatement.setLong(2,ssnId );
		resultSet=preparedStatement.executeQuery();
		if(resultSet.next())
		{
			customerById=new Customer(resultSet.getLong(1),resultSet.getInt(2), resultSet.getString(3), resultSet.getInt(4),resultSet.getString(5) ,resultSet.getString(6));

		}
		}
		catch(SQLException |ClassNotFoundException e)
		{
			throw new DataLayerException(e.getMessage());
		}
		return customerById;
	}
	public ArrayList<Long> getSsnId() throws DataLayerException{
		ArrayList<Long> result=new ArrayList<Long>();

		try{connection=DBUtil.getConnection();
		preparedStatement=connection.prepareStatement("select SSN_ID from Customer order by Customer_ID");
		resultSet=preparedStatement.executeQuery();
		while(resultSet.next())
		{
			Long temp=resultSet.getLong(1);
			result.add(temp);
		}
		}
		catch(SQLException |ClassNotFoundException e)
		{
			throw new DataLayerException(e.getMessage());
		}
		return result;
	}
	public ArrayList<Integer> getCustomerId() throws DataLayerException{
		ArrayList<Integer> result=new ArrayList<Integer>();

		try{
			connection=DBUtil.getConnection();
			preparedStatement=connection.prepareStatement("select Customer_ID from Customer order by Customer_ID");
			resultSet=preparedStatement.executeQuery();
			while(resultSet.next())
			{
				int temp=resultSet.getInt(1);
				result.add(temp);
			}
		}
		catch(SQLException |ClassNotFoundException e)
		{
			throw new DataLayerException(e.getMessage());
		}
		return result;
	}



	// updating customer


	public String updatecustomer(Customer customer) throws  DataLayerException
	{
		int rowsUpdated=0;
		String message="Error in updating customer";
		try{
			connection=DBUtil.getConnection();
			preparedStatement=connection.prepareStatement("update Customer set customer_name=?,age=?,address=?,message=? where customer_id=?");
			preparedStatement.setString(1,customer.getCustomerName() );
			preparedStatement.setInt(2, customer.getAge());
			preparedStatement.setString(3, customer.getAddress());
			preparedStatement.setString(4, customer.getMessage());
			preparedStatement.setInt(5, customer.getCustomerId());
			rowsUpdated=preparedStatement.executeUpdate();
			if(rowsUpdated>0)
			{
				message="Customer with ID: "+customer.getCustomerId()+" updated successfully ";
			}
		}
		catch(SQLException |ClassNotFoundException e)
		{
			throw new DataLayerException(e.getMessage());
		}
		return message;
	}

	public boolean searchssnid(long ssnId) {
		// TODO Auto-generated method stub
		boolean flag=false;
	
		try {
			connection=DBUtil.getConnection();
			preparedStatement=connection.prepareStatement("select SSN_ID from customer where SSN_ID=?");
			preparedStatement.setLong(1,ssnId);
			resultSet=preparedStatement.executeQuery();
			while(resultSet.next())
			{
				flag=true;
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return flag;
	}
	

}
