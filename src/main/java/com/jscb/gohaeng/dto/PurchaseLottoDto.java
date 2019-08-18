package com.jscb.gohaeng.dto;

import java.util.Date;

public class PurchaseLottoDto {
	private int index;
	private String memberId;
	private int storeIndex;
	private int lgmGames;
	private Date issueDate;
	
	public PurchaseLottoDto() {}

	public PurchaseLottoDto(int index, String memberId, int storeIndex, int lgmGames, Date issueDate) {
		super();
		this.index = index;
		this.memberId = memberId;
		this.storeIndex = storeIndex;
		this.lgmGames = lgmGames;
		this.issueDate = issueDate;
	}

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getStoreIndex() {
		return storeIndex;
	}

	public void setStoreIndex(int storeIndex) {
		this.storeIndex = storeIndex;
	}

	public int getLgmGames() {
		return lgmGames;
	}

	public void setLgmGames(int lgmGames) {
		this.lgmGames = lgmGames;
	}

	public Date getIssueDate() {
		return issueDate;
	}

	public void setIssueDate(Date issueDate) {
		this.issueDate = issueDate;
	}
	
	
}
