package com.jscb.gohaeng.dto;

import java.util.Date;

public class MemberDto {

	private String id;
	private String pwd;
	private String name;
	private int deposit;
	private Date birthday;
	private String hp;
	private String email;
	private String addr;
	private int checkSms;
	private int checkEmail;
	private int checkSales;
	//email인증관련
	private String authKey;
	private int authStatus;
	
	public MemberDto() {}
	
	public MemberDto(String id, String pwd, String name, Date birthday, String hp, String email,
			String addr, int checkSms, int checkEmail, int checkSales) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.birthday = birthday;
		this.hp = hp;
		this.email = email;
		this.addr = addr;
		this.checkSms = checkSms;
		this.checkEmail = checkEmail;
		this.checkSales = checkSales;
	}
	//email인증관련 생성자
	public MemberDto(String id, String pwd, String name, int deposit, Date birthday, String hp, String email,
			String addr, int checkSms, int checkEmail, int checkSales, String authKey, int authStatus) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.deposit = deposit;
		this.birthday = birthday;
		this.hp = hp;
		this.email = email;
		this.addr = addr;
		this.checkSms = checkSms;
		this.checkEmail = checkEmail;
		this.checkSales = checkSales;
		this.authKey = authKey;
		this.authStatus = authStatus;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getDeposit() {
		return deposit;
	}

	public void setDeposit(int deposit) {
		this.deposit = deposit;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getHp() {
		return hp;
	}

	public void setHp(String hp) {
		this.hp = hp;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public int getCheckSms() {
		return checkSms;
	}

	public void setCheckSms(int checkSms) {
		this.checkSms = checkSms;
	}

	public int getCheckEmail() {
		return checkEmail;
	}

	public void setCheckEmail(int checkEmail) {
		this.checkEmail = checkEmail;
	}

	public int getCheckSales() {
		return checkSales;
	}

	public void setCheckSales(int checkSales) {
		this.checkSales = checkSales;
	}

	public String getAuthKey() {
		return authKey;
	}

	public void setAuthKey(String authKey) {
		this.authKey = authKey;
	}

	public int getAuthStatus() {
		return authStatus;
	}

	public void setAuthStatus(int authStatus) {
		this.authStatus = authStatus;
	}
	
	
	
}
