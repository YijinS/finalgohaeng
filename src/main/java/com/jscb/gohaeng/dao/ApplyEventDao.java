package com.jscb.gohaeng.dao;

import com.jscb.gohaeng.dto.ApplyEventDto;

public interface ApplyEventDao {
	
	public int insert(ApplyEventDto applyEventDto);
	public boolean isExist(int eventIndex, String memberId);
	public ApplyEventDto getDetail(ApplyEventDto applyEventDto);
	
}
