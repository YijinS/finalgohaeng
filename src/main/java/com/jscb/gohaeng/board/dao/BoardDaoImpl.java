package com.jscb.gohaeng.board.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jscb.gohaeng.dto.BoardDto;


@Repository
public class BoardDaoImpl implements BoardDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertArticleInBoard(BoardDto boardDto) {
		
		sqlSession.insert("board.insert", boardDto);
		
	}
	

}
