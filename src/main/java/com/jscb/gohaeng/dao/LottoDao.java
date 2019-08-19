package com.jscb.gohaeng.dao;

import java.util.List;

import com.jscb.gohaeng.dto.LottoDto;

public interface LottoDao {
	
	public List<LottoDto> getList(int plIndex);
	public void insert(List<LottoDto> list);
	
}
