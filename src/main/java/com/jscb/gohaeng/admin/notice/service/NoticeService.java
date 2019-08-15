package com.jscb.gohaeng.admin.notice.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

public interface NoticeService {
	public void getList(HttpServletRequest request);
	public void getData(int index, ModelAndView mView);
	public void delete(int index);
}
