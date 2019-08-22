package com.jscb.gohaeng.guest.service;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.jscb.gohaeng.dto.MemberDto;

public interface GuestService {
	
	public Map<String,Object> checkID(String id);
	//public boolean checkEmail(MemberDto dto);
	public void addMember(HttpServletRequest request) throws ParseException, MessagingException, UnsupportedEncodingException;
	public Map<String,Object> checkLogin(String id,String pwd);
	public void successLogin(ModelAndView mView,HttpServletRequest request,HttpSession session);
	public void logout(HttpSession session);
	//public void emailAuth(HttpServletRequest request) throws MessagingException, UnsupportedEncodingException;
	public void userAuthStatus(String email);
	public void findid(String name, String email, ModelAndView mView);
	public void findpw(String id, String email, ModelAndView mView) throws MessagingException, UnsupportedEncodingException;
}
