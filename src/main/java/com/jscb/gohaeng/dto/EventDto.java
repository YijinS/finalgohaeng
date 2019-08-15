package com.jscb.gohaeng.dto;

import java.util.Date;

public class EventDto {

	private int index;
	private String title;
	private Date drawDate;
	private String subTitle;
	private String content;
	private int enable;
	private Date startDate;
	private Date endDate;
	private Date regDate;
	private int display;
	
	private int startRowNum;
	private int endRowNum;
	
	private int prevNum;
	private int nextNum;
	
	public EventDto() {}
	public EventDto(int index, String title, Date drawDate, String subTitle, String content, int enable, Date startDate,
			Date endDate, Date regDate, int display, int startRowNum, int endRowNum, int prevNum, int nextNum) {
		super();
		this.index = index;
		this.title = title;
		this.drawDate = drawDate;
		this.subTitle = subTitle;
		this.content = content;
		this.enable = enable;
		this.startDate = startDate;
		this.endDate = endDate;
		this.regDate = regDate;
		this.display = display;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
		this.prevNum = prevNum;
		this.nextNum = nextNum;
	}

	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getDrawDate() {
		return drawDate;
	}
	public void setDrawDate(Date drawDate) {
		this.drawDate = drawDate;
	}
	public String getSubTitle() {
		return subTitle;
	}
	public void setSubTitle(String subTitle) {
		this.subTitle = subTitle;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getEnable() {
		return enable;
	}
	public void setEnable(int enable) {
		this.enable = enable;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
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
	public int getDisplay() {
		return display;
	}
	public void setDisplay(int display) {
		this.display = display;
	}
	
}
