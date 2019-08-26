package com.jscb.gohaeng.guest.controller;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public ModelAndView successLogin(ModelAndView mView, HttpServletRequest request, HttpSession session) {
		guestService.successLogin(mView, request, session);

		return mView;
	}

	@ResponseBody
	@RequestMapping("loginCheck")
	public Map<String, Object> loginCheck(String id, String pwd) {

		return guestService.checkLogin(id, pwd);
	}

	/*-------------------로그인 매핑-----------------------*/

	/*-------------------로그아웃 매핑-----------------------*/
	@RequestMapping("logout")
	public String logout(HttpSession session) {

		guestService.logout(session);

		return "redirect:/";
	}

	/*-------------------로그아웃 매핑-----------------------*/

	@GetMapping("signup")
	public String signupform() {
		return "guest.signupform";
	}

	@PostMapping("signup")
	public String signup(HttpServletRequest request)
			throws ParseException, UnsupportedEncodingException, MessagingException {

		guestService.addMember(request);

		return "guest.finishsignup";
	}

	@ResponseBody
	@RequestMapping("ajax")
	public Map<String, Object> checkId(String id) {
		return guestService.checkID(id);
	}

	/*-------------------email인증-----------------------*/

	@RequestMapping("emailConfirm")
	public ModelAndView emailConfirm(String email, ModelAndView mView) throws Exception { // 이메일인증
		System.out.println("emailconfirm------>"+email);
		guestService.userAuthStatus(email);
		mView.addObject("email", email);
		mView.setViewName("guest/emailConfirm");
		return mView;
	}

//	@RequestMapping("emailAuth")
//	public ModelAndView emailAuth(HttpServletRequest request) throws MessagingException, UnsupportedEncodingException {
//		System.out.println("email-------->"+request.getParameter("email"));
//		guestService.emailAuth(request);
//		ModelAndView mView = new ModelAndView();
//		mView.setViewName("guest/emailauth");
//		return mView;
//	}
	
	/*-------------------id/pwd찾기-----------------------*/
	@RequestMapping("findidpw")
	public ModelAndView findidpw(ModelAndView mView) {
		mView.setViewName("guest.findidpw");
		return mView;
	}
	
	/*-------------------id찾기-----------------------*/
	@PostMapping("findid")
	public ModelAndView findid(@RequestParam(name="name")String name
			,@RequestParam(name="email")String email
			, ModelAndView mView) {
		guestService.findid(name,email,mView);
		mView.setViewName("guest.findid");
		return mView;
	}
	
	/*-------------------pw찾기-----------------------*/
	@PostMapping("findpw")
	public ModelAndView findpw(@RequestParam(name="id")String id
			,@RequestParam(name="email")String email,
			ModelAndView mView) throws UnsupportedEncodingException, MessagingException {
		
		guestService.findpw(id,email,mView);
		mView.setViewName("guest.findpw");
		return mView;
	}

}
