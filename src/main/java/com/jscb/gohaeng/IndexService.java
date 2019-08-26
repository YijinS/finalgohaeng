package com.jscb.gohaeng;

import java.io.IOException;
import java.text.ParseException;

import org.springframework.web.servlet.ModelAndView;

public interface IndexService {
	
	public ModelAndView crawlingFortune(ModelAndView mView) throws IOException;
	public void lottonum() throws IOException, ParseException;
	public void getLastLotto(ModelAndView mView);
	//로또 전체회차
	public void totalgames() throws IOException, ParseException;
	
}
