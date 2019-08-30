package com.jscb.gohaeng.dto;

public class FaqDto {
	private int index;
	private String question;
	private String answer;
	private int category;
	
	// 페이징 처리를 위한 필드
	private int startRowNum;
	private int endRowNum;
	
	public FaqDto() {
		
	}
	
	

	public FaqDto(int index, String question, String answer, int category, int startRowNum, int endRowNum) {
		super();
		this.index = index;
		this.question = question;
		this.answer = answer;
		this.category = category;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
	}


	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
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

	
	

}
