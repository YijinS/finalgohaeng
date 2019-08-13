package com.jscb.gohaeng.dao;

import java.util.List;

import com.jscb.gohaeng.dto.DepositDto;
import com.jscb.gohaeng.dto.MemberDto;

public interface DepositDao {
	public List<DepositDto> getList(String id);
	public void insert(DepositDto dto);
	public List<DepositDto> getWithDrawList(String id, int inout);
}
