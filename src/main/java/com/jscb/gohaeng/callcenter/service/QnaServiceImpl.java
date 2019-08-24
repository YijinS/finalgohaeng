package com.jscb.gohaeng.callcenter.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jscb.gohaeng.dao.QnaDao;
import com.jscb.gohaeng.dto.QnaDto;

//@Service
public class QnaServiceImpl implements QnaService{
	
	@Autowired
	private QnaDao qnaDao;
	
	@Override
	public void insert(QnaDto dto) {
		qnaDao.insert(dto);	
	}

}
