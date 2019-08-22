package com.jscb.gohaeng.admin.event.controller;

import java.beans.PropertyEditorSupport;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jscb.gohaeng.admin.event.service.EventService;
import com.jscb.gohaeng.dto.EventCommentDto;
import com.jscb.gohaeng.dto.EventDto;
//3.0버전
@RequestMapping("/admin/event/")
@Controller("adminEventController")
public class EventController {

	@Autowired
	private EventService eventService;

	@RequestMapping("list")
	public ModelAndView List(HttpServletRequest request) {

		eventService.getEventList(request);

		//		mView.setViewName("admin.event.list");

		return new ModelAndView("admin.event.list");
	}

	//이벤트 자세히 보기 요청처리
	@RequestMapping("detail")
	public String detail(HttpServletRequest request) {

		eventService.getEventDetail(request);

		return "admin.event.detail";
	}

	
	@RequestMapping("detail2")
	public String detail2(HttpServletRequest request) {
		
		eventService.getEventDetail(request);
		
		return "admin.event.detail2";
	}
	
	//댓글 추가 요청 처리
	@RequestMapping(value = "commentinsert", method = RequestMethod.POST)
	public ModelAndView authCommentInsert(HttpServletRequest request,
			@RequestParam int index, ModelAndView mView) {
		eventService.saveComment(request);
		mView.setViewName("redirect:/admin/event/detail?index="+index);
		return mView;
	}
	
	@RequestMapping(value = "commentupdate", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> authCommentUpdate(HttpServletRequest request,
			@ModelAttribute EventCommentDto eventCommentDto) {
		eventService.updateComment(eventCommentDto);
		// {"isSuccess":true} 형식의 json 문자열이 출력되도록 Map객체를 리턴해준다
		Map<String, Object> map = new HashMap<>();
		map.put("isSuccess", true);
		return map;
	}
	
	//댓글 삭제 요청 처리
	@RequestMapping(value = "commentdelete", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> authCommentDelete(HttpServletRequest request,
			@RequestParam int index) {
		
		//서비스를 이용해서 댓글 삭제 후
		eventService.deleteComment(index);
		//json 응답
		Map<String, Object> map = new HashMap<>();
		map.put("isSuccess", true);
		return map;
	}
	
	//새 이벤트 추가 폼 요청 처리

	@RequestMapping("insertform")
	public ModelAndView insertform
	(HttpServletRequest request){
		return new ModelAndView("admin.event.insertform");
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

	@RequestMapping(value="insert",
			method=RequestMethod.POST)
	public ModelAndView insert(HttpServletRequest request
			,@RequestParam(name="startDate", required = false) Date startDate
			,@RequestParam(name="endtDate", required = false) Date endDate
			,@RequestParam(name="drawtDate", required = false) Date drawDate
			,@ModelAttribute EventDto eventDto) {

		System.out.println("컨트롤러********************************************************************");
		eventDto.setStartDate(startDate);
		eventDto.setEndDate(endDate);
		eventDto.setDrawDate(drawDate);
		System.out.println(eventDto.getTitle());
		System.out.println(eventDto.getIndex());
		System.out.println(eventDto.getSubTitle());
		System.out.println(eventDto.getStartDate());
		System.out.println(eventDto.getEndDate());
		System.out.println(eventDto.getDrawDate());
		System.out.println(eventDto.getDisplay());
		System.out.println(eventDto.getContent());
		System.out.println("컨트롤러********************************************************************");

		//dto.setStartDate(startDate1);
		//dto.setEndDate(endDate1);
		eventService.regEvent(eventDto);

		//글 목록 보기로 리다일렉트 이동 
		return new ModelAndView("redirect:/admin/event/list");
	}






	/* ---------------- 이벤트 추첨관리 컨트롤러 ---------------- */
	/*
	@RequestMapping(value = "management", method = RequestMethod.GET)
	public ModelAndView manageEventList(ModelAndView mView) {

		mView.setViewName("admin.event.magagement.list");

		return mView;
	}

	@RequestMapping(value = "management", method = RequestMethod.POST)
	public ModelAndView manageEventList(HttpServletRequest request) {

		applyEventService.
		mView.setViewName("admin.event.magagement.list");

		return mView;
	}
	 */


}
//4.0버전
//@Controller
//@RequestMapping("/admin/event/")
//public class EventController {
//
//	@Autowired
//	private EventService eventService;
//
//	@GetMapping("list")
//	public String list(HttpServletRequest request, Model model) {
//		
//		eventService.getEventList(request);
//		
//		return "admin.event.list";
//	}
//}
