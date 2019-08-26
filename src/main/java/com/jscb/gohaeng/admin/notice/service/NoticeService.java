package com.jscb.gohaeng.admin.notice.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.jscb.gohaeng.dto.NoticeDto;

public interface NoticeService {
	public void getList(HttpServletRequest request);
	public void getData(int index, ModelAndView mView);
	public void delete(int index);
	public void regNotice(HttpServletRequest request);
	public void getUpdateData(ModelAndView mView, int index);
	public void updateNotice(NoticeDto dto);
}
