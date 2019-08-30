package com.jscb.gohaeng.dao;

import java.util.List;

import com.jscb.gohaeng.dto.ApplyEventDto;

public interface ApplyEventDao {
	//글의 갯수
	public int getCount(ApplyEventDto applyEventDto);
	//글의 목록
	public List<ApplyEventDto> getList(ApplyEventDto applyEventDto);
	public int insert(ApplyEventDto applyEventDto);
	public boolean isExist(int eventIndex, String memberId);
	public void updateWin(int index);
	public void updateLose(int index);
	
}
