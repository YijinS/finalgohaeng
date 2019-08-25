package com.jscb.gohaeng.gameresult.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.jscb.gohaeng.dao.LottoGamesDao;
import com.jscb.gohaeng.dto.LottoGamesDto;

@Service
public class GameResultServiceImpl implements GameResultService {
	
	@Autowired
	LottoGamesDao lottoGamesDao;
	
	@Override
	public void getLastGames(ModelAndView mView) {
		
		LottoGamesDto dto = lottoGamesDao.getLastData();
		mView.addObject("lottoGames",dto);

	}

	@Override
	public void getGamesList(ModelAndView mView) {
		
		List<LottoGamesDto> list;
		list = lottoGamesDao.getList();
		mView.addObject("list",list);

	}
	
	@Override
	public List<LottoGamesDto> getGamesList(int start, int end) {
		
		List<LottoGamesDto> list;
		list = lottoGamesDao.getList(start, end);
		
		return list;
	}

	@Override
	public LottoGamesDto getData(int games) {
		
		LottoGamesDto dto;
		dto = lottoGamesDao.getData(games);
		return dto;
	}

	
	
	public Map<String,Object> getStatByNumber(int start,int end,int bonus) {
		
		List<LottoGamesDto> list = lottoGamesDao.getList(start,end);
		int[] nums = new int[45];
		for(LottoGamesDto lotto : list) {
			for(int i=0;i<6;i++) {
				String text = lotto.getWinningNum();
				Integer num = Integer.parseInt(text.substring(i*2, (i+1)*2));
				nums[num-1]++;
			}
			if(bonus != 0) {
				int bonusNum = Integer.parseInt(lotto.getBonusNum());
				nums[bonusNum-1]++;
			}
		}
		int max=0;
		for(int a:nums) {
			if(a > max)
				max = a;
		}
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("nums",nums);
		map.put("max",max);
		
		return map;
		
	}
	
public Map<String,Object> getColorByNumber(int start,int end) {
		
		List<LottoGamesDto> list = lottoGamesDao.getList(start,end);
		int[] nums = new int[45];
		for(LottoGamesDto lotto : list) {
			for(int i=0;i<6;i++) {
				String text = lotto.getWinningNum();
				Integer num = Integer.parseInt(text.substring(i*2, (i+1)*2));
				nums[num-1]++;
			}
			int bonusNum = Integer.parseInt(lotto.getBonusNum());
			nums[bonusNum-1]++;
		}
		
		Integer first = 0;
		Integer second = 0;
		Integer third = 0;
		Integer fourth = 0;
		Integer fifth = 0;
		
		for(int i=0;i<45;i++) {
			if(i<11)
				first += nums[i];
			else if(i<21)
				second += nums[i];
			else if(i<31)
				third += nums[i];
			else if(i<41)
				fourth += nums[i];
			else
				fifth += nums[i];
		}
		
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("first",first);
		map.put("second",second);
		map.put("third",third);
		map.put("fourth",fourth);
		map.put("fifth",fifth);
		
		return map;
		
	}

	@Override
	public List<Integer> getGames() {
		
		List<Integer> list = lottoGamesDao.getGames();
		
		return list;
	}

	

}
