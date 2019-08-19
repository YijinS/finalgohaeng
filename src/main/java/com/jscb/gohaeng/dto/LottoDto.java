package com.jscb.gohaeng.dto;

public class LottoDto {
	private int index;
	private int plIndex;
	private String num;
	private int method;
	
	public LottoDto() {}

	public LottoDto(int index, int plIndex, String num, int method) {
		super();
		this.index = index;
		this.plIndex = plIndex;
		this.num = num;
		this.method = method;
	}

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	public int getPlIndex() {
		return plIndex;
	}

	public void setPlIndex(int plIndex) {
		this.plIndex = plIndex;
	}

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public int getMethod() {
		return method;
	}

	public void setMethod(int method) {
		this.method = method;
	}
	
	
	
}
