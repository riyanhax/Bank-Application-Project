package com.bean;

import java.sql.Date;
import java.sql.Timestamp;


/*Class for Account Bean Class*/

public class Account {
	
	private String custName;
	private int customerId;
	private long accountId;
	private String accountType;
	private double balance;
	private String status;
	private String message;
	private Timestamp lastUpdated;
	public Account() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Account(String custName, int customerId, long accountId,
			double balance) {
		super();
		this.custName = custName;
		this.customerId = customerId;
		this.accountId = accountId;
		this.balance = balance;
	}
	public Account(String custName, int customerId, long accountId,
			double balance,String accountType) {
			super();
			this.custName = custName;
			this.customerId = customerId;
			this.accountId = accountId;
			this.balance = balance;
			this.accountType=accountType;
	}

	public String getCustName() {
		return custName;
	}

	public void setCustName(String custName) {
		this.custName = custName;
	}

	public Account(int customerId, String accountType, String status,
			String message, Timestamp lastUpdated) {
		super();
		this.customerId =  customerId;
		this.accountType = accountType;
		this.status = status;
		this.message = message;
		this.lastUpdated = lastUpdated;
	}
	
	public Account(int customerId, long accountId, String accountType,
			double balance, String status, String message, Timestamp lastUpdated) {
		super();
		this.customerId =  customerId;
		this.accountId =  accountId;
		this.accountType = accountType;
		this.balance = balance;
		this.status = status;
		this.message = message;
		this.lastUpdated = lastUpdated;
	}
	
	public Account(int customerId, long accountId, String accountType,
			double balance, Timestamp lastUpdated) {
		super();
		this.customerId = customerId;
		this.accountId = accountId;
		this.accountType = accountType;
		this.balance = balance;
		this.lastUpdated = lastUpdated;
	}
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public long getAccountId() {
		return accountId;
	}
	public void setAccountId(long accountId) {
		this.accountId = accountId;
	}
	public String getAccountType() {
		return accountType;
	}
	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}
	public double getBalance() {
		return balance;
	}
	public void setBalance(double balance) {
		this.balance = balance;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Timestamp getLastUpdated() {
		return lastUpdated;
	}
	public void setLastUpdated(Timestamp lastUpdated) {
		this.lastUpdated = lastUpdated;
	}

	@Override
	public String toString() {
		return "Account [custName=" + custName + ", customerId=" + customerId
				+ ", accountId=" + accountId + ", accountType=" + accountType
				+ ", balance=" + balance + ", status=" + status + ", message="
				+ message + ", lastUpdated=" + lastUpdated + "]";
	}
	
	
}
