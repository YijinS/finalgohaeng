package com.jscb.gohaeng.dto;

import java.util.Date;

public class NoticeDto {
	
	private int index;
	private String writerId;
	private String title;
	private String content;
	private int hit;
	private Date regDate;
	// 페이징 처리를 위한 필드
	private int startRowNum;
	private int endRowNum;
	// 이전글, 다음글의 글번호를 담을 필드
	private int prevNum;
	private int nextNum;
	//이전 다음 제목
	private String prevTitle;
	private String nextTitle;

	public NoticeDto() {}
	public NoticeDto(int index, String writerId, String title, String content, int hit, Date regDate, int startRowNum,
			int endRowNum, int prevNum, int nextNum, String prevTitle, String nextTitle) {
		super();
		this.index = index;
		this.writerId = writerId;
		this.title = title;
		this.content = content;
		this.hit = hit;
		this.regDate = regDate;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
		this.prevNum = prevNum;
		this.nextNum = nextNum;
		this.prevTitle = prevTitle;
		this.nextTitle = nextTitle;
	}


	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	public String getWriterId() {
		return writerId;
	}
	public void setWriterId(String writerId) {
		this.writerId = writerId;
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

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
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
