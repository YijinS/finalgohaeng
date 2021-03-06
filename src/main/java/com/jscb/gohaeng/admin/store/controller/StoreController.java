package com.jscb.gohaeng.admin.store.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
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


@Controller
@RequestMapping("/admin/store/")
public class StoreController {

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

		mView.setViewName("admin.store.lotto.1");
		return mView;

	}


	@RequestMapping(value="1detail", method = RequestMethod.GET)
	public ModelAndView getData(ModelAndView mView, int storeIndex) {

		storeservice.getData(mView, storeIndex);

		mView.setViewName("form.1detail");
		return mView;

	}

	//새글 추가 폼 요청 처리
	@RequestMapping("1insertform")
	public ModelAndView insertform
	(HttpServletRequest request){

		return new ModelAndView("form.1insertform");
	}

	//새글 추가 요청 처리
	@RequestMapping(value="1insert", method=RequestMethod.POST)
	public String insert(HttpServletRequest request, @ModelAttribute StoreDto dto){

		storeservice.insert(dto);
		return "admin.store.lotto.1insert";
	}


	@RequestMapping("1editform")
	public ModelAndView updateForm(@RequestParam int storeIndex,
			ModelAndView mView) {
		storeservice.getData(mView, storeIndex);
		mView.setViewName("form.1editform");
		return mView;
	}

	@RequestMapping("1edit")
	public String update(@ModelAttribute StoreDto dto) {
		storeservice.update(dto);
		return "admin.store.lotto.1edit";
	}

	@RequestMapping("1delete")
	public String delete(@RequestParam int storeIndex) {
		storeservice.delete(storeIndex);
		return "admin.store.lotto.1delete";

	}

	/*
	 * //구와 관련된 리스트 뽑기
	 * 
	 * @ResponseBody
	 * 
	 * @RequestMapping(value="/ajax/selectGulist", produces
	 * ="application/json; charset=utf8") public String selectGulist(@ModelAttribute
	 * StoreDto dto ) {
	 * 
	 * List<StoreDto> list = storeservice.selectGulist(dto);
	 * 
	 * Gson gson = new Gson(); String json = gson.toJson(list);
	 * 
	 * return json; }
	 */
	
	//구와 관련된 리스트 뽑기 
		
	
	
		@RequestMapping(value="ajax/selectGulist") 
		public String selectGulist(@ModelAttribute StoreDto dto, HttpServletRequest request, Model model) {
			String storeAddr = request.getParameter("storeAddr");
			dto.setStoreAddr(storeAddr);
			
			List<StoreDto> list = storeservice.selectGulist(dto, request);					
			
			model.addAttribute("list", list);
						

			return "admin/store/lotto/1GuList";
		}
	
	//검색란과 관련된 리스트 뽑기 
	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value="/ajax/selectStoreName", produces
	 * ="application/json; charset=utf8") public String
	 * selectStoreName(@ModelAttribute StoreDto dto ) {
	 * 
	 * List<StoreDto> list = storeservice.selectStoreName(dto);
	 * System.out.println("list"+ list); Gson gson = new Gson(); String json =
	 * gson.toJson(list);
	 * 
	 * return json; }
	 */

	
		@RequestMapping(value="ajax/selectStoreName", produces ="application/json; charset=utf8") 
		public String selectStoreName(@ModelAttribute StoreDto dto, Model model, HttpServletRequest request ) {

			String storeName = request.getParameter("storeName");
			dto.setStoreName(storeName);
			List<StoreDto> list = storeservice.selectStoreName(dto, request);
			
			model.addAttribute("list", list);
			

			return "admin/store/lotto/1sangho";
		}



}
