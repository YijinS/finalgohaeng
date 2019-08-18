package com.jscb.gohaeng.dao;

import java.util.List;

import com.jscb.gohaeng.dto.PurchaseLottoDto;

public interface PurchaseLottoDao {
	
	public List<PurchaseLottoDto> getList();
	public List<PurchaseLottoDto> getList(String id);
	public void insert(PurchaseLottoDto dto);
	public int getLastIndex();
	
}
