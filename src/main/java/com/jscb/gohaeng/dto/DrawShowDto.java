package com.jscb.gohaeng.dto;

import java.util.Date;

public class DrawShowDto {

	private int index;
	private int enable;
	private int category;
	private String memberId;
	private Date drawDate;
	private String email;
	private String name;
	private int startRowNum;
	private int endRowNum;
	
	public DrawShowDto() {
	}

	public DrawShowDto(int index, int enable, int category, String memberId, Date drawDate, String email, String name,
			int startRowNum, int endRowNum) {
		super();
		this.index = index;
		this.enable = enable;
		this.category = category;
		this.memberId = memberId;
		this.drawDate = drawDate;
		this.email = email;
		this.name = name;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
	}


	public int getStartRowNum() {
		return startRowNum;
	}

	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}

	public int getEndRowNum() {
		return endRowNum;
	}

	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}

	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	public int getEnable() {
		return enable;
	}

	public void setEnable(int enable) {
		this.enable = enable;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public Date getDrawDate() {
		return drawDate;
	}

	public void setDrawDate(Date drawDate) {
		this.drawDate = drawDate;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}
