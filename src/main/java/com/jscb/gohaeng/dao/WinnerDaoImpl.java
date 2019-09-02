package com.jscb.gohaeng.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jscb.gohaeng.dto.WinnerDto;

@Repository
public class WinnerDaoImpl implements WinnerDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public List<WinnerDto> getList(WinnerDto dto) {
		List<WinnerDto> list = session.selectList("winner.getList", dto);
		
		return list;
	}

	@Override
	public WinnerDto getDate(int wiIndex) {
		WinnerDto dto = session.selectOne("winner.getData", wiIndex);
		
		
		return dto;
	}

	@Override
	public void delete(int wiIndex) {
		session.delete("winner.delete", wiIndex);
	}

	@Override
	public void insert(WinnerDto dto) {
		session.insert("winner.insert", dto);
		
	}

	@Override
	public void update(WinnerDto dto) {
		session.update("winner.update", dto);
		
	}

	@Override
	public int getCount(WinnerDto dto) {
		return session.selectOne("winner.getCount", dto);
	}

}
