package com.jscb.gohaeng.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.jscb.gohaeng.dto.LottoGamesDto;

public class ExcelDaoImpl implements ExcelDao {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public LottoGamesDto getData(int games) {
		LottoGamesDto dto;
		dto = sqlSession.selectOne("LottoGames.getData",games);
		
		return dto;
	}

}
