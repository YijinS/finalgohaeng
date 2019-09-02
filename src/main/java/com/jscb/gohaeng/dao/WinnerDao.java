package com.jscb.gohaeng.dao;

import java.util.List;

import com.jscb.gohaeng.dto.FaqDto;
import com.jscb.gohaeng.dto.WinnerDto;


public interface WinnerDao {
	
	// 글의 갯수
	public int getCount(WinnerDto dto);
	
	public List<WinnerDto> getList(WinnerDto dto); // 목록을 리턴하는 메소드
	public WinnerDto getDate(int wiIndex);
	public void delete(int wiIndex);
	public void insert(WinnerDto dto);
	public void update(WinnerDto dto); 
}
