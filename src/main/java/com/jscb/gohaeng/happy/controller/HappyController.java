package com.jscb.gohaeng.happy.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jscb.gohaeng.happy.service.HappyService;

@RequestMapping("/happy/")
@Controller
public class HappyController {
	
	@Autowired
	HappyService happyService;
	
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
	public ModelAndView promotion3(ModelAndView mView
			,@RequestParam(name="page",defaultValue = "1") Integer page
			,@RequestParam(name="condition",defaultValue = "") String condition
			,@RequestParam(name="keyword",defaultValue = "") String keyword) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("page",page);
		map.put("condition",condition);
		map.put("keyword",keyword);
		
		mView.addObject("save",map);
		mView.addObject("data",happyService.getNoticeList(map));
		mView.setViewName("happy.promotion.3");
		return mView;
	}
	@RequestMapping("promotion/3_detail")
	public ModelAndView promotionDetail(ModelAndView mView
			,@RequestParam(name="index") Integer index
			,@RequestParam(name="page",defaultValue = "1") Integer page
			,@RequestParam(name="condition",defaultValue = "") String condition
			,@RequestParam(name="keyword",defaultValue = "") String keyword) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("page",page);
		map.put("condition",condition);
		map.put("keyword",keyword);
		
		mView.addObject("save",map);
		mView.addObject("dto",happyService.viewNoticeDetails(index));
		mView.setViewName("happy.promotion.3_detail");
		return mView;
	}
}
