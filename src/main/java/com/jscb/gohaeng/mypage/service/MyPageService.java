package com.jscb.gohaeng.mypage.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.jscb.gohaeng.dto.DepositDto;

public interface MyPageService {
	
	public void chargeDeposit(HttpServletRequest request,HttpSession session);
	public void withDraw(HttpServletRequest request,HttpSession session);
	public void getDepositHistory(ModelAndView mView,HttpSession session);
	public void getWithDrawList(ModelAndView mView, HttpSession session);
}
