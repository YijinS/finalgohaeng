package com.jscb.gohaeng.addr.service;

import java.util.List;

import org.springframework.web.servlet.ModelAndView;

import com.jscb.gohaeng.dto.AddrDto;
import com.jscb.gohaeng.dto.StoreDto;

public interface AddrService {
	public List<AddrDto> getList(AddrDto dto);
	public ModelAndView getSido(ModelAndView mView);
	public List<AddrDto> getGu(AddrDto dto);
	public List<StoreDto> selectGulist(StoreDto dto);
	
}
