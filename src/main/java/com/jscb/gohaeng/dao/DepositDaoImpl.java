package com.jscb.gohaeng.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jscb.gohaeng.dto.DepositDto;

@Repository
public class DepositDaoImpl implements DepositDao {
	
	
	@Autowired
	SqlSession sqlSession;
	
	
	
	@Override
	public List<DepositDto> getList(String id) {
		
		List<DepositDto> list;
		list = sqlSession.selectList("deposit.getList",id);
		
		return list;
	}

	@Override
	public void insert(DepositDto dto) {

		sqlSession.insert("deposit.insert",dto);

	}

	@Override
	public List<DepositDto> getWithDrawList(String id, int inout) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("id",id);
		map.put("inout",inout);
		
		List<DepositDto> list;
		list = sqlSession.selectList("deposit.getWithDrawList",map);
		
		return list;
	}

}
