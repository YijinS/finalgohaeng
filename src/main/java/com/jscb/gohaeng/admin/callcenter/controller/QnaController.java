package com.jscb.gohaeng.admin.callcenter.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jscb.gohaeng.admin.callcenter.service.QnaService;

@Controller
@RequestMapping("/admin/callcenter/")
public class QnaController {
	
	@Autowired
	private QnaService qnaservice;
	
	@RequestMapping("qna/list")
	public ModelAndView list(HttpServletRequest request) {
		qnaservice.getList(request);
		//radio버튼 값 전달되는지 확인해봄.
		//System.out.println("searchType---->"+request.getParameter("searchType"));
		return new ModelAndView("admin.callcenter.qna.list");
	}
	
	@RequestMapping("qna/detail")
	public ModelAndView detail(@RequestParam int index,
			ModelAndView mView) {
		qnaservice.getData(index, mView);
		mView.setViewName("admin.callcenter.qna.detail");
		return mView;
	}
	@PostMapping("qna/reply")
	public String reply(@RequestParam(name="reply") String reply,
			@RequestParam(name="index") int index) {
		qnaservice.replyinsert(reply,index);
		return "redirect:/admin/callcenter/qna/detail?index="+index;
	}
	
	@RequestMapping("qna/delete")
	public String delete(@RequestParam int index) {
		qnaservice.replydelete(index);
		return "redirect:/admin/callcenter/qna/detail?index="+index;
	}
	

}
