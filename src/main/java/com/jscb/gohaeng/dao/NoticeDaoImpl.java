package com.jscb.gohaeng.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jscb.gohaeng.dto.NoticeDto;



@Repository
public class NoticeDaoImpl implements NoticeDao{
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<NoticeDto> getList(NoticeDto dto) {
		// mapper namasapce -> notice
		// sql id-> getList
		// resultType->NoticeDto
		List<NoticeDto> list = session.selectList("notice.getList",dto);
		return list;
	}

	@Override
	public NoticeDto getData(int index) {
		NoticeDto dto = session.selectOne("notice.getData",index);
		return dto;
	}

	@Override
	public void delete(int index) {
		session.delete("notice.delete", index);
		
	}

	@Override
	public int getCount(NoticeDto dto) {
		return session.selectOne("notice.getCount", dto);
	}

	@Override
	public void addHitCount(int index) {
		session.update("notice.addHitCount", index);
		
	}

	@Override
	public void insert(NoticeDto dto) {
		session.insert("notice.insert", dto);
		
	}

	@Override
	public void update(NoticeDto dto) {
		session.update("notice.update", dto);
		
	}

	

}
