package com.jscb.gohaeng;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.jscb.gohaeng.dao.LottoGamesDao;
import com.jscb.gohaeng.dto.FortuneDto;
import com.jscb.gohaeng.dto.LottoGamesDto;

@Service
public class IndexServiceImpl implements IndexService {

	@Autowired
	private LottoGamesDao lottoGamesDao;
	
	@Override
	public ModelAndView crawlingFortune(ModelAndView mView) throws IOException {
		String[] czs = { "쥐", "소", "호랑이", "토끼", "용", "뱀", "말", "양", "원숭이", "닭", "개", "돼지" };

		List<FortuneDto> todayFortune = new ArrayList<FortuneDto>();

		for (int i = 0; i < 12; i++) {

			String url = "http://i.sazoo.com/run/free/ddi_newyear/result.php?idx=" + (i + 1);

			// GET 요청을 보내고 Document 객체를 변수 doc에 저장하기
			Document doc = Jsoup.connect(url).get();

			Elements result = doc.select(".result_fortune");

			String fortune = result.select(".wrap_result div:nth-child(4) .center").html();
			fortune = fortune.replaceAll("<br>", "");

			todayFortune.add(new FortuneDto(czs[i], fortune));
		}
		
		mView.addObject("fortune", todayFortune);
		
		return mView;
	}

	/* --------------- 인덱스페이지 로또번호 출력용 --------------- */
	@Override
	public void getLastLotto(ModelAndView mView) {
		
		LottoGamesDto lottoGame = lottoGamesDao.getLastData();
		mView.addObject("lottoGame", lottoGame);

	}

}
