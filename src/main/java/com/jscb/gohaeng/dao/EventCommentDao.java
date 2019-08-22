package com.jscb.gohaeng.dao;

import java.util.List;

import com.jscb.gohaeng.dto.EventCommentDto;

public interface EventCommentDao {
	//댓글 목록
	public List<EventCommentDto> getList(int eventIndex);
	//댓글 삭제
	public void delete(int eventCommentIndex);
	//댓글 추가
	public void insert(EventCommentDto eventCommentDto);
	//추가할 댓글의 primary key 값 얻어오기
	public int getSequence();
	//댓글 수정
	public void update(EventCommentDto eventCommentDto);
}
