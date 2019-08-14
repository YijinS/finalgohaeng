package com.jscb.gohaeng.dto;

import java.util.Date;

public class DepositDto {
	
	private int index;
	private String id;
	private int inout;
	private int price;
	private Date date;
	private String bank;
	private String account;
	
	public DepositDto() {}

	public DepositDto(int index, String id, int inout, int price, Date date, String bank, String account) {
		super();
		this.index = index;
		this.id = id;
		this.inout = inout;
		this.price = price;
		this.date = date;
		this.bank = bank;
		this.account = account;
	}

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getInout() {
		return inout;
	}

	public void setInout(int inout) {
		this.inout = inout;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}
	
	
}
