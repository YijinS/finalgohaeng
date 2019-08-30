package com.jscb.gohaeng.admin.event.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

public interface ApplyEventService {

	public void getAppliedMemberList(HttpServletRequest request);

	public void drawMemberList(List<String> indexList);

	public void dropMemberList(List<String> indexList);
	
	
}
