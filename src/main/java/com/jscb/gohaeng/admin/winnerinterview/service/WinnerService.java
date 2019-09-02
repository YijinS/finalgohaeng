package com.jscb.gohaeng.admin.winnerinterview.service;

import javax.servlet.http.HttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.jscb.gohaeng.dto.WinnerDto;

public interface WinnerService {
	public void getList(HttpServletRequest request);
	public void getData(ModelAndView mView, int wiIndex);
	public void delete(int wiIndex);
	public void insert(WinnerDto dto);
	public void update(WinnerDto dto);
}
