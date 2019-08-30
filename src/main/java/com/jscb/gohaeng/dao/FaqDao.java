package com.jscb.gohaeng.dao;

import java.util.List;

import com.jscb.gohaeng.dto.FaqDto;

public interface FaqDao {
	public int getCount(FaqDto dto);
	public List<FaqDto> getList(FaqDto dto);
}
