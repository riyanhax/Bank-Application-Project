package com.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.Exception.DataLayerException;
import com.Exception.ServiceLayerException;
import com.bean.Customer;
import com.dao.CustomerDAO;

public class CustomerService {
	CustomerDAO dao = new CustomerDAO();

	public String addCustomer(Customer customer) throws ServiceLayerException  {
		
		if(dao.searchssnid(customer.getSsnId()))
		{
			throw new ServiceLayerException("SSN ID already exist");
		}
			return dao.addCustomer(customer);
		
	}

	public Customer getCustomerOnCustomerId(int customerId)
			throws ServiceLayerException {
		
		try{
			return dao.getCustomerOnCustomerId(customerId);
		}catch(DataLayerException e)
		{
			throw new ServiceLayerException(e.getMessage());
		}
	}

	public String updatecustomer(Customer customer)
			throws ServiceLayerException {
		
		try{
			return dao.updatecustomer(customer);
		}catch(DataLayerException e)
		{
			throw new ServiceLayerException(e.getMessage());
		}
	}

	public ArrayList<Long> getSsnId() throws ServiceLayerException {
		
		try{
			return dao.getSsnId();
		}catch(DataLayerException e)
		{
			throw new ServiceLayerException(e.getMessage());
		}
	}

	public Customer viewCustomerById(int customerId,long ssnid)
			throws ServiceLayerException {

		
		try{
			return dao.viewCustomerById(customerId,ssnid);
		}catch(DataLayerException e)
		{
			throw new ServiceLayerException(e.getMessage());
		}
	}

	public ArrayList<Integer> getCustomerId() throws ServiceLayerException {
		
		try{
			return dao.getCustomerId();
		}catch(DataLayerException e)
		{
			throw new ServiceLayerException(e.getMessage());
		}
	}

	public ArrayList<Customer> viewcustomer() throws ServiceLayerException {
		
		try{
			return dao.viewcustomer();
		}catch(DataLayerException e)
		{
			throw new ServiceLayerException(e.getMessage());
		}
	}

	public String deleteCustomer(int customerid) throws ServiceLayerException {
		// TODO Auto-generated method stub
		
		try{
			return dao.deleteCustomer(customerid);
		}catch(DataLayerException e)
		{
			throw new ServiceLayerException(e.getMessage());
		}
	}
}