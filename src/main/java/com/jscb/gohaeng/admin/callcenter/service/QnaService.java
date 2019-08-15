package com.jscb.gohaeng.admin.callcenter.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

public interface QnaService {
	public void getList(HttpServletRequest request);
	public void getData(int index, ModelAndView mView);
	public void delete(int index);
}
