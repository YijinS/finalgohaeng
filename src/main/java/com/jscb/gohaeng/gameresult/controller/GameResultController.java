package com.jscb.gohaeng.gameresult.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.jscb.gohaeng.dto.LottoGamesDto;
import com.jscb.gohaeng.gameresult.service.GameResultService;

@RequestMapping("/gameresult/")
@Controller
public class GameResultController {
	
	@Autowired
	GameResultService gameResultService;
	
	/*------------------------- lotto645 매핑------------------------------*/
	
	@ResponseBody
	@RequestMapping("lotto645/ajax")
	public String gamesData(int games) {
		System.out.println(games);
		LottoGamesDto dto;
		
		dto = gameResultService.getData(games);
		
		Gson gson = new Gson();
		String json = gson.toJson(dto);
		
		return json;
	}
	
	@RequestMapping("lotto645/1")
	public ModelAndView gamesDraw(ModelAndView mView) {
		
		gameResultService.getLastGames(mView);
		gameResultService.getGamesList(mView);
		
		mView.setViewName("gameresult.lotto645.1");
		return mView;
	}
	
	@RequestMapping("lotto645/2")
	public ModelAndView checkNum(ModelAndView mView) {
		
		mView.setViewName("gameresult.lotto645.2");
		return mView;
	}
	
	@RequestMapping("lotto645/3")
	public ModelAndView winningHistory(ModelAndView mView) {
		
		mView.setViewName("gameresult.lotto645.3");
		return mView;
	}
	
	@RequestMapping("lotto645/4")
	public ModelAndView paymentInfo(ModelAndView mView) {
		
		mView.setViewName("gameresult.lotto645.4");
		return mView;
	}
	
	@RequestMapping("lotto645/5")
	public ModelAndView review(ModelAndView mView) {
		
		mView.setViewName("gameresult.lotto645.5");
		return mView;
	}
	
	@RequestMapping("lotto645/6")
	public ModelAndView drawShow(ModelAndView mView) {
		
		mView.setViewName("gameresult.lotto645.6");
		return mView;
	}
	
	/*------------------------- lotto645 매핑------------------------------*/
	
	
	
	
	/*------------------------- pension520 매핑------------------------------*/
	@RequestMapping("pension520/1")
	public String pensionGamesDraw() {
		
		return "gameresult.pension520.1";
	}
	@RequestMapping("pension520/2")
	public String pensionCheckNum() {
		
		return "gameresult.pension520.2";
	}
	@RequestMapping("pension520/3")
	public String pensionWinningHistory() {
		
		return "gameresult.pension520.3";
	}
	@RequestMapping("pension520/4")
	public String pensionPaymentInfo() {
		
		return "gameresult.pension520.4";
	}
	@RequestMapping("pension520/5")
	public String pensionReview() {
		
		return "gameresult.pension520.5";
	}
	@RequestMapping("pension520/6")
	public String pensionDrawShow() {
		
		return "gameresult.pension520.6";
	}
	/*------------------------- pension520 매핑------------------------------*/
	
	/*------------------------- lottoStat 매핑------------------------------*/
	
	@RequestMapping("lottostat/1")
	public ModelAndView lottoStatIndex(ModelAndView mView) {
		
		mView.setViewName("gameresult.lottostat.1");
		
		return mView;
	}
	
	@RequestMapping("lottostat/2")
	public ModelAndView lottoStatByNumber(ModelAndView mView
			,@RequestParam(name="start",defaultValue = "0")Integer start
			,@RequestParam(name="end",defaultValue = "0")Integer end
			,@RequestParam(name="bonus",defaultValue = "1")Integer bonus) {
		
		
		System.out.println(start);
		System.out.println(end);
		System.out.println("**********************************************************");
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("start",start);
		map.put("end",end);
		map.put("bonus",bonus);
		
		System.out.println(map.get("start"));
		System.out.println(map.get("end"));
		System.out.println(map.get("bonus"));
		
		mView.addObject("save",map);
		mView.addObject("games",gameResultService.getGames());
		mView.addObject("list",gameResultService.getStatByNumber(start,end,bonus));
		mView.setViewName("gameresult.lottostat.2");
		
		return mView;
	}
	
	@RequestMapping("lottostat/3")
	public ModelAndView lottoStatByColor(ModelAndView mView
			,@RequestParam(name="start",defaultValue = "0")Integer start
			,@RequestParam(name="end",defaultValue = "0")Integer end) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("start",start);
		map.put("end",end);
		
		
		mView.addObject("save",map);
		mView.addObject("games",gameResultService.getGames());
		mView.setViewName("gameresult.lottostat.3");
		return mView;
	}
	
	
	/*------------------------- lottoStat 매핑------------------------------*/
}
