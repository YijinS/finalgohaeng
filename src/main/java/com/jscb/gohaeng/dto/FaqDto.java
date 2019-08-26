package com.jscb.gohaeng.dto;

public class FaqDto {
	private int index;
	private String question;
	private String answer;
	private int category;
	
	public FaqDto() {
		
	}

	public FaqDto(int index, String question, String answer, int category) {
		super();
		this.index = index;
		this.question = question;
		this.answer = answer;
		this.category = category;
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
	
	

}
