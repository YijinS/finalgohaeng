package com.jscb.gohaeng.store.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.jscb.gohaeng.addr.service.AddrService;
import com.jscb.gohaeng.admin.store.service.StoreService;
import com.jscb.gohaeng.dto.AddrDto;
import com.jscb.gohaeng.dto.StoreDto;


@RequestMapping("/user/store/")
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
	@RequestMapping(value="ajax_select", produces ="application/json; charset=utf8") 
	public String ajax(int storeAbleGames) {
		List<StoreDto> list = storeservice.getList(storeAbleGames);
		Gson gson = new Gson(); 
		String json = gson.toJson(list);

		return json; 
	}


	@RequestMapping("1")
	public ModelAndView list(HttpServletRequest request, AddrDto dto, ModelAndView mView) {
		storeservice.getList(request);
		addrService.getSido(mView);

		mView.setViewName("store.sellerinfo.1");
		return mView;

	}


	@RequestMapping(value="1detail", method = RequestMethod.GET)
	public ModelAndView getData(ModelAndView mView, int storeIndex) {

		storeservice.getData(mView, storeIndex);

		mView.setViewName("form.1detail");
		return mView;

	}

	
	
	
		@RequestMapping(value="ajax/selectGulist") 
		public String selectGulist(@ModelAttribute StoreDto dto, HttpServletRequest request, Model model) {
		
			List<StoreDto> list = storeservice.selectGulist(dto, request);					
			
			model.addAttribute("list", list);
						

			return "store/sellerinfo/1GuList";
		}
	

	
		@RequestMapping(value="ajax/selectStoreName", produces ="application/json; charset=utf8") 
		public String selectStoreName(HttpSession session, @ModelAttribute StoreDto dto, Model model, HttpServletRequest request ) {

			String storeName = request.getParameter("storeName");
			dto.setStoreName(storeName);
			
			List<StoreDto> list = storeservice.selectStoreName(dto, request);
			
			model.addAttribute("list", list);
			

			return "store/sellerinfo/1sangho";
		}




}
