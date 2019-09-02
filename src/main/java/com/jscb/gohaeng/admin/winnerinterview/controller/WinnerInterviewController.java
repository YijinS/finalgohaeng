package com.jscb.gohaeng.admin.winnerinterview.controller;

import java.beans.PropertyEditorSupport;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jscb.gohaeng.admin.winnerinterview.service.WinnerService;
import com.jscb.gohaeng.dto.EventDto;
import com.jscb.gohaeng.dto.NoticeDto;
import com.jscb.gohaeng.dto.StoreDto;
import com.jscb.gohaeng.dto.WinnerDto;


@Controller
@RequestMapping("/admin/winner_interview/")
public class WinnerInterviewController{

	@Autowired
	private WinnerService winnerService;

	@RequestMapping("1")
	public ModelAndView alist(ModelAndView mView, HttpServletRequest request) {
		winnerService.getList(request);
		
		mView.setViewName("admin.winnerinterview.1");
		
		return mView;
		
	}
	
	@RequestMapping("1detail")
	public ModelAndView getData(ModelAndView mView, int wiIndex) {
		
		winnerService.getData(mView, wiIndex);
		
		mView.setViewName("admin.winnerinterview.1detail");
		
		return mView;
		
	}
	
	//새글 추가 폼 요청 처리
		@RequestMapping("1insertform")
		public ModelAndView insertform (HttpServletRequest request){

			return new ModelAndView("admin.winnerinterview.1insertform");
		}
		
		@InitBinder
		public void initBinder(WebDataBinder binder) throws Exception {
		    binder.registerCustomEditor(Date.class, new PropertyEditorSupport() {

		        public void setAsText(String text) throws IllegalArgumentException {
		            try {
		                setValue(new SimpleDateFormat("yyyy-MM-dd").parse(text));
		            } catch (ParseException e) {
		                setValue(null);
		            }
		        }
		    });
		}
		
		
		//새 이벤트 추가 요청 처리

		@RequestMapping(value="1insert",
				method=RequestMethod.POST)
		public String insert(HttpServletRequest request
				,@RequestParam(name="wiDrawDate", required = false) Date wiDrawDate
				,@ModelAttribute WinnerDto dto) {
			System.out.println("dto"+dto);
			winnerService.insert(dto);
			return "admin.winnerinterview.1insert";
		}
		
		


	  @RequestMapping("1editform") 
	  public ModelAndView updateForm(@RequestParam int wiIndex, ModelAndView mView) {
		  winnerService.getData(mView, wiIndex);
		  mView.setViewName("admin.winnerinterview.1editform"); 
	  return mView; 
	  }

		
	  @RequestMapping(value="1edit",
				method=RequestMethod.POST)
		public String update(HttpServletRequest request
				,@RequestParam(name="wiDrawDate", required = false) Date wiDrawDate
				,@ModelAttribute WinnerDto dto) {
			
			winnerService.update(dto);
			return "admin.winnerinterview.1edit";
			
		}
	  
	  
	@RequestMapping("1delete")
	public String delete(@RequestParam int wiIndex) {

		winnerService.delete(wiIndex);

		return "admin.winnerinterview.1delete";
	}
	

	

}
