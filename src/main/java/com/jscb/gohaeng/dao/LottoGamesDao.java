package com.jscb.gohaeng.dao;

import java.util.List;

import com.jscb.gohaeng.dto.LottoGamesDto;

public interface LottoGamesDao {
	
	public List<LottoGamesDto> getList();
	public LottoGamesDto getData(int games);
	public LottoGamesDto getLastData();
	public void lottoDrawInsert(LottoGamesDto dto);
}
