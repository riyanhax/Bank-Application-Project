package com.bean;

import java.sql.Timestamp;

public class AccountSchedule {
private long accountId;
private String status;
private Timestamp lastupdated;
public AccountSchedule(long accountId, String status, Timestamp lastupdated) {
	super();
	this.accountId = accountId;
	this.status = status;
	this.lastupdated = lastupdated;
}
public long getAccountId() {
	return accountId;
}
public void setAccountId(long accountId) {
	this.accountId = accountId;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
public Timestamp getLastupdated() {
	return lastupdated;
}
public void setLastupdated(Timestamp lastupdated) {
	this.lastupdated = lastupdated;
}

}
