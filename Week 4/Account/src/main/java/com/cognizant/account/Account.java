package com.cognizant.account;

public class Account {
	private String num;
	private String type;
	private double bal;
		
	public Account(String num,String type,double bal) {
		this.num = num;
		this.type = type;
		this.bal = bal;
	}
	public String getNumber() {
		return num;
	}
	public String getType() {
		return type;
	}
	public double getBalance() {
		return bal;
	}	
}
