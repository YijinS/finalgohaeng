package com.jscb.gohaeng.dto;

import java.util.Date;

public class ApplyEventDto {

	private int index;
	private String id;
	private int result;
	
	private String title;
	private Date drawDate;
	
	private int startRowNum;
	private int endRowNum;
	
	private String prevTitle;
	private String nextTitle;
	
	private int prevNum;
	private int nextNum;
	
	public ApplyEventDto() {}
	public ApplyEventDto(int index, String id, int result, String title, Date drawDate, int startRowNum, int endRowNum,
			String prevTitle, String nextTitle, int prevNum, int nextNum) {
		super();
		this.index = index;
		this.id = id;
		this.result = result;
		this.title = title;
		this.drawDate = drawDate;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
		this.prevTitle = prevTitle;
		this.nextTitle = nextTitle;
		this.prevNum = prevNum;
		this.nextNum = nextNum;
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

	public int getResult() {
		return result;
	}

	public void setResult(int result) {
		this.result = result;
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
	
	
}
