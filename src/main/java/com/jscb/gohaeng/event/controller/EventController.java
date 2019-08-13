package com.jscb.gohaeng.event.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jscb.gohaeng.admin.event.service.EventService;

@Controller
public class EventController {

	@Autowired
	private EventService eventService;

	@RequestMapping("/event/list")
	public String list(HttpServletRequest request) {

		eventService.getEventList(request);
		
		return  "event.list" ;
	}

	@RequestMapping("/event/detail")
	public String detail(HttpServletRequest request) {
		
		eventService.getEventDetail(request);
		
		return "event.detail";
	}
	
}
