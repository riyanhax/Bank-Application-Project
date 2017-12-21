package com.service;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

import com.Exception.DataLayerException;
import com.Exception.ServiceLayerException;
import com.bean.Account;
import com.bean.AccountSchedule;
import com.bean.Customer;
import com.dao.AccountDAO;

public class AccountService {
	AccountDAO accountDAO = new AccountDAO();

	public String addAccount(Account account) {
		
			return accountDAO.addAccount(account);
		
	}

	public Account getCashierAccount(long l) {
		
				return accountDAO.getCashierAccount(l);
		

	}

	public ArrayList<Account> getAllAccount() {
		
	
			return accountDAO.getAllAccount();
		
	}
	public double getBalance(long accountId){
		
		

			return accountDAO.getBalance(accountId);
		
		
	}
	/*
	 * public ArrayList<Account> viewAccount(int id) throws
	 * ClassNotFoundException, SQLException{ return accountDAO.viewAccount(id);
	 * 
	 * }
	 */
	public String deleteAccount(Long accountId) {
		
	
			return accountDAO.deleteAccount(accountId);
		
	}

	public ArrayList<Integer> getCustomerId()  {
		
		
			return accountDAO.getCustomerId();
		
	}

	public ArrayList<String> getCustomerName(){
		
		
			return accountDAO.getCustomerName();
		
	}

	public static void main(String[] args) {
		int initialDelay = 3000; // start after 30 seconds
		int period = 5000; // repeat every 5 seconds
		Timer timer = new Timer();
		TimerTask task = new TimerTask() {
			public void run() {
				Date date = new Date();
				java.sql.Date date1 = new java.sql.Date(date.getTime());
				Timestamp lastUpdated1 = new Timestamp(date1.getTime());
				AccountDAO dao = new AccountDAO();
				ArrayList<AccountSchedule> accList = new ArrayList<>();
			
					accList = dao.getAccountNoOnStatus();
					for(AccountSchedule account:accList)
					{
						
						int diff=(int) ((account.getLastupdated().getTime()-lastUpdated1.getTime()))/(1000*60*60*24);
						
						if(diff<0)
						{
							
							dao.setStatusActive(account.getAccountId());
							
						}
					}
				

			}
		};
		timer.scheduleAtFixedRate(task, initialDelay, period);

	}

	public ArrayList<Account> viewAccount() {
		
	
			return accountDAO.viewAccount();
		
	}
	public ArrayList<Long> getAccountIdByCustomerId(int customerId) {
		
	
			return accountDAO.getAccountIdByCustomerId(customerId);
		
	}

	public Account getAccById(long accId) throws ServiceLayerException {
		// TODO Auto-generated method stub
		

			return accountDAO.getAccById(accId);
		
	}
}
