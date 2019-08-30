package com.jscb.gohaeng.event.controller;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.jscb.gohaeng.event.service.EventService;
import com.jscb.gohaeng.dto.ApplyEventDto;
import com.jscb.gohaeng.dto.EventCommentDto;

@RequestMapping("/event/")
@Controller
public class EventController {

	@Autowired
	private EventService eventService;

	@RequestMapping("list")
	public String list(HttpServletRequest request) {
		eventService.getEventList(request);
		return  "event.list" ;
	}

	@RequestMapping("detail")
	public String detail(HttpServletRequest request) {
		eventService.getEventDetail(request);
		return "event.detail";
	}
	
	//댓글 추가 요청 처리
	@RequestMapping(value = "commentinsert", method = RequestMethod.POST)
	public ModelAndView authCommentInsert(HttpServletRequest request,
			@RequestParam(name="eventIndex") int index, ModelAndView mView) {
		System.out.println();
		System.out.println("***ㅅㅅㅅㅅㄱㄱㄱㄱㅅㅅㅅㄱㄱㄱㄱㄱ**************"+index+" ㅅㅅㅅㄱㄱㄱㄱ      *************");
		System.out.println();
		eventService.saveComment(request);
		mView.setViewName("redirect:/event/detail?index="+index);
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

	//이벤트 신청 처리
	@ResponseBody
	@RequestMapping(value = "applyevent")
	public Map<String,Object> applyevent(@ModelAttribute ApplyEventDto applyEventDto
			, @RequestParam(name="eventIndex") int index
			, @RequestParam(name="memberId") String id) {

		applyEventDto.setId(id);
		applyEventDto.setIndex(index);
		boolean bl = eventService.applyEvent(applyEventDto);
		Map<String,Object> map = new HashMap<>();
		map.put("isSuccess", bl);
		return map;
	}
		
}
