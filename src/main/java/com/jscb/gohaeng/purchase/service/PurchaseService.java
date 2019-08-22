package com.jscb.gohaeng.purchase.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

public interface PurchaseService {
	public void buyLotto(ModelAndView mView, HttpServletRequest request,HttpSession session);
	public void getPurchaseData(ModelAndView mView);
}
