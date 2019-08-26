package com.jscb.gohaeng.store.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/store/")
@Controller
public class StoreController {
	
	@RequestMapping("sellerinfo/1")
	public String store() {
		
		return "store.sellerinfo.1";
	}
}
