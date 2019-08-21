package com.jscb.gohaeng.admin.event.controller;

import java.text.ParseException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jscb.gohaeng.admin.event.service.EventService;
import com.jscb.gohaeng.dto.EventDto;
//3.0버전
@RequestMapping("/admin/event/")
@Controller("adminEventController")
public class EventController {

	@Autowired
	private EventService eventService;

	
	@RequestMapping("list")
	public ModelAndView list(HttpServletRequest request) {

		eventService.getEventList(request);
		
//		mView.setViewName("admin.event.list");
		
		return new ModelAndView("admin.event.list");
	}

	@RequestMapping("detail")
	public String detail(HttpServletRequest request) {
		
		eventService.getEventDetail(request);
		
		return "admin.event.detail";
	}
	

	//새글 추가 폼 요청 처리
	@RequestMapping("insertform")
	public ModelAndView insertform
			(HttpServletRequest request){
		
		return new ModelAndView("admin.event.insertform");
	}
	
	
	//새글 추가 요청 처리
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	//@Temporal(TemporalType.DATE)
	@RequestMapping(value="insert",
			method=RequestMethod.POST)
	public ModelAndView insert(HttpServletRequest request) throws ParseException{
		System.out.println("컨트롤러********************************************************************");
		//dto.setStartDate(startDate1);
		//dto.setEndDate(endDate1);
		eventService.regEvent(request);
		//글 목록 보기로 리다일렉트 이동 
		return new ModelAndView("redirect:/admin/event/list");
	}
	
	
	
	
	
	
	/* ---------------- 이벤트 추첨관리 컨트롤러 ---------------- */
	/*
	@RequestMapping(value = "management", method = RequestMethod.GET)
	public ModelAndView manageEventList(ModelAndView mView) {
		
		mView.setViewName("admin.event.magagement.list");
		
		return mView;
	}
	
	@RequestMapping(value = "management", method = RequestMethod.POST)
	public ModelAndView manageEventList(HttpServletRequest request) {
		
		applyEventService.
		mView.setViewName("admin.event.magagement.list");
		
		return mView;
	}
	*/
	
	
}
//4.0버전
//@Controller
//@RequestMapping("/admin/event/")
//public class EventController {
//
//	@Autowired
//	private EventService eventService;
//
//	@GetMapping("list")
//	public String list(HttpServletRequest request, Model model) {
//		
//		eventService.getEventList(request);
//		
//		return "admin.event.list";
//	}
//}
