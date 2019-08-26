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
	
	@RequestMapping("/admin/notice/insertform")
	public ModelAndView insertform(HttpServletRequest request) {
		
		return new ModelAndView("admin.notice.insertform");
	}
	
	@RequestMapping(value = "/admin/notice/insert", method = RequestMethod.POST)
	public ModelAndView insert(HttpServletRequest request) {
		
		noticeService.regNotice(request);
		return new ModelAndView("redirect:/admin/notice/list");
	}
	
	@RequestMapping("/admin/notice/updateform")
	public ModelAndView updateform(HttpServletRequest request,
			@RequestParam int index, ModelAndView mView) {
		
		noticeService.getUpdateData(mView, index);
		mView.setViewName("admin.notice.updateform");
		return mView;
	}
	
	@RequestMapping("/admin/notice/update")
	public ModelAndView update(HttpServletRequest request,
			@ModelAttribute NoticeDto dto) {
		
		noticeService.updateNotice(dto);
		return new ModelAndView("redirect:/admin/notice/detail?index="+dto.getIndex());
	}

}

























