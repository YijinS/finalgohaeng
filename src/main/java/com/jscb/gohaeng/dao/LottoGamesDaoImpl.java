package com.jscb.gohaeng.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<LottoGamesDto> getList(int start, int end) {
		
		List<LottoGamesDto> list;
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("start",start);
		map.put("end",end);

		
		list = sqlSession.selectList("LottoGames.getList", map);
		
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

	@Override
	public void lottoDrawInsert(LottoGamesDto dto) {
		sqlSession.insert("LottoGames.insert", dto);
		
	}

	@Override
	public int getLastGames(int games) {
		return ((Integer)sqlSession.selectOne("LottoGames.getLastGames", games)).intValue();
	}

	@Override
	public List<Integer> getGames() {

		List<Integer> games = sqlSession.selectList("LottoGames.getGames");
		
		return games;
	}

	

	
}
