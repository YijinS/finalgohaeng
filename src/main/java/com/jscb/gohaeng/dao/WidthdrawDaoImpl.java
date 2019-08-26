package com.jscb.gohaeng.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jscb.gohaeng.dto.WidthdrawDto;

@Repository
public class WidthdrawDaoImpl implements WidthrawDao{

	@Autowired
	private SqlSession session;

	@Override
	public void insert(WidthdrawDto dto) {
		session.insert("widthdraw.insert", dto);
		
	}
	
	
	
}
