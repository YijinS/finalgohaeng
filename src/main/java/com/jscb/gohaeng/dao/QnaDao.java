package com.jscb.gohaeng.dao;

import java.util.List;

import com.jscb.gohaeng.dto.QnaDto;

public interface QnaDao {
	public List<QnaDto> getList(QnaDto dto);
	public QnaDto getData(int index);
	public void delete(int index);
	// 글의 갯수
	public int getCount(QnaDto dto);
	public void insert(QnaDto dto);
	//1:1상담목록(유저)
	public List<QnaDto> getMyList(QnaDto dto);
	public void update(QnaDto dto);
}
