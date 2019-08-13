package com.jscb.gohaeng.gameresult.service;

import org.springframework.web.servlet.ModelAndView;

import com.jscb.gohaeng.dto.LottoGamesDto;

public interface GameResultService {
	
	public void getLastGames(ModelAndView mView);
	public void getGamesList(ModelAndView mView);
	public LottoGamesDto getData(int games);
}
