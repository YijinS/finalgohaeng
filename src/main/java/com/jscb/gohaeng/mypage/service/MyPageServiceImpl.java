package com.jscb.gohaeng.mypage.service;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.jscb.gohaeng.dao.DepositDao;
import com.jscb.gohaeng.dao.LottoDao;
import com.jscb.gohaeng.dao.LottoGamesDao;
import com.jscb.gohaeng.dao.MemberDao;
import com.jscb.gohaeng.dao.PurchaseLottoDao;
import com.jscb.gohaeng.dto.DepositDto;
import com.jscb.gohaeng.dto.LottoDto;
import com.jscb.gohaeng.dto.LottoGamesDto;
import com.jscb.gohaeng.dto.MemberDto;
import com.jscb.gohaeng.dto.PurchaseLottoDto;

@Service
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	DepositDao depositDao;
	
	@Autowired
	MemberDao memberDao;
	
	@Autowired
	PurchaseLottoDao purchaseLottoDao;
	
	@Autowired
	LottoDao lottoDao;
	
	@Autowired
	LottoGamesDao lottoGamesDao;
	
	@Transactional
	public void chargeDeposit(HttpServletRequest request,HttpSession session) {
		
		
		MemberDto dto = (MemberDto)session.getAttribute("member");
		String id = dto.getId();
		int price = Integer.parseInt(request.getParameter("amt"));
		String bank = "고행은행";
		String account = "없음";
		System.out.println("충전금액임");
		System.out.println(price);
		
		DepositDto deposit = new DepositDto();
		deposit.setId(id);
		deposit.setInout(1);
		deposit.setBank(bank);
		deposit.setPrice(price);
		deposit.setAccount(account);
		
		depositDao.insert(deposit);
		memberDao.updateDeposit(deposit);
		
		// 세션에 있는 member 객체 업데이트 해준것. (예치금 변경된것)
		session.setAttribute("member", memberDao.getData(id));
	}

	@Override
	public void getDepositHistory(ModelAndView mView, HttpSession session) {
		
		MemberDto dto = (MemberDto)session.getAttribute("member");
		List<DepositDto> list = depositDao.getList(dto.getId());
		mView.addObject("depositList",list);
	}

	
	@Transactional
	public void withDraw(HttpServletRequest request, HttpSession session) {
		MemberDto dto = (MemberDto)session.getAttribute("member");
		String id = dto.getId();
		int price = Integer.parseInt(request.getParameter("price"));
		String bank = request.getParameter("bank");
		String account = request.getParameter("account");
		
		DepositDto deposit = new DepositDto();
		deposit.setId(id);
		deposit.setInout(0);
		deposit.setBank(bank);
		deposit.setPrice(price);
		deposit.setAccount(account);
		
		depositDao.insert(deposit);
		memberDao.updateDeposit(deposit);
		// 세션에 있는 member 객체 업데이트 해준것. (예치금 변경된것)
		session.setAttribute("member", memberDao.getData(id));
		
	}

	@Override
	public void getWithDrawList(ModelAndView mView, HttpSession session) {
		
		MemberDto dto = (MemberDto)session.getAttribute("member");
		String id = dto.getId();
		
		List<DepositDto> list = depositDao.getWithDrawList(id,0);
		mView.addObject("withDrawList",list);
	}

	@Override
	public void getPurchaseList(ModelAndView mView, HttpSession session) {
		
		MemberDto member = (MemberDto)session.getAttribute("member");
		String id = member.getId();
		List<PurchaseLottoDto> list = purchaseLottoDao.getList(id);
		mView.addObject("list",list);
		
	}

	@Override
	public void viewPurchasedLotto(ModelAndView mView, Integer plIndex) {
		
		PurchaseLottoDto pld = purchaseLottoDao.getData(plIndex);
		int games = pld.getLgmGames();
		Date issuedate = pld.getIssueDate();
		
		LottoGamesDto lgm = lottoGamesDao.getData(games);
		
		List<LottoDto> lottoList = lottoDao.getList(plIndex);
		mView.addObject("issueDate",issuedate);
		mView.addObject("lottoGames",lgm);
		mView.addObject("lottoList",lottoList);
	}

	@Override
	public void changepwd(ModelAndView mView, HttpSession session, String pwd, String newpwd) {
		
		//세션객체 얻어오기
		MemberDto member = (MemberDto)session.getAttribute("member");
		//id에 해당하는 회원 정보가 있는지 확인하기!
		String id = member.getId();
		MemberDto dto = memberDao.getData(id);
		String exist= "ok";
		
		//id가 존재하는지
		if(dto != null) {
			if(BCrypt.checkpw(pwd, dto.getPwd())) {
				BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
				dto.setPwd(encoder.encode(newpwd));
				memberDao.update(dto);
				mView.addObject("exist", exist);
			}
		}
		else {
			exist = "no";
			mView.addObject("exist", exist);
		}
	}

//	@Override
//	public void checkpwd(ModelAndView mView, String pwd, HttpSession session) {
//		
//		//세션객체 얻어오기
//		MemberDto member = (MemberDto)session.getAttribute("member");
//		//id에 해당하는 회원 정보 가져오기
//		String id = member.getId();
//		MemberDto dto = memberDao.getData(id);
//		//회원에 대한 비밀번호 비교
//		if(dto.getPwd().equals(pwd)) {
//			mView.setViewName("mypage.personaldata.changepwd");
//		}
//		else
//			mView.setViewName("mypage.personaldata.modifylogin");
//	}

}
