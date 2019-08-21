package com.jscb.gohaeng;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

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

		/* mView.setViewName("common.indexa"); */
		 mView.setViewName("common.index");

		return mView;
	}
	
	@RequestMapping(value="/home2",method = RequestMethod.GET)
	public ModelAndView home2(ModelAndView mView,HttpServletRequest request) throws IOException {
		
		String url = request.getRequestURI();
		String query = request.getQueryString();
		
		System.out.println("url : " + url);
		System.out.println("query : " + query);
		/* mView.setViewName("common.indexa"); */
		 mView.setViewName("common.index");

		return mView;
	}
	
}
