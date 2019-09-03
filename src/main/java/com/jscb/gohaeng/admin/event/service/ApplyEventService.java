package com.jscb.gohaeng.admin.event.service;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.jscb.gohaeng.dto.ApplyEventDto;

public interface ApplyEventService {

	public Map<String,Object> getApplyEventList(Map<String,Object> map);
	public void drawMemberList(List<Map<String,Object>> list);
	public void dropMemberList(List<Map<String,Object>> list);
	
}
