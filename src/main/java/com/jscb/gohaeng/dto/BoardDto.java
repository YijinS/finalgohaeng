package com.jscb.gohaeng.dto;

public class BoardDto {
	private int index;
	private String subject;
	private String content;
	private String userId;
	private String fileName;
	
	public BoardDto() {}
	public BoardDto(int index, String subject, String content, String userId, String fileName) {
		super();
		this.index = index;
		this.subject = subject;
		this.content = content;
		this.userId = userId;
		this.fileName = fileName;
	}

	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
}
