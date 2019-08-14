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
	
	@RequestMapping(value="/home",method = RequestMethod.GET)
	public ModelAndView home(ModelAndView mView) throws IOException {
		
		indexService.crawlingFortune(mView);
		
		mView.setViewName("common.index");
		
		return mView;
	}
	
}
