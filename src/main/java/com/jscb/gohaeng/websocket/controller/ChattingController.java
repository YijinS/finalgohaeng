package com.jscb.gohaeng.websocket.controller;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jscb.gohaeng.dto.MemberDto;

@Controller
public class ChattingController {
	
	@RequestMapping(value="/chatting", method = RequestMethod.GET)
	public ModelAndView chat(ModelAndView mv, HttpSession session) {
		
		MemberDto member = (MemberDto)session.getAttribute("member");
		
		mv.setViewName("chat/chattingview2");
		mv.addObject("member",member);
		
		System.out.println("user name : " + member.getName());
		
		System.out.println("normal chat page");
		
		mv.addObject("userid", member.getId());
		mv.addObject("name", member.getName());
		
		return mv;
		
	}

}
