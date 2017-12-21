package com.bean;

import java.util.Date;

public class Transaction {
private Date transactionDate;
private String transactionDescription;
private double balance;
private String status;
private long accountId;

public Transaction(Date transactionDate, String transactionDescription,
		double balance, String status, long accountId) {
	this.transactionDate = transactionDate;
	this.transactionDescription = transactionDescription;
	this.balance = balance;
	this.status = status;
	this.accountId = accountId;
}

public long getAccountId() {
	return accountId;
}

public void setAccountId(long accountId) {
	this.accountId = accountId;
}

public Date getTransactionDate() {
	return transactionDate;
}
public void setTransactionDate(Date transactionDate) {
	this.transactionDate = transactionDate;
}
public String getTransactionDescription() {
	return transactionDescription;
}
public void setTransactionDescription(String transactionDescription) {
	this.transactionDescription = transactionDescription;
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

@Override
public String toString() {
	return ""+ transactionDate
			+ "         " + transactionDescription
			+ "         " + balance 
			+ "         " + status 
			+ "         "	+
			accountId ;
}

}
