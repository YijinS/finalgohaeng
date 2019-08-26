package com.jscb.gohaeng.purchase.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.jscb.gohaeng.dao.LottoDao;
import com.jscb.gohaeng.dao.LottoGamesDao;
import com.jscb.gohaeng.dao.MemberDao;
import com.jscb.gohaeng.dao.PurchaseLottoDao;
import com.jscb.gohaeng.dto.LottoDto;
import com.jscb.gohaeng.dto.LottoGamesDto;
import com.jscb.gohaeng.dto.MemberDto;
import com.jscb.gohaeng.dto.PurchaseLottoDto;

@Service
public class PurchaseServiceImpl implements PurchaseService {
	
	@Autowired
	MemberDao memberDao;
	@Autowired
	PurchaseLottoDao purchaseLottoDao;
	@Autowired
	LottoDao lottoDao;
	@Autowired
	LottoGamesDao lottoGamesDao;
	
	// 로또 구매하기
	@Transactional
	public void buyLotto(ModelAndView mView
			, PurchaseLottoDto dto
			, List<LottoDto> list
			, HttpSession session) {
		
		int storeIndex = 0; // 0 이 인터넷복권
		// 최신 회차 가져오기
		LottoGamesDto lgm = lottoGamesDao.getLastData();
		
		// dto 에 구매정보 담기
		dto.setStoreIndex(storeIndex);
		dto.setLgmGames(lgm.getGames());
		
		// 1번째   구매하기
		purchaseLottoDao.insert(dto);
		// 방금 구매한 인덱스 꺼내오기
		int plIndex = purchaseLottoDao.getLastIndex();
		
		// 인덱스 lottoDto 에 각각 넣어주기
		for(LottoDto lotto:list)
			lotto.setPlIndex(plIndex);

		// 2번째   Lotto 테이블에 list를 등록함
		lottoDao.insert(list);
		
		int payAmt = list.size() * 1000;
		System.out.println("구매금액 : "+payAmt);
		MemberDto member = memberDao.getData(dto.getMemberId());
		int deposit = member.getDeposit()-payAmt;
		System.out.println("예치금에서 구매금액을 뺀 금액 : "+deposit);
		member.setDeposit(deposit);
		
		memberDao.update(member);
		session.setAttribute("member", member);
		
		mView.setViewName("redirect:/");
	}

	@Override
	public void getPurchaseData(ModelAndView mView) {
		
		LottoGamesDto lgm = lottoGamesDao.getLastData();
		mView.addObject("lastGame",lgm);
		
	}

}
