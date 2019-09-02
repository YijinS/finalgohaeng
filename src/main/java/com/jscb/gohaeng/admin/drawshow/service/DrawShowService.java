package com.jscb.gohaeng.admin.drawshow.service;

import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

public interface DrawShowService {
	public void getList(HttpServletRequest request,int category);
	public void apply(HttpServletRequest request,HttpSession session) throws ParseException;
	public void getMyList(ModelAndView mView, HttpSession session,HttpServletRequest request);
}