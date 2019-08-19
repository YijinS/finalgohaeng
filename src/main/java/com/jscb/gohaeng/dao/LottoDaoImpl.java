package com.jscb.gohaeng.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jscb.gohaeng.dto.LottoDto;

@Repository
public class LottoDaoImpl implements LottoDao {
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public void insert(List<LottoDto> list) {
		
		for(LottoDto dto : list) {
			sqlSession.insert("lotto.insert",dto);
		}
		
	}

	@Override
	public List<LottoDto> getList(int plIndex) {
		
		List<LottoDto> list;
		
		list = sqlSession.selectList("lotto.getList",plIndex);
		
		return list;
	}
	
	
}
