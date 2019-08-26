package com.jscb.gohaeng.mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jscb.gohaeng.dao.PurchaseLottoDao;
import com.jscb.gohaeng.dto.MemberDto;
import com.jscb.gohaeng.dto.StoreDto;
import com.jscb.gohaeng.dto.WidthdrawDto;
import com.jscb.gohaeng.mypage.service.MyPageService;

@RequestMapping("/mypage/")
@Controller
public class MyPageController {
	
	@Autowired
	MyPageService myPageService;

	
	/*-------------------------home 매핑------------------------*/
	@RequestMapping("home")
	public ModelAndView authHome(ModelAndView mView
			,HttpServletRequest request
			,HttpSession session) {
		
		myPageService.getPurchaseList(mView, session);
		mView.setViewName("mypage.home.1");
		return mView;
	}
	
	@RequestMapping("lottolist")
	public ModelAndView lottoList(ModelAndView mView
			,@RequestParam(name = "pi") Integer plIndex) {
		
		myPageService.viewPurchasedLotto(mView,plIndex);
		mView.setViewName("mypage/home/lottoList");
		return mView;
	}
	
	/*-------------------------home 매핑------------------------*/
	
	/*-------------------------예치금 매핑------------------------*/
	@RequestMapping("deposit/1")
	public ModelAndView history(ModelAndView mView,HttpSession session) {
		
		myPageService.getDepositHistory(mView,session);
		mView.setViewName("mypage.deposit.1");
		
		return mView;
	}
	
	@RequestMapping("deposit/2")
	public ModelAndView chargeInfo(ModelAndView mView) {
		
		
		mView.setViewName("mypage.deposit.2");
		
		return mView;
	}
	
	@GetMapping("deposit/2_1")
	public String charge() {
				
		return "mypage.deposit.2_1";
	}
	@PostMapping("deposit/2_1")
	public String charge2(HttpServletRequest request,HttpSession session) {
		
		myPageService.chargeDeposit(request, session);
		return "redirect:/mypage/home";	
	}
	
	
	@GetMapping("deposit/3")
	public ModelAndView withdraw(ModelAndView mView,HttpSession session) {
		
		myPageService.getWithDrawList(mView,session);
		mView.setViewName("mypage.deposit.3");
		
		return mView;
	}
	@PostMapping("deposit/3")
	public String withdraw(HttpServletRequest request,HttpSession session) {
		
		myPageService.withDraw(request, session);
		
		return "redirect:/mypage/deposit/3";
	}
	/*-------------------------예치금 매핑------------------------*/
	
	/*-------------------개인정보 수정 -----------------------*/
	@GetMapping("editData")
	public ModelAndView editDataform(ModelAndView mView, HttpSession session) {
		myPageService.getData(mView, session);
	
	
		mView.setViewName("mypage.personaldata.1");

		return mView;
	}
	
	@PostMapping("editData2")
	public String editData(ModelAndView mView, HttpServletRequest request, HttpSession session) {
		myPageService.update(request, session);
		myPageService.getData(mView, session); 
		return "mypage.personaldata.1edit";
	}
	/*
	 * @RequestMapping(value="editDataform" , method = {RequestMethod.GET,
	 * RequestMethod.POST }) public String editData(@ModelAttribute MemberDto dto) {
	 * myPageService.update(dto);
	 * 
	 * return "mypage.personaldata.1"; }
	 */
}
