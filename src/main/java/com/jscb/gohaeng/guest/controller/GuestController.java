package com.jscb.gohaeng.guest.controller;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jscb.gohaeng.dto.MemberDto;
import com.jscb.gohaeng.guest.service.GuestService;

@RequestMapping("/guest/")
@Controller
public class GuestController {

	@Autowired
	private GuestService guestService;

	/*-------------------로그인 매핑-----------------------*/
	@GetMapping("login")
	public String login() {
		return "guest.login";
	}
	
	@PostMapping("login")
	public String successLogin(String id,HttpSession session) {
		guestService.successLogin(id, session);
		
		return "redirect:/home";
	}

	@ResponseBody
	@RequestMapping("loginCheck")
	public Map<String,Object> loginCheck(String id,String pwd) {
		
		return guestService.checkLogin(id, pwd);			
	}
	
	/*-------------------로그인 매핑-----------------------*/
	
	
	
	
	/*-------------------로그아웃 매핑-----------------------*/
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		
		guestService.logout(session);
		
		return "redirect:/home";
	}
	
	/*-------------------로그아웃 매핑-----------------------*/
	
	@GetMapping("signup")
	public String signupform() {
		return "guest.signupform";
	}
	
	@PostMapping("signup")
	public String signup(HttpServletRequest request) throws ParseException {
		
		guestService.addMember(request);
		
		return "guest.finishsignup";
	}

	@ResponseBody
	@RequestMapping("ajax")
	public Map<String,Object> checkId(String id){ 
		return guestService.checkID(id);
	}

}






