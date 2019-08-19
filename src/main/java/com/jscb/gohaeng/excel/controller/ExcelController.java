package com.jscb.gohaeng.excel.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jscb.gohaeng.excel.service.ExcelService;

@Controller
public class ExcelController {

	private ExcelService excelService;
	
	@RequestMapping(value = "/anypage", method = RequestMethod.GET)
	public String excel() {
		return "/anypage";
	}
	
	@RequestMapping(value = "/excel")
	public void excel(HttpServletResponse response) throws Exception {
		excelService.selectExcelList(response);
	}
	
}




























