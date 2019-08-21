package com.jscb.gohaeng.admin.event.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jscb.gohaeng.admin.event.service.EventService;
import com.jscb.gohaeng.dto.EventDto;
//3.0버전
@Controller("adminEventController")
public class EventController {

	@Autowired
	private EventService eventService;

	@RequestMapping("/admin/event/list")
	public ModelAndView list(HttpServletRequest request) {

		eventService.getEventList(request);
		
//		mView.setViewName("admin.event.list");
		
		return new ModelAndView("admin.event.list");
	}

	@RequestMapping("/admin/event/detail")
	public String detail(HttpServletRequest request) {
		
		eventService.getEventDetail(request);
		
		return "admin.event.detail";
	}
	

	//새글 추가 폼 요청 처리
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	@RequestMapping("/admin/event/insertform")
	public ModelAndView insertform (HttpServletRequest request){
		
		return new ModelAndView("admin.event.insertform");
	}
	
	
	//새글 추가 요청 처리
	@RequestMapping(value="/admin/event/insert", method=RequestMethod.POST)
	public ModelAndView insert(HttpServletRequest request, @ModelAttribute EventDto dto){

		eventService.regEvent(dto);
		//글 목록 보기로 리다일렉트 이동 
		return new ModelAndView("redirect:/admin/event/list.do");
	}
	
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
