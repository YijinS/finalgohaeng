package com.jscb.gohaeng.guest.service;

import java.text.ParseException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.jscb.gohaeng.dto.MemberDto;

public interface GuestService {
	
	public Map<String,Object> checkID(String id);
	//public boolean checkEmail(MemberDto dto);
	public void addMember(HttpServletRequest request) throws ParseException;
	public Map<String,Object> checkLogin(String id,String pwd);
	public void successLogin(String id,HttpSession session);
	public void logout(HttpSession session);
}
