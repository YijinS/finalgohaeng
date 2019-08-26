package com.jscb.gohaeng.gameresult.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.servlet.ModelAndView;

import com.jscb.gohaeng.dto.LottoGamesDto;

public interface GameResultService {
	
	public void getLastGames(ModelAndView mView);
	public void getGamesList(ModelAndView mView);
	public List<LottoGamesDto> getGamesList(int start,int end);
	public LottoGamesDto getData(int games);
	public Map<String,Object> getStatByNumber(int start,int end,int bonus);
	public Map<String,Object> getColorByNumber(int start,int end);
	public List<Integer> getGames();
}
