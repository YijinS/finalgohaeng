package com.jscb.gohaeng.dto;

import java.util.Date;

public class WinnerDto {
	private int wiIndex;
	private int wiHit;
	private int wiCategory;
	private String memberId;
	private String wiTitle;
	private String wiContent;
	private Date wiDrawDate; 
	private Date wiRegDate;
	
	// 페이징 처리를 위한 필드
	private int startRowNum;
	private int endRowNum;
	
	// 이전글, 다음글의 글번호를 담을 필드
	private int prevNum;
	private int nextNum;
	
	//이전 다음 제목
	private String prevTitle;
	private String nextTitle;
	
	public WinnerDto() {}

	public WinnerDto(int wiIndex, int wiHit, int wiCategory, String memberId, String wiTitle, String wiContent,
			Date wiDrawDate, Date wiRegDate, int startRowNum, int endRowNum, int prevNum, int nextNum, String prevTitle,
			String nextTitle) {
		super();
		this.wiIndex = wiIndex;
		this.wiHit = wiHit;
		this.wiCategory = wiCategory;
		this.memberId = memberId;
		this.wiTitle = wiTitle;
		this.wiContent = wiContent;
		this.wiDrawDate = wiDrawDate;
		this.wiRegDate = wiRegDate;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
		this.prevNum = prevNum;
		this.nextNum = nextNum;
		this.prevTitle = prevTitle;
		this.nextTitle = nextTitle;
	}

	public int getWiIndex() {
		return wiIndex;
	}

	public void setWiIndex(int wiIndex) {
		this.wiIndex = wiIndex;
	}

	public int getWiHit() {
		return wiHit;
	}

	public void setWiHit(int wiHit) {
		this.wiHit = wiHit;
	}

	public int getWiCategory() {
		return wiCategory;
	}

	public void setWiCategory(int wiCategory) {
		this.wiCategory = wiCategory;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getWiTitle() {
		return wiTitle;
	}

	public void setWiTitle(String wiTitle) {
		this.wiTitle = wiTitle;
	}

	public String getWiContent() {
		return wiContent;
	}

	public void setWiContent(String wiContent) {
		this.wiContent = wiContent;
	}

	public Date getWiDrawDate() {
		return wiDrawDate;
	}

	public void setWiDrawDate(Date wiDrawDate) {
		this.wiDrawDate = wiDrawDate;
	}

	public Date getWiRegDate() {
		return wiRegDate;
	}

	public void setWiRegDate(Date wiRegDate) {
		this.wiRegDate = wiRegDate;
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

	public int getPrevNum() {
		return prevNum;
	}

	public void setPrevNum(int prevNum) {
		this.prevNum = prevNum;
	}

	public int getNextNum() {
		return nextNum;
	}

	public void setNextNum(int nextNum) {
		this.nextNum = nextNum;
	}

	public String getPrevTitle() {
		return prevTitle;
	}

	public void setPrevTitle(String prevTitle) {
		this.prevTitle = prevTitle;
	}

	public String getNextTitle() {
		return nextTitle;
	}

	public void setNextTitle(String nextTitle) {
		this.nextTitle = nextTitle;
	}
	

}	
