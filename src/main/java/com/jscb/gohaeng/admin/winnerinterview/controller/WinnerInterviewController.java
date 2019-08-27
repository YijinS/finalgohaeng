package com.jscb.gohaeng.admin.winnerinterview.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jscb.gohaeng.admin.winnerinterview.service.WinnerService;


@Controller
@RequestMapping("/admin/winner_interview/")
public class WinnerInterviewController{

	@Autowired
	private WinnerService winnerService;

	@RequestMapping("1")
	public ModelAndView list(ModelAndView mView) {
		
		winnerService.getList(mView);
		
		mView.setViewName("admin.winnerinterview.1");
		
		return mView;
		
	}
	
	@RequestMapping("1detail")
	public ModelAndView getData(ModelAndView mView, int wiIndex) {
		
		winnerService.getDate(mView, wiIndex);
		
		mView.setViewName("admin.winnerinterview.1detail");
		
		return mView;
		
	}

	@RequestMapping("1delete")
	public String delete(@RequestParam int wiIndex) {

		winnerService.delete(wiIndex);

		return "admin.winnerinterview.1delete";
	}
	

	

}
