package com.jscb.gohaeng.purchase.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.jscb.gohaeng.dto.LottoDto;
import com.jscb.gohaeng.dto.PurchaseLottoDto;

public interface PurchaseService {
	public void buyLotto(ModelAndView mView, PurchaseLottoDto dto,List<LottoDto> list,HttpSession session);
	public void getPurchaseData(ModelAndView mView);
}
