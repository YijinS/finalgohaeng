package com.jscb.gohaeng.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jscb.gohaeng.dto.EventDto;

@Repository
public class EventDaoImpl implements EventDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int getCount(EventDto eventDto) {
		
		return sqlSession.selectOne("event.getCount", eventDto);
	}

	@Override
	public List<EventDto> getList(EventDto eventDto) {
		
		return sqlSession.selectList("event.getList", eventDto);
	}

	@Override
	public EventDto getDetail(EventDto eventDto) {
		
		return sqlSession.selectOne("event.getDetail", eventDto);
	}

	@Override
	public EventDto getDetail(int index) {
		
		return sqlSession.selectOne("event.getDetail2", index);
	}

	@Override
	public void insert(EventDto eventDto) {
		
		sqlSession.selectOne("event.insert", eventDto);
	}


}
