package com.jscb.gohaeng.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jscb.gohaeng.dto.DrawShowDto;

@Repository
public class DrawShowDaoImpl implements DrawShowDao {

	@Autowired
	private SqlSession session;

	@Override
	public List<DrawShowDto> getList(DrawShowDto dto) {
		List<DrawShowDto> list = session.selectList("drawshow.getList", dto);
		return list;
	}

	@Override
	public void updateEnable(HashMap map) {
		session.update("drawshow.updateEnable", map);
		
	}

	@Override
	public void insert(DrawShowDto dto) {
		session.insert("drawshow.insert", dto);
		
	}

	@Override
	public int getCount(DrawShowDto dto) {
		return session.selectOne("drawshow.getCount", dto);
	}

	@Override
	public List<DrawShowDto> getMyList(DrawShowDto dto) {
		List<DrawShowDto> list = session.selectList("drawshow.getMyList", dto);
		return list;
	}

}
