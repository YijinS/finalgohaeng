package com.jscb.gohaeng.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jscb.gohaeng.dto.EventCommentDto;

@Repository
public class EventCommentDaoImpl implements EventCommentDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<EventCommentDto> getList(int eventIndex) {
		
		return sqlSession.selectList("eventComment.getList", eventIndex);
	}

	@Override
	public void delete(int eventCommentIndex) {
		
		sqlSession.update("eventComment.delete", eventCommentIndex);
	}

	@Override
	public void insert(EventCommentDto eventCommentDto) {
		
		sqlSession.insert("eventComment.insert", eventCommentDto);
	}

	@Override
	public int getSequence() {
		
		return sqlSession.selectOne("eventComment.getSequence");
	}

	@Override
	public void update(EventCommentDto eventCommentDto) {
		
		sqlSession.update("eventComment.update", eventCommentDto);
	}

}
