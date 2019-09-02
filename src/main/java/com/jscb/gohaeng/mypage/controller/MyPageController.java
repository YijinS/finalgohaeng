package com.jscb.gohaeng.mypage.controller;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jscb.gohaeng.dto.MemberDto;
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
	
	/*-------------------------purchasewinning 매핑------------------------*/
	@RequestMapping("purchasewinning/1")
	public ModelAndView purchasewinning1(ModelAndView mView) {
		
		mView.setViewName("mypage.purchasewinning.1");
		return mView;
	}
	
	@RequestMapping("purchasewinning/2")
	public ModelAndView purchasewinning2(ModelAndView mView) {
		
		mView.setViewName("mypage.purchasewinning.2");
		return mView;
	}
	
	@RequestMapping("purchasewinning/3")
	public ModelAndView purchasewinning3(ModelAndView mView) {
		
		mView.setViewName("mypage.purchasewinning.3");
		return mView;
	}
	
	
	/*-------------------------purchasewinning 매핑------------------------*/
	
	/*-------------------------mystat 매핑------------------------*/
	@RequestMapping("mystat")
	public ModelAndView mystat(ModelAndView mView) {
		
		mView.setViewName("mypage.mystat.3");
		return mView;
	}
	/*-------------------------mystat 매핑------------------------*/
	
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
	@GetMapping("personaldata/editData")
	public ModelAndView autheditDataform(ModelAndView mView, HttpServletRequest request,  HttpSession session) {
		myPageService.getData(mView, session);
	
	
		mView.setViewName("mypage.personaldata.1");

		return mView;
	}
	
	@PostMapping("personaldata/editData2")
	public String editData(ModelAndView mView, HttpServletRequest request, HttpSession session) {
		myPageService.update(request, session);
		myPageService.getData(mView, session); 
		return "mypage.personaldata.1edit";
	}

	/*-------------------------개인정보 수정------------------------*/
	@GetMapping("personaldata/modifylogin")
	public ModelAndView modifylogin(ModelAndView mView
			,@RequestParam(name="url")String url) {
		mView.addObject("url",url);
		mView.setViewName("mypage.personaldata.modifylogin");
		return mView;
	}
	
	@PostMapping("personaldata/modifylogin1")
	public ModelAndView modifylogin1(HttpSession session
			,ModelAndView mView
			, HttpServletRequest request
			,@RequestParam(name="url")String url) {
		MemberDto member = (MemberDto)session.getAttribute("member");
		String check = "ok";
		if(BCrypt.checkpw(request.getParameter("pwd"), member.getPwd())){
			session.setAttribute("check", check);
		}
		System.out.println(url);
		if(url != null && !url.equals(""))
			mView.setViewName("redirect:"+url);
		else
			mView.setViewName("redirect:/");
		return mView;
	}
	/*-------------------------비밀번호 변경------------------------*/
	@GetMapping("personaldata/changepwd")
	public ModelAndView sosochangepwd(ModelAndView mView,HttpServletRequest request) {
		mView.setViewName("mypage.personaldata.changepwd");
		return mView;
	}
	
	@PostMapping("personaldata/changepwdupdate")
	public ModelAndView changepwd(ModelAndView mView,HttpSession session
			,@RequestParam(name="pwd")String pwd
			,@RequestParam(name="newpwd")String newpwd ) {
		myPageService.changepwd(mView,session,pwd,newpwd);
		mView.setViewName("mypage/personaldata/changepwdupdate");
		return mView;
	}
}
