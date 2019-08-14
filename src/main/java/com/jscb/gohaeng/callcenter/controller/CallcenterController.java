package com.jscb.gohaeng.callcenter.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/callcenter/")
@Controller
public class CallcenterController {
	
	/*----------------------- 건전한 복권문화  -----------------------*/
	@RequestMapping("info")
	public ModelAndView info(ModelAndView mView) {
		
		mView.setViewName("callcenter.info.1");
		return mView;
	}
	
	/*----------------------- 자주묻는질문  -----------------------*/
	
	
	/*----------------------- 1:1상담  -----------------------*/
	
	
	/*----------------------- 모바일동행복권  -----------------------*/
	
	@RequestMapping("mobilelotto")
	public ModelAndView mobilelotto(ModelAndView mView) {
		
		mView.setViewName("callcenter.mobilelotto.1");
		return mView;
	}
	
	/*----------------------- 사용자가이드 -----------------------*/
	@RequestMapping("userguide/winner")
	public ModelAndView winnerguide(ModelAndView mView) {
		
		mView.setViewName("callcenter.userguide.1");
		return mView;
	}
	@RequestMapping("userguide/user")
	public ModelAndView userguide(ModelAndView mView) {
		
		mView.setViewName("callcenter.userguide.2");
		return mView;
	}

	
}
