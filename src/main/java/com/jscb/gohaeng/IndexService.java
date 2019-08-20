package com.jscb.gohaeng;

import java.io.IOException;

import org.springframework.web.servlet.ModelAndView;

public interface IndexService {
	
	public ModelAndView crawlingFortune(ModelAndView mView) throws IOException;
	public void lottonum() throws IOException;
	public void getLastLotto(ModelAndView mView);
	
}
