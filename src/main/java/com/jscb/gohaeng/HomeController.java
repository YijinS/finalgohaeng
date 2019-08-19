package com.jscb.gohaeng;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	
	@Autowired
	IndexService indexService;
	
	@RequestMapping(value="/",method = RequestMethod.GET)
	public ModelAndView home(ModelAndView mView) throws IOException {
		mView.setViewName("common.index");
		
		//여기부분이나 service쪽에서 조건문 걸어서 최근회차가 있으면 실행안되게 하고싶어!!
		indexService.lottonum();
	
		return mView;
	}
	
	
}
