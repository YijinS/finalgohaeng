package com.jscb.gohaeng.gameresult.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.jscb.gohaeng.dao.LottoGamesDao;
import com.jscb.gohaeng.dto.LottoGamesDto;

@Service
public class GameResultServiceImpl implements GameResultService {
	
	@Autowired
	LottoGamesDao lottoGamesDao;
	
	@Override
	public void getLastGames(ModelAndView mView) {
		
		LottoGamesDto dto = lottoGamesDao.getLastData();
		mView.addObject("lottoGames",dto);

	}

	@Override
	public void getGamesList(ModelAndView mView) {
		
		List<LottoGamesDto> list;
		list = lottoGamesDao.getList();
		mView.addObject("list",list);

	}

	@Override
	public LottoGamesDto getData(int games) {
		
		LottoGamesDto dto;
		dto = lottoGamesDao.getData(games);
		return dto;
	}

}
