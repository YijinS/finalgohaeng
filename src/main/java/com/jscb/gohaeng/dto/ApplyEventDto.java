package com.jscb.gohaeng.dto;

public class ApplyEventDto {

	private int index;
	private String id;
	private int result;
	
	public ApplyEventDto() {}

	public ApplyEventDto(int index, String id, int result) {
		super();
		this.index = index;
		this.id = id;
		this.result = result;
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
	
	
}
