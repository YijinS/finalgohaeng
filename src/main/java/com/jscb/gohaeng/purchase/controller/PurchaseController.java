package com.jscb.gohaeng.purchase.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jscb.gohaeng.dto.LottoDto;
import com.jscb.gohaeng.dto.MemberDto;
import com.jscb.gohaeng.dto.PurchaseLottoDto;
import com.jscb.gohaeng.purchase.service.PurchaseService;

@RequestMapping("/purchase/")
@Controller
public class PurchaseController {
	
	@Autowired
	PurchaseService purchaseService;
	
	@GetMapping("lotto645")
	public ModelAndView authLotto645a(HttpServletRequest request
			,ModelAndView mView) {
		
		purchaseService.getPurchaseData(mView);
		
		mView.setViewName("purchase.lotto645");
		
		return mView;
	}
	
	@PostMapping("lotto645")
	public ModelAndView lotto645a(ModelAndView mView
			,HttpServletRequest request
			,HttpSession session
			,PurchaseLottoDto dto) {
		
		// session에서 id꺼내서 담기
		MemberDto member = (MemberDto)session.getAttribute("member");
		dto.setMemberId(member.getId());
		
		// 입력받은 lotto 번호 list 에 담기
		List<LottoDto> list = new ArrayList<LottoDto>();
		
		String[] alphabet = {"A","B","C","D","E"};
		for(int i=0;i<5;i++) {
			String method_ = "method"+alphabet[i];
			Integer method = Integer.parseInt(request.getParameter(method_));

			String nums = "";
			
			// method 가 0이면 비어있는것
			if(method == 0)
				break;
			// 자동일때
			else if(method == 1) {
				Set<Integer> set = new HashSet<Integer>();

				while(set.size() < 6) {
					Random rand = new Random();
					int randNum = rand.nextInt(45)+1;
					set.add(randNum);
				}
				List<Integer> randomList = new ArrayList<Integer>(set);
				Collections.sort(randomList);
				
				for(Integer num:randomList)
					nums += String.format("%02d", num);

			// 수동일때
			}else if(method == 2) {
				for(int j=0;j<6;j++) {
					String num_ = String.format("num%d%s", (j+1),alphabet[i]);
					
					Integer num = Integer.parseInt(request.getParameter(num_));
					
					nums += String.format("%02d", num);
				}
			}
			System.out.println("입력 번호 : "+nums);
			LottoDto lotto = new LottoDto();
			lotto.setMethod(method);
			lotto.setNum(nums);
			list.add(lotto);
		}
		purchaseService.buyLotto(mView, dto, list, session);
		
		return mView;
	}

	@RequestMapping("pension520")
	public String pension520() {
	
		return "purchase/pension520";
	}
}
