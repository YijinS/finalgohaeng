package com.jscb.gohaeng.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jscb.gohaeng.dto.ApplyEventDto;

@Repository
public class ApplyEventDaoImpl implements ApplyEventDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insert(ApplyEventDto applyEventDto) {
		
		return sqlSession.insert("applyEvent.insert", applyEventDto);
		
	}

	@Override
	public boolean isExist(int eventIndex, String memberId) {
		Map<String, Object> map = new HashMap<>();
		map.put("eventIndex", eventIndex);
		map.put("memberId", memberId);
		ApplyEventDto applyEventDto = sqlSession.selectOne("applyEvent.getData", map);
		if(applyEventDto == null)
			return false;
		else
			return true;
	}

	@Override
	public List<ApplyEventDto> getList(ApplyEventDto applyEventDto) {
		
		return sqlSession.selectList("applyEvent.getList", applyEventDto);
	}

	@Override
	public int getCount(ApplyEventDto applyEventDto) {
		
		return sqlSession.selectOne("applyEvent.getCount", applyEventDto);
	}

	@Override
	public void updateWin(int index) {
		sqlSession.update("applyEvent.updateWin", index);
		
	}

	@Override
	public void updateLose(int index) {
		sqlSession.update("applyEvent.updateLose", index);
		
	}



}
