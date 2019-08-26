package com.jscb.gohaeng;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import com.jscb.gohaeng.dto.LottoGamesDto;

public class TestProgram {

	public static void main(String[] args) throws ParseException, IOException {
		LottoGamesDto dto = new LottoGamesDto();

		DateFormat df = new SimpleDateFormat("yyyyMMdd");
		for (int i = 4; i <= 14; i++) {
			String url = "https://dhlottery.co.kr/gameResult.do?method=byWin&drwNo=" + i;
			dto.setGames(i);

			Document doc = Jsoup.connect(url).get();
			Elements contens = doc.select(".win_result");
			String winnum = "";

			String num = contens.select(".num.win span").text();
			System.out.println("********************num" + num);
			String[] num_ = num.split("\\s");

			for (int j = 0; j < num_.length; j++) {
				System.out.println("*************** num_" + num_[j]);
				int nums = Integer.parseInt(num_[j]);
				winnum += String.format("%02d", nums);
				System.out.println("********************nums" + nums);
			}
			System.out.println("********************winnum" + winnum);
			dto.setWinningNum(winnum);
			String bonus = contens.select(".num.bonus span").text();
			dto.setBonusNum(bonus);

			String date = contens.select(".desc").text();
			
			System.out.println(date);
			String str1 = date.substring(1, 5);
			System.out.println(str1);
			String str2 = date.substring(7, 9);
			System.out.println(str2);
			String str3 = date.substring(11, 13);
			System.out.println(str3);
			String drawdate_ = str1 + str2 + str3;
			
			System.out.println(drawdate_);
			Date drawdate = df.parse(drawdate_);
			dto.setDrawDate(drawdate);
			
			System.out.println(dto.getDrawDate());
		}

	}

}
