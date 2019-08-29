package com.jscb.gohaeng;

import java.io.IOException;
import java.text.ParseException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.google.gson.Gson;
import com.jscb.gohaeng.dto.LottoGamesDto;

@Controller
public class HomeController {
	
	@Autowired
	private IndexService indexService;
	
	@RequestMapping("/")
	public ModelAndView home(ModelAndView mView) throws IOException, ParseException {

		indexService.crawlingFortune(mView); 
		indexService.getLastLotto(mView);

		//indexService.totalgames();
		mView.setViewName("common.index");

		//indexService.lottonum();
		return mView;
	}
	
	@RequestMapping("/admin/")
	public ModelAndView adminIndex(ModelAndView mView){


		mView.setViewName("admin/adminindex");

		return mView;
	}

	@ResponseBody
	@RequestMapping("/ajax")
	public String getGames(@RequestParam(name="games") int games) {
		
		LottoGamesDto dto = indexService.getLottoGames(games);
		Gson gson = new Gson();
		String json = gson.toJson(dto);
		
		return json;
	}
	
	//스케쥴러
	@Scheduled(cron = "0 0 21 ? * SAT")
	public void lottonum() throws IOException, ParseException {
		indexService.lottonum();
		System.out.println("********************************스케쥴러 동작하니");
	}
	
	
}



















