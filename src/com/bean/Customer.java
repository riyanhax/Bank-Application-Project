package com.bean;

import java.sql.Date;

/* Class for Customer Bean */
public class Customer {
	private long ssnId;
	private int customerId;
	private String customerName;
	private int age;
	private String address;
	private String city;
	private String state;

	private String message;

	
	public Customer(long ssnId, String customerName, int age, String address,
			String city, String state, String message) {
		this.ssnId = ssnId;
		this.customerName = customerName;
		this.age = age;
		this.address = address;
		this.city = city;
		this.state = state;
		this.message = message;
	}
	public Customer(long ssnId2, int customerid2, String custName, int age2,
			String addressLine, String message2) {
		// TODO Auto-generated constructor stub
		this.ssnId = ssnId2;
		this.customerId=customerid2 ;
		this.customerName = custName;
		this.age = age2;
		this.address = addressLine;
		
		this.message = message2;
	}
	public long getSsnId() {
		return ssnId;
	}
	public void setSsnId(int ssnId) {
		this.ssnId = ssnId;
	}
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}

}