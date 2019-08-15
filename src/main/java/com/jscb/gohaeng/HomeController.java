package com.jscb.gohaeng;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.jscb.gohaeng.dao.LottoGamesDao;
import com.jscb.gohaeng.dto.LottoGamesDto;

@Controller
public class HomeController {
	
	@Autowired
	private IndexService indexService;
	@Autowired
	private LottoGamesDao lottoGamesDao;
	
	@RequestMapping("/")
	public ModelAndView home(ModelAndView mView) {

		indexService.getLastLotto(mView);
		 mView.setViewName("common.index");

		return mView;
	}
	
	@ResponseBody
	@RequestMapping("/ajax-prev")
	public String prevGame(@RequestParam(name="games") int games) {
		
		LottoGamesDto dto = lottoGamesDao.getData(games);
		
		Gson gson = new Gson();
		String json = gson.toJson(dto);
		
		return json;
	}
	
	@ResponseBody
	@RequestMapping("/ajax-next")
	public String nextGame(@RequestParam(name="games") int games) {
		
		LottoGamesDto dto = lottoGamesDao.getData(games);
		
		Gson gson = new Gson();
		String json = gson.toJson(dto);
		
		return json;
	}
	
}



















