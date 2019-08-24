package com.jscb.gohaeng.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jscb.gohaeng.dto.PurchaseLottoDto;

@Repository
public class PurchaseLottoDaoImpl implements PurchaseLottoDao {
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public void insert(PurchaseLottoDto dto) {
		
		sqlSession.insert("purchaseLotto.insert",dto);

	}

	@Override
	public int getLastIndex() {
		
		int index;
		index = sqlSession.selectOne("purchaseLotto.getLastIndex");
		return index;
	}


	@Override
	public List<PurchaseLottoDto> getList() {
		
		List<PurchaseLottoDto> list;
		list = sqlSession.selectList("purchaseLotto.getList");
		
		return list;
	}

	@Override
	public List<PurchaseLottoDto> getList(String id) {
		
		List<PurchaseLottoDto> list;
		// String 형태로 mybatis에 보내면 getter 오류가 나서 Map에 담아서 보내줌
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("id", id);
		
		list = sqlSession.selectList("purchaseLotto.getList",map);
		
		return list;
	}

//	@Override
//	public int getGames(int plIndex) {
//		
//		int games = sqlSession.selectOne("purchaseLotto.getGames",plIndex);
//		return games;
//	}

	@Override
	public PurchaseLottoDto getData(int plIndex) {
		
		PurchaseLottoDto dto = sqlSession.selectOne("purchaseLotto.getData",plIndex);
		
		return dto;
	}

}
