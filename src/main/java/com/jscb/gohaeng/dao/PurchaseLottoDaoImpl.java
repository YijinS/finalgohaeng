package com.jscb.gohaeng.dao;

import java.util.List;

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
		list = sqlSession.selectList("purchaseLotto.getList",id);
		
		return list;
	}

}
