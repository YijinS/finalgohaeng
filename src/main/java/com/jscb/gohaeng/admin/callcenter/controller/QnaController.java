package com.jscb.gohaeng.admin.callcenter.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jscb.gohaeng.admin.callcenter.service.QnaService;

@Controller
public class QnaController {
	
	@Autowired
	private QnaService qnaservice;
	
	@RequestMapping("/admin/callcenter/qna/list")
	public ModelAndView list(HttpServletRequest request) {
		qnaservice.getList(request);
		//radio버튼 값 전달되는지 확인해봄.
		//System.out.println("searchType---->"+request.getParameter("searchType"));
		return new ModelAndView("admin.callcenter.qna.list");
	}
	
	@RequestMapping("/admin/callcenter/qna/detail")
	public ModelAndView detail(@RequestParam int index,
			ModelAndView mView) {
		qnaservice.getData(index, mView);
		mView.setViewName("admin.callcenter.qna.detail");
		return mView;
	}
	
	@RequestMapping("admin/callcenter/qna/delete")
	public String delete(@RequestParam int index) {
		qnaservice.delete(index);
		return "admin.callcenter.qna.delete";
	}

}
