package com.jscb.gohaeng.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jscb.gohaeng.dto.FaqDto;
@Repository
public class FaqDaoImpl implements FaqDao{
	
	@Autowired
	private SqlSession session;

	@Override
	public List<FaqDto> getList(FaqDto dto) {
		List<FaqDto> list = session.selectList("faq.getList", dto);
		return list;
	}


	@Override
	public int getCount(FaqDto dto) {
		return session.selectOne("faq.getCount", dto);

	}


}
