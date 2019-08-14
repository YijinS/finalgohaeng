package com.jscb.gohaeng.dao;

import java.util.List;

import com.jscb.gohaeng.dto.NoticeDto;

public interface NoticeDao {
	// 글의 갯수
	public int getCount(NoticeDto dto);
	//글 목록을 리턴하는 메소드
	public List<NoticeDto> getList(NoticeDto dto);
	// 글 한개의 정보를 리턴하는 메소드
	public NoticeDto getData(int index);
	// 글 한개의 정보를 삭제하는 메소드
	public void delete(int index);
	//조회수 증가 시키기
	public void addHitCount(int index);
}
