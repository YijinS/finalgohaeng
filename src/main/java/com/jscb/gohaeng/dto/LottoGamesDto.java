package com.jscb.gohaeng.dto;

import java.util.Date;

public class LottoGamesDto {
	
	private int games;
	private String winningNum;
	private String bonusNum;
	private Date drawDate;
	private int winningAmount;
	private Date paymentDate;
	
	public LottoGamesDto() {}

	public LottoGamesDto(int games, String winningNum, String bonusNum, Date drawDate, int winningAmount,
			Date paymentDate) {
		super();
		this.games = games;
		this.winningNum = winningNum;
		this.bonusNum = bonusNum;
		this.drawDate = drawDate;
		this.winningAmount = winningAmount;
		this.paymentDate = paymentDate;
	}

	public int getGames() {
		return games;
	}

	public void setGames(int games) {
		this.games = games;
	}

	public String getWinningNum() {
		return winningNum;
	}

	public void setWinningNum(String winningNum) {
		this.winningNum = winningNum;
	}

	public String getBonusNum() {
		return bonusNum;
	}

	public void setBonusNum(String bonusNum) {
		this.bonusNum = bonusNum;
	}

	public Date getDrawDate() {
		return drawDate;
	}

	public void setDrawDate(Date drawDate) {
		this.drawDate = drawDate;
	}

	public int getWinningAmount() {
		return winningAmount;
	}

	public void setWinningAmount(int winningAmount) {
		this.winningAmount = winningAmount;
	}

	public Date getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}

	
	
	
}
