package com.jscb.gohaeng.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jscb.gohaeng.dto.QnaDto;

@Repository
public class QnaDaoImpl implements QnaDao{
	
	@Autowired
	private SqlSession session;

	@Override
	public List<QnaDto> getList(QnaDto dto) {
		List<QnaDto> list = session.selectList("qna.getList", dto);
		return list;
	}

	@Override
	public QnaDto getData(int index) {
		QnaDto dto = session.selectOne("qna.getData",index);
		return dto;
	}

	@Override
	public void delete(int index) {
		session.delete("qna.delete", index);
		
	}

	@Override
	public int getCount(QnaDto dto) {
		return session.selectOne("qna.getCount",dto);
	}

	@Override
	public void insert(QnaDto dto) {
		session.insert("qna.insert", dto);
		
	}

	@Override
	public List<QnaDto> getMyList(QnaDto dto) {
		List<QnaDto> list = session.selectList("qna.getMyList", dto);
		return list;
	}

	@Override
	public void update(QnaDto dto) {
		session.update("qna.update", dto);
		
	}

}
