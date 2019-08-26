package com.jscb.gohaeng.dao;

import java.util.List;

import com.jscb.gohaeng.dto.AddrDto;
import com.jscb.gohaeng.dto.StoreDto;

public interface AddrDao {
	public List<AddrDto> getList(AddrDto dto);
	public List<AddrDto> getSido();
	public List<AddrDto> getGu(AddrDto dto);
	public List<StoreDto> getGulist(StoreDto dto);
}
