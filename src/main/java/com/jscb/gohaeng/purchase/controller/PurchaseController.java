package com.jscb.gohaeng.purchase.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jscb.gohaeng.purchase.service.PurchaseService;

@RequestMapping("/purchase/")
@Controller
public class PurchaseController {
	
	@Autowired
	PurchaseService purchaseService;
	
	@GetMapping("lotto645")
	public ModelAndView authLotto645(HttpServletRequest request
			,ModelAndView mView) {
		
		mView.setViewName("purchase.test");
		return mView;
	}
	
	@PostMapping("lotto645")
	public ModelAndView lotto645a(ModelAndView mView
			,HttpServletRequest request
			,HttpSession session) {
		
		purchaseService.buyLotto(mView, request, session);
		
		return mView;
	}
	
	/*
	@RequestMapping("lotto645")
	public String lotto645() {
	
		return "purchase/lotto645";
	}
	*/
	
	@RequestMapping("pension520")
	public String pension520() {
	
		return "purchase/pension520";
	}
}
