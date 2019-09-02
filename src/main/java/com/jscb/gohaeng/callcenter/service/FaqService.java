package com.jscb.gohaeng.callcenter.service;

import javax.servlet.http.HttpServletRequest;

public interface FaqService {
	public void getList(HttpServletRequest request, int category);
}
