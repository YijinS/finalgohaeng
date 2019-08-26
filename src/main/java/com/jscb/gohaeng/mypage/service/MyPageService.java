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
	public void getPurchaseList(ModelAndView mView, HttpSession session);
	public void viewPurchasedLotto(ModelAndView mView,Integer plIndex);
	public void changepwd(ModelAndView mView,HttpSession session, String pwd, String newpwd);
	//public void checkpwd(ModelAndView mView, String pwd, HttpSession session);
}
