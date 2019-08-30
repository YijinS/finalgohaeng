package com.jscb.gohaeng.callcenter.controller;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.jscb.gohaeng.admin.callcenter.service.QnaService;
import com.jscb.gohaeng.callcenter.service.FaqService;
import com.jscb.gohaeng.dto.QnaDto;

@RequestMapping("/callcenter/")
@Controller
public class CallcenterController {

	@Autowired
	private FaqService faqservice;

	@Autowired
	private QnaService qnaservice;
	
	/*----------------------- 건전한 복권문화  -----------------------*/
	@RequestMapping("info")
	public ModelAndView info(ModelAndView mView) {

		mView.setViewName("callcenter.info.1");
		return mView;
	}

	/*----------------------- 자주묻는질문  -----------------------*/

	@RequestMapping("faq/all")
	public ModelAndView faqAll(HttpServletRequest request, ModelAndView mView) {
		int category = 5;
		faqservice.getList(request, category);
		// System.out.println("category"+category);
		mView.setViewName("callcenter.faq.1");
		return mView;
	}


	 @RequestMapping("faq/lotto") 
	 public ModelAndView faqLotto(HttpServletRequest request, ModelAndView mView) { 
		int category = 1;
		faqservice.getList(request, category);
		mView.setViewName("callcenter.faq.2"); 
		return mView; 
		
	 }
	 
	 @RequestMapping("faq/pension") 
	 public ModelAndView faqPension(HttpServletRequest request, ModelAndView mView) {
		 int category = 2;
		 faqservice.getList(request, category);
		 mView.setViewName("callcenter.faq.3"); 
		 return mView; 
	 }
	 
	 @RequestMapping("faq/etc") 
	 public ModelAndView faqEtc(HttpServletRequest request, ModelAndView mView) { 
		 int category = 3;
		 faqservice.getList(request, category);
		 mView.setViewName("callcenter.faq.4"); 
		 return mView; 
	 }
	 

	/*----------------------- 1:1상담  -----------------------*/
	@RequestMapping("qna/list")
	public ModelAndView authlist(ModelAndView mView, HttpServletRequest request
			, HttpSession session) {
		qnaservice.getMyList(mView, session,request);
		mView.setViewName("callcenter.qna.list");
		return mView;
	}

	@GetMapping("qna/insertform")
	public ModelAndView insertform(ModelAndView mView) {
		mView.setViewName("callcenter.qna.insertform");
		return mView;
	}
	@PostMapping("qna/insert")
	public ModelAndView insert(ModelAndView mView, HttpServletRequest request
			, HttpSession session) {
		qnaservice.insert(request,session);
		mView.setViewName("callcenter.qna.insert");
		return mView;
	}

	@RequestMapping("qna/detail")
	public ModelAndView detail(@RequestParam int index, ModelAndView mView) {
		qnaservice.getData(index, mView);
		mView.setViewName("callcenter.qna.detail");
		return mView;
	}
	@RequestMapping("qna/delete")
	public String delete(@RequestParam int index) {
		qnaservice.delete(index);
		return "redirect:/callcenter/qna/list";
	}
	@GetMapping("qna/update")
	public ModelAndView update(@RequestParam int index, ModelAndView mView) {
		qnaservice.getData(index, mView);
		mView.setViewName("callcenter.qna.update");
		return mView;
	}
	@PostMapping("qna/update")
	public String update1(HttpServletRequest request) {
		qnaservice.update(request);
		return "redirect:/callcenter/qna/list";
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
