package com.jscb.gohaeng.websocket.controller;

import javax.servlet.http.HttpSession;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jscb.gohaeng.dto.MemberDto;

@Controller
public class ChattingController {
	
	@RequestMapping(value="/chatting.do", method = RequestMethod.GET)
	public ModelAndView chat(ModelAndView mv, HttpSession session) {
		
		MemberDto member = (MemberDto)session.getAttribute("member");
		
		mv.setViewName("chat/chattingview");
		mv.addObject("member",member);
		
		//사용자 정보 출력(세션)
		//시큐리티가 적용되 세션 값을 user를 이용해 불러온다
		//웹 소켓에서 사용하는 세션 값은 user의 값과 동일하다
		//스프링에선 시큐리티 통한 세션관리 권장 
		/*
		 * User user =
		 * (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		 */
//		오류!!! getAuthentication() returned null. It means that for Spring security, there is no currently authenticated user.
		
		
		
		System.out.println("user name : " + member.getId());
		
		System.out.println("normal chat page");
		
		mv.addObject("userid", member.getId());
		
		return mv;
		
	}

}
