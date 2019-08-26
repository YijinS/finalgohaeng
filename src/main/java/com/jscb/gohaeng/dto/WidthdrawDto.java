package com.jscb.gohaeng.dto;

public class WidthdrawDto {

	private int wdIndex;
	private String reason;
	private String opinion;
	
	public WidthdrawDto() { }
	
	
	public WidthdrawDto(int wdIndex, String reason, String opinion) {
		super();
		this.wdIndex = wdIndex;
		this.reason = reason;
		this.opinion = opinion;
	}

	public int getWdIndex() {
		return wdIndex;
	}
	public void setWdIndex(int wdIndex) {
		this.wdIndex = wdIndex;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getOpinion() {
		return opinion;
	}
	public void setOpinion(String opinion) {
		this.opinion = opinion;
	}
	
	
}
