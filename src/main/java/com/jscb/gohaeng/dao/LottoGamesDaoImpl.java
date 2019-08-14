package com.jscb.gohaeng.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jscb.gohaeng.dto.LottoGamesDto;

@Repository
public class LottoGamesDaoImpl implements LottoGamesDao {
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<LottoGamesDto> getList() {
		
		List<LottoGamesDto> list;
		list = sqlSession.selectList("LottoGames.getList");
		
		return list;
	}

	@Override
	public LottoGamesDto getData(int games) {
		
		LottoGamesDto dto;
		dto = sqlSession.selectOne("LottoGames.getData",games);
		
		return dto;
	}

	@Override
	public LottoGamesDto getLastData() {
		LottoGamesDto dto;
		dto = sqlSession.selectOne("LottoGames.getLastData");
		
		return dto;
	}

}
