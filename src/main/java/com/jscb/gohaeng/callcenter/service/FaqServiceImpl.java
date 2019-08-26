package com.jscb.gohaeng.callcenter.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.jscb.gohaeng.dao.FaqDao;
import com.jscb.gohaeng.dto.FaqDto;

@Service
public class FaqServiceImpl implements FaqService{
	
	@Autowired
	private FaqDao faqDao;
	
	@Override
	public void getList(ModelAndView mView) {
		List<FaqDto> list = faqDao.getList();
		mView.addObject("list", list);
		
	}

}
