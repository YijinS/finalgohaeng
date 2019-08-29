package com.jscb.gohaeng.admin.event.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jscb.gohaeng.admin.event.service.ApplyEventService;

@RequestMapping("/admin/event/applyevent/")
@Controller
public class EventApplyController {

	@Autowired
	private ApplyEventService applyEventService;
	
	@RequestMapping("list")
	public ModelAndView appliedMemberList(ModelAndView mView) {
		mView.setViewName("admin.event.applyevent.list");
		return mView;
	}
	
}
