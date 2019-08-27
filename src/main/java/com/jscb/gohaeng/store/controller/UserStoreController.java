package com.jscb.gohaeng.store.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.jscb.gohaeng.addr.service.AddrService;
import com.jscb.gohaeng.admin.store.service.StoreService;
import com.jscb.gohaeng.dto.AddrDto;
import com.jscb.gohaeng.dto.StoreDto;


@RequestMapping("/user/")
@Controller
public class UserStoreController {

	@Autowired
	private StoreService storeservice;
	@Autowired
	private AddrService addrService;

	@ResponseBody
	@RequestMapping(value="ajax_addr_gu", produces = "application/json; charset=utf8")
	public String ajaxAddrGu(AddrDto dto) {

		System.out.println(dto.getSido());
		List<AddrDto> list = addrService.getGu(dto);

		Gson gson = new Gson();
		String json = gson.toJson(list);

		return json;

	}

	@ResponseBody
	@RequestMapping(value="ajax_addr", produces = "application/json; charset=utf8")
	public String ajaxAddr(AddrDto dto) {

		List<AddrDto> list = addrService.getList(dto);

		Gson gson = new Gson();
		String json = gson.toJson(list);

		return json;

	}

	//select box 요청 처리 
	@ResponseBody
	@RequestMapping(value="store/ajax_select", produces ="application/json; charset=utf8") 
	public String ajax(int storeAbleGames) {
		List<StoreDto> list = storeservice.getList(storeAbleGames);
		Gson gson = new Gson(); 
		String json = gson.toJson(list);

		return json; 
	}


	@RequestMapping("store/1")
	public ModelAndView list(HttpServletRequest request, AddrDto dto, ModelAndView mView) {
		storeservice.getList(request);
		addrService.getSido(mView);

		mView.setViewName("store.sellerinfo.1");
		return mView;

	}


	@RequestMapping(value="store/1detail", method = RequestMethod.GET)
	public ModelAndView getData(ModelAndView mView, int storeIndex) {

		storeservice.getData(mView, storeIndex);

		mView.setViewName("store.sellerinfo.1detail");
		return mView;

	}

	

	//구와 관련된 리스트 뽑기 
	@ResponseBody
	@RequestMapping(value="ajax/selectGulist", produces ="application/json; charset=utf8") 
	public String selectGulist(@ModelAttribute StoreDto dto ) {

		List<StoreDto> list = storeservice.selectGulist(dto);

		Gson gson = new Gson();
		String json = gson.toJson(list);

		return json;
	}
	
	//검색란과 관련된 리스트 뽑기 
		@ResponseBody
		@RequestMapping(value="ajax/selectStoreName", produces ="application/json; charset=utf8") 
		public String selectStoreName(@ModelAttribute StoreDto dto ) {

			List<StoreDto> list = storeservice.selectStoreName(dto);
			System.out.println("list"+ list);
			Gson gson = new Gson();
			String json = gson.toJson(list);

			return json;
		}




}
