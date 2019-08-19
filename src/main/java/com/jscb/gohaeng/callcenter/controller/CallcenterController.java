package com.jscb.gohaeng.callcenter.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jscb.gohaeng.callcenter.service.QnaService;
import com.jscb.gohaeng.dto.QnaDto;

@RequestMapping("/callcenter/")
@Controller
public class CallcenterController {
	
//	@Autowired
//	private QnaService service;
	
	/*----------------------- 건전한 복권문화  -----------------------*/
	@RequestMapping("info")
	public ModelAndView info(ModelAndView mView) {
		
		mView.setViewName("callcenter.info.1");
		return mView;
	}
	
	/*----------------------- 자주묻는질문  -----------------------*/
	
	
	/*----------------------- 1:1상담  -----------------------*/
	@RequestMapping("qna/list")
	public ModelAndView list(ModelAndView mView) {
		mView.setViewName("callcenter.qna.list");
		return mView;
	}
	
	@RequestMapping("qna/insertform")
	public ModelAndView authInsertform(HttpServletRequest request) {
	
		return new ModelAndView("callcenter.qna.insertform");
	}
	
	@RequestMapping("qna/insert")
	public ModelAndView authInsert(HttpServletRequest request,
			@ModelAttribute QnaDto dto) {
		//세션에 있는 글작성자의 아이디
		String writer=(String)request.getSession().getAttribute("id");
		dto.setMemberId(writer);
		
		//service.insert(dto);
		return new ModelAndView("redirect:/qna/list.do");
		
	}
	
	/*----------------------- 모바일동행복권  -----------------------*/
	
	@RequestMapping("mobilelotto")
	public ModelAndView mobilelotto(ModelAndView mView) {
		
		mView.setViewName("callcenter.mobilelotto.1");
		return mView;
	}
	
	/*----------------------- 사용자가이드 -----------------------*/
	@RequestMapping("userguide/winner")
	public ModelAndView winnerguide(ModelAndView mView) {
		
		mView.setViewName("callcenter.userguide.1");
		return mView;
	}
	@RequestMapping("userguide/user")
	public ModelAndView userguide(ModelAndView mView) {
		
		mView.setViewName("callcenter.userguide.2");
		return mView;
	}

	
}
