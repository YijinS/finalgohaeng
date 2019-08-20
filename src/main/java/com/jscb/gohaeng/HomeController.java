package com.jscb.gohaeng;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	public ModelAndView home(ModelAndView mView) throws IOException {

		indexService.crawlingFortune(mView);
		indexService.getLastLotto(mView);

		mView.setViewName("common.index");

		// 여기부분이나 service쪽에서 조건문 걸어서 최근회차가 있으면 실행안되게 하고싶어!!
		indexService.lottonum();
		return mView;
	}

	@ResponseBody
	@RequestMapping("/ajax")
	public String getGames(@RequestParam(name="games") int games) {
		
		LottoGamesDto dto = lottoGamesDao.getData(games);
		
		Gson gson = new Gson();
		String json = gson.toJson(dto);
		
		return json;
	}


	@RequestMapping(value="/home2",method = RequestMethod.GET)
	public ModelAndView home2(ModelAndView mView,HttpServletRequest request) throws IOException {
		indexService.crawlingFortune(mView);
		String url = request.getRequestURI();
		String query = request.getQueryString();
		
		System.out.println("url : " + url);
		System.out.println("query : " + query);
		/* mView.setViewName("common.indexa"); */
		mView.setViewName("common.index");

		return mView;
	}
	
}



















