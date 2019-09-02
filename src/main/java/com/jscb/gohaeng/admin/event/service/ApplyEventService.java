package com.jscb.gohaeng.admin.event.service;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

public interface ApplyEventService {

	public void getAppliedMemberList(HttpServletRequest request);
	public void drawMemberList(List<Map<String,Object>> list);
	public void dropMemberList(List<Map<String,Object>> list);
	
}
