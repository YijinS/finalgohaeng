package com.jscb.gohaeng.dao;

import java.util.List;



import com.jscb.gohaeng.dto.EventDto;

public interface EventDao {
	//글의 갯수
	public int getCount(EventDto eventDto);
	//글의 목록
	public List<EventDto> getList(EventDto eventDto);
	//글 정보 얻어오기 
	public EventDto getDetail(EventDto eventDto);
	//글 하나의 정보
	public EventDto getDetail(int index);
	//글 추가
	public void insert(EventDto eventDto);
	//글 수정 public void
	//update(EventDto eventDto);
	//글삭제
	//public void delete(int index);

}
