package com.jscb.gohaeng.happy.service;

import java.util.Map;

import com.jscb.gohaeng.dto.NoticeDto;


public interface HappyService {
	public Map<String,Object> getNoticeList(Map<String,Object> map);
	public NoticeDto viewNoticeDetails(int index);
}
