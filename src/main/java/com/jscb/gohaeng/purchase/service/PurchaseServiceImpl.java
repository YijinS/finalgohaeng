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
import com.jscb.gohaeng.dao.PurchaseLottoDao;
import com.jscb.gohaeng.dto.LottoDto;
import com.jscb.gohaeng.dto.LottoGamesDto;
import com.jscb.gohaeng.dto.MemberDto;
import com.jscb.gohaeng.dto.PurchaseLottoDto;

@Service
public class PurchaseServiceImpl implements PurchaseService {
	
	@Autowired
	PurchaseLottoDao purchaseLottoDao;
	@Autowired
	LottoDao lottoDao;
	@Autowired
	LottoGamesDao lottoGamesDao;
	
	// 로또 구매하기
	@Transactional
	public void buyLotto(ModelAndView mView, HttpServletRequest request, HttpSession session) {
		
		// 구매하기 위한 기본정보 꺼내오기
		MemberDto member = (MemberDto)session.getAttribute("member");
		//int storeIndex = Integer.parseInt(request.getParameter("store_index"));
		int storeIndex = 0; // 0 이 인터넷복권
		LottoGamesDto lgm = lottoGamesDao.getLastData();
		
		// dto 에 구매정보 담기
		PurchaseLottoDto dto = new PurchaseLottoDto();
		dto.setMemberId(member.getId());
		dto.setStoreIndex(storeIndex);
		dto.setLgmGames(lgm.getGames());
		
		// 1번째   구매하기
		purchaseLottoDao.insert(dto);
		// 방금 구매한 인덱스 꺼내오기
		int plIndex = purchaseLottoDao.getLastIndex();
		List<LottoDto> list = new ArrayList<LottoDto>();
		for(int i=0;i<5;i++) {
			String paramname = String.format("num%d", i+1);
			String paramname2 = String.format("method%d", i+1);
			String lottoNum = request.getParameter(paramname);
			
			// 더이상 들어있는 내용이 없으면 for문 멈춤
			if(lottoNum == null || lottoNum.equals(""))
				break;
			
			int method = Integer.parseInt(request.getParameter(paramname2));
			
			
			
			// lottoDto 에 채워주고
			LottoDto lottoDto = new LottoDto();
			lottoDto.setNum(lottoNum);
			lottoDto.setMethod(method);
			lottoDto.setPlIndex(plIndex);
			
			// list에 추가함
			list.add(lottoDto);	
		}
		
		// 2번째   Lotto 테이블에 list를 등록함
		lottoDao.insert(list);
		mView.setViewName("redirect:/home2");
	}

}
