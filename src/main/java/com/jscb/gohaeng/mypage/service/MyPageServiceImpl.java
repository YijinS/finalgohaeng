package com.jscb.gohaeng.mypage.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.jscb.gohaeng.dao.DepositDao;
import com.jscb.gohaeng.dao.MemberDao;
import com.jscb.gohaeng.dto.DepositDto;
import com.jscb.gohaeng.dto.MemberDto;

@Service
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	DepositDao depositDao;
	
	@Autowired
	MemberDao memberDao;
	
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

}
