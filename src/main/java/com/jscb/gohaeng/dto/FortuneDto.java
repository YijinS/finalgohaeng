package com.jscb.gohaeng.dto;

public class FortuneDto {
	private String sign;
	private String fortune;
	
	
	public FortuneDto() {}
	
	public FortuneDto(String sign,String fortune) {
		this.sign = sign;
		this.fortune = fortune;
	}


	public String getSign() {
		return sign;
	}


	public void setSign(String sign) {
		this.sign = sign;
	}


	public String getFortune() {
		return fortune;
	}

	public void setFortune(String fortune) {
		this.fortune = fortune;
	}
}
