package com.jscb.gohaeng.dto;

import java.util.Date;

public class QnaDto {
	private int index;
	private String memberId;
	private int category;
	private String title;
	private String content;
	private Date regdate;
	private String reply;
	private Date replydate;
	// 페이징 처리를 위한 필드
	private int startRowNum;
	private int endRowNum;
	// 라디오 버튼 처리
	private String searchType;
	
	public QnaDto() {

	}

	public QnaDto(int index, String memberId, int category, String title, String content, Date regdate, String reply,
			Date replydate, int startRowNum, int endRowNum, String searchType) {
		super();
		this.index = index;
		this.memberId = memberId;
		this.category = category;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.reply = reply;
		this.replydate = replydate;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
		this.searchType = searchType;
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

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

	public Date getReplydate() {
		return replydate;
	}

	public void setReplydate(Date replydate) {
		this.replydate = replydate;
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

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	
	
}
