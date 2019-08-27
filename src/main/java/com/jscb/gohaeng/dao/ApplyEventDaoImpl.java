package com.jscb.gohaeng.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jscb.gohaeng.dto.ApplyEventDto;

@Repository
public class ApplyEventDaoImpl implements ApplyEventDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(ApplyEventDto applyEventDto) {
		
		sqlSession.insert("apply.insert", applyEventDto);
		
	}

}
