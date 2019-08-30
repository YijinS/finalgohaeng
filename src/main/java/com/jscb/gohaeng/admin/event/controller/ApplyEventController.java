package com.jscb.gohaeng.admin.event.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jscb.gohaeng.admin.event.service.ApplyEventService;

@RequestMapping("/admin/event/management/")
@Controller
public class ApplyEventController {

	@Autowired
	private ApplyEventService applyEventService;
	
	@RequestMapping("list")
	public ModelAndView appliedMemberList(ModelAndView mView
			, HttpServletRequest request) {
		
		applyEventService.getAppliedMemberList(request);
		mView.setViewName("admin.event.management.list");
		return mView;
	}
	
	@RequestMapping(value = "draw", method = RequestMethod.POST)
	@ResponseBody
	public Object draw(@RequestParam(value = "indexList[]") List<String> indexList) {
		applyEventService.drawMemberList(indexList);
		Map<String, Object> retVal = new HashMap<String, Object>();
        
        //성공했다고 처리
        retVal.put("code", "OK");
        retVal.put("message", "선택된 아이디가 추첨되었습니다.");
        
        return retVal;
	}
	
	@RequestMapping(value = "drop", method = RequestMethod.POST)
	@ResponseBody
	public Object drop(@RequestParam(value = "indexList[]") List<String> indexList) {
		applyEventService.dropMemberList(indexList);
		Map<String, Object> retVal = new HashMap<String, Object>();
        
        //성공했다고 처리
        retVal.put("code", "OK");
        retVal.put("message", "선택된 아이디가 낙첨되었습니다.");
        
        return retVal;
	}
	
}

















