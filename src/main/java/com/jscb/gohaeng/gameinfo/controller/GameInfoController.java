package com.jscb.gohaeng.gameinfo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/gameinfo/")
@Controller
public class GameInfoController {
	
	/*----------------------- 로또 6/45 매핑  -----------------------*/
	@RequestMapping("lotto645/1")
	public String info() {
		
		return "gameinfo.lotto645.1";
	}
	@RequestMapping("lotto645/2")
	public String purchase() {
		
		return "gameinfo.lotto645.2";
	}
	@RequestMapping("lotto645/3")
	public ModelAndView method(HttpServletRequest request,ModelAndView mView) {
		
		mView.setViewName("gameinfo.lotto645.3");
		return mView;
	}
	@RequestMapping("lotto645/4")
	public String drawshow() {
		
		return "gameinfo.lotto645.4";
	}
	@RequestMapping("lotto645/5")
	public String history() {
		
		return "gameinfo.lotto645.5";
	}
	
	/*----------------------- 로또 6/45 매핑  -----------------------*/
	
	
	
	
	/*----------------------- 연금520 매핑  -----------------------*/
	@RequestMapping("pension520/1")
	public String pensioninfo() {
		
		return "gameinfo.pension520.1";
	}
	@RequestMapping("pension520/2")
	public String pensionpurchase() {
		
		return "gameinfo.pension520.2";
	}
	@RequestMapping("pension520/3")
	public String pensionmethod() {
		
		return "gameinfo.pension520.3";
	}
	@RequestMapping("pension520/4")
	public String pensiondrawshow() {
		
		return "gameinfo.pension520.4";
	}
	
	/*----------------------- 연금520 매핑  -----------------------*/
	
}
