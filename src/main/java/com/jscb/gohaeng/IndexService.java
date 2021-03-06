package com.jscb.gohaeng;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import org.springframework.web.servlet.ModelAndView;

import com.jscb.gohaeng.dto.NoticeDto;
import com.jscb.gohaeng.dto.LottoGamesDto;

public interface IndexService {
	
	public ModelAndView crawlingFortune(ModelAndView mView) throws IOException;
	public void lottonum() throws IOException, ParseException;
	public void getLastLotto(ModelAndView mView);
	//로또 전체회차
	public List<NoticeDto> getNoticeList();
	public void totalgames() throws IOException, ParseException;
	public LottoGamesDto getLottoGames(int games);
	
}
