package com.jscb.gohaeng.happy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/happy/")
@Controller
public class HappyController {
	
	/*----------------------- 건전한 복권문화  -----------------------*/
	@RequestMapping("healthy/1")
	public ModelAndView healthy1(ModelAndView mView) {
		
		mView.setViewName("happy.healthy.1");
		return mView;
	}
	@RequestMapping("healthy/2")
	public ModelAndView healthy2(ModelAndView mView) {
		
		mView.setViewName("happy.healthy.2");
		return mView;
	}
	@RequestMapping("healthy/3")
	public ModelAndView healthy3(ModelAndView mView) {
		
		mView.setViewName("happy.healthy.3");
		return mView;
	}
	
	/*----------------------- 복권기금  -----------------------*/
	@RequestMapping("fund/1")
	public ModelAndView fund1(ModelAndView mView) {
		
		mView.setViewName("happy.fund.1");
		return mView;
	}
	
	@RequestMapping("fund/2")
	public ModelAndView fund2(ModelAndView mView) {
		
		mView.setViewName("happy.fund.2");
		return mView;
	}
	
	/*----------------------- 행복공감 봉사단  -----------------------*/
	@RequestMapping("service")
	public ModelAndView service(ModelAndView mView) {
		
		mView.setViewName("happy.service.1");
		return mView;
	}
	
	/*----------------------- 홍보센터  -----------------------*/
	@RequestMapping("promotion/1")
	public ModelAndView promotion1(ModelAndView mView) {
		
		mView.setViewName("happy.promotion.1");
		return mView;
	}
	@RequestMapping("promotion/2")
	public ModelAndView promotion2(ModelAndView mView) {
		
		mView.setViewName("happy.promotion.2");
		return mView;
	}
	@RequestMapping("promotion/3")
	public ModelAndView promotion3(ModelAndView mView) {
		
		mView.setViewName("happy.promotion.3");
		return mView;
	}
	
}
