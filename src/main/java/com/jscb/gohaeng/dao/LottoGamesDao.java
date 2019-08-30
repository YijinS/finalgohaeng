package com.jscb.gohaeng.dao;

import java.util.List;

import com.jscb.gohaeng.dto.LottoGamesDto;

public interface LottoGamesDao {
	
	public List<LottoGamesDto> getList();
	public List<LottoGamesDto> getList(int start, int end);
	public List<LottoGamesDto> getList(int page,int rowCount, int start, int end);
	public LottoGamesDto getData(int games);
	public LottoGamesDto getLastData();
	public void lottoDrawInsert(LottoGamesDto dto);
	public int getLastGames(int games);
	public List<Integer> getGames();
	public int getTotalCount(int start,int end);
}
