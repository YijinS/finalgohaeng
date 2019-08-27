package com.jscb.gohaeng.admin.notice.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jscb.gohaeng.admin.notice.service.NoticeService;
import com.jscb.gohaeng.dto.NoticeDto;
@Controller
@RequestMapping("/admin/notice/")
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("list")
	public ModelAndView list(HttpServletRequest request) {	
		noticeService.getList(request);
		return new ModelAndView("admin.notice.list");
	}
	
	@RequestMapping("detail")
	public ModelAndView detail(@RequestParam int index, 
			ModelAndView mView) {
		noticeService.getData(index, mView);
		mView.setViewName("admin.notice.detail");
		return mView;
	}
	
	@RequestMapping("delete")
	public String delete(@RequestParam int index) {
		noticeService.delete(index);
		return "admin.notice.delete";
	}
	
	@RequestMapping("insertform")
	public ModelAndView insertform(HttpServletRequest request) {
		
		return new ModelAndView("admin.notice.insertform");
	}
	
	@RequestMapping(value = "insert", method = RequestMethod.POST)
	public ModelAndView insert(HttpServletRequest request) {
		
		noticeService.regNotice(request);
		return new ModelAndView("redirect:/admin/notice/list");
	}
	
	@RequestMapping("updateform")
	public ModelAndView updateform(HttpServletRequest request,
			@RequestParam int index, ModelAndView mView) {
		
		noticeService.getUpdateData(mView, index);
		mView.setViewName("admin.notice.updateform");
		return mView;
	}
	
	@RequestMapping("update")
	public ModelAndView update(HttpServletRequest request,
			@ModelAttribute NoticeDto dto) {
		
		noticeService.updateNotice(dto);
		return new ModelAndView("redirect:/admin/notice/detail?index="+dto.getIndex());
	}

}

























