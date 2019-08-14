package com.jscb.gohaeng.admin.notice.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jscb.gohaeng.admin.notice.service.NoticeService;
@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("/admin/notice/list")
	public ModelAndView list(HttpServletRequest request) {	
		noticeService.getList(request);
		return new ModelAndView("admin.notice.list");
	}
	
	@RequestMapping("/admin/notice/detail")
	public ModelAndView detail(@RequestParam int index, 
			ModelAndView mView) {
		noticeService.getData(index, mView);
		mView.setViewName("admin.notice.detail");
		return mView;
	}
	
	@RequestMapping("/admin/notice/delete")
	public String delete(@RequestParam int index) {
		noticeService.delete(index);
		return "admin.notice.delete";
	}

}
