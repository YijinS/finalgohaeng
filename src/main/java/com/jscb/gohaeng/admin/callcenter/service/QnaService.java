package com.jscb.gohaeng.admin.callcenter.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

public interface QnaService {
	public void getList(HttpServletRequest request);
	public void getData(int index, ModelAndView mView);
	public void delete(int index);
	public void insert(HttpServletRequest request,HttpSession session);
	public void getMyList(ModelAndView mView,HttpSession session,HttpServletRequest request);
	public void update(HttpServletRequest request);
	public void replyinsert(String reply, int index);
	public void replydelete(int index);
}
