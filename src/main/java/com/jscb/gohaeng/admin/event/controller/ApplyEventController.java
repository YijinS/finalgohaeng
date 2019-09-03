package com.jscb.gohaeng.admin.event.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.google.common.reflect.TypeToken;
import com.google.gson.Gson;
import com.jscb.gohaeng.admin.event.service.ApplyEventService;

@RequestMapping("/admin/event/management/")
@Controller
public class ApplyEventController {
	
	@Autowired
	private ApplyEventService applyEventService;
	/*
	@RequestMapping("list")
	public ModelAndView appliedMemberList(ModelAndView mView
			, HttpServletRequest request) {
		
		applyEventService.getAppliedMemberList(request);
		mView.setViewName("admin.event.management.list");
		return mView;
	}
	*/
	@RequestMapping("list")
	public ModelAndView appliedMemberList(ModelAndView mView
			,@RequestParam(name = "page",defaultValue = "1") Integer page
			,@RequestParam(name = "condition",defaultValue = "") String condition
			,@RequestParam(name = "keyword",defaultValue = "") String keyword) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("page", page);
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		mView.addObject("save", map);
		mView.addObject("data", applyEventService.getApplyEventList(map));
		mView.setViewName("admin.event.management.list");
		return mView;
	}
	
	
	@RequestMapping(value = "draw", method = RequestMethod.POST)
	@ResponseBody
	public Object draw(@RequestParam String jsonData) {
		
		Gson gson = new Gson();
		List<Map<String,Object>> list = gson.fromJson(jsonData, new TypeToken<List<Map<String,Object>>>() {
		}.getType());
		
		System.out.println();
		System.out.println();
		for (Map<String, Object> map: list) {
			System.out.println(map.get("index"));
			System.out.println(map.get("id"));
		}
		System.out.println();
		System.out.println();
		
		applyEventService.drawMemberList(list);
		
		Map<String, Object> retVal = new HashMap<String, Object>();
        
        //성공했다고 처리
        retVal.put("code", "OK");
        retVal.put("message", "선택된 아이디가 추첨되었습니다.");
        
        return retVal;
	}
	
	@RequestMapping(value = "drop", method = RequestMethod.POST)
	@ResponseBody
	public Object drop(@RequestParam String jsonData) {
		
		Gson gson = new Gson();
		List<Map<String,Object>> list = gson.fromJson(jsonData, new TypeToken<List<Map<String,Object>>>() {
		}.getType());
		
		System.out.println();
		System.out.println();
		for (Map<String, Object> map: list) {
			System.out.println(map.get("index"));
			System.out.println(map.get("id"));
		}
		System.out.println();
		System.out.println();
		
		applyEventService.dropMemberList(list);
		
		Map<String, Object> retVal = new HashMap<String, Object>();
        
        //성공했다고 처리
        retVal.put("code", "OK");
        retVal.put("message", "선택된 아이디가 낙첨되었습니다.");
        
        return retVal;
	}
	
}

















