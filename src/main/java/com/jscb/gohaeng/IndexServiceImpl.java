package com.jscb.gohaeng;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
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
	private LottoGamesDao dao;

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
	
//로또 번호 파싱하기
	@Override
	public void lottonum() throws IOException {
		
		LottoGamesDto dto = new LottoGamesDto();
		
		String url = "http://www.nlotto.co.kr/common.do?method=main";
		
		Document doc = Jsoup.connect(url).get();
		
		Elements contens = doc.select("div.content");
		
		System.out.println(contens);
		String winnum = "";
		
		for(int i=1; i<=6; i++) {
			int num = Integer.parseInt(contens.select("span#drwtNo"+i).text());
			winnum += String.format("%02d", num);
		}
		dto.setWinningNum(winnum);
		
		String bonus = contens.select("span#bnusNo").text();
		dto.setBonusNum(bonus);
		
		int games = Integer.parseInt(contens.select("strong#lottoDrwNo").text());
		dto.setGames(games);
		
		String drawdate = contens.select("span#drwNoDate").text();
		dto.setDrawDate(drawdate);
		
		dao.lottoDrawInsert(dto);
		
	}

	public static void main(String args[]) throws IOException {
		for(int i=0;i<10;i++) {
			String url = "https://dhlottery.co.kr/gameResult.do?method=byWin&drwNo="+(i+1);
			//drwtNo1
			// GET 요청을 보내고 Document 객체를 변수 doc에 저장하기
			Document doc = Jsoup.connect(url).get();
			
			Elements result = doc.select(".win_result span");
			System.out.print((i+1)+"회차 : ");
			//String asdf = "";
			for(int a=0;a<6;a++) {
				int b = Integer.parseInt(result.get(a).text());
				String c = String.format("%02d", b);
				System.out.print(c+" ");
				//System.out.print(result.get(a).text()+" ");
			}
			
			System.out.println();
		}
//		for(int a=0;a<6;a++) {
//			String numId = "#drwtNo"+(a+1);
//			System.out.print(numId+" : ");
//			Elements lottoNum = doc.select(numId);
//			System.out.println(lottoNum.html());
//		}

	}
	/* --------------- 인덱스페이지 로또번호 출력용 --------------- */
	@Override
	public void getLastLotto(ModelAndView mView) {
		
		LottoGamesDto lottoGame = lottoGamesDao.getLastData();
		mView.addObject("lottoGame", lottoGame);

	}

}
