package com.jscb.gohaeng.admin.event.service;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jscb.gohaeng.dao.ApplyEventDao;
import com.jscb.gohaeng.dto.ApplyEventDto;

@Service
public class ApplyEventServiceImpl implements ApplyEventService {

	@Autowired
	private ApplyEventDao applyEventDao;


	static final int PAGE_ROW_COUNT = 5;
	static final int PAGE_DISPLAY_COUNT = 5;
	
	@Override
	public void getAppliedMemberList(HttpServletRequest request) {
		
		String keyword=request.getParameter("keyword");
		String condition=request.getParameter("condition");
		
		ApplyEventDto applyEventDto = new ApplyEventDto();
		
		if(keyword != null) {
			if(condition.equals("index")) {
				applyEventDto.setIndex(Integer.parseInt(keyword));
			}else if(condition.equals("id")) {
				applyEventDto.setId(keyword);
			}else if(condition.equals("result")) {
				applyEventDto.setResult(Integer.parseInt(keyword));
			}
			
			request.setAttribute("condition", condition);
			
			String encodedKeyword=null;
			try {
				encodedKeyword=URLEncoder.encode(keyword, "utf-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			
			request.setAttribute("encodedKeyword", encodedKeyword);
			request.setAttribute("keyword", keyword);
			
		}
		
		int pageNum=1;
		
		String strPageNum = request.getParameter("pageNum");
		if(strPageNum != null && strPageNum != "") {
			pageNum = Integer.parseInt(strPageNum);
		}
		
		int startRowNum = 1+(pageNum-1)*PAGE_ROW_COUNT;
		int endRowNum = pageNum*PAGE_ROW_COUNT;
		
		int totalRow = applyEventDao.getCount(applyEventDto);
		int totalPageCount = (int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		
		int startPageNum = 1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		int endPageNum = startPageNum+PAGE_DISPLAY_COUNT-1;
		if(totalPageCount < endPageNum) {
			endPageNum = totalPageCount;
		}
		
		applyEventDto.setStartRowNum(startRowNum);
		applyEventDto.setEndRowNum(endRowNum);
		System.out.println();
		System.out.println("*****************************************");
		System.out.println("startRowNum"+startRowNum+"startRowNum");
		System.out.println("endRowNum"+endRowNum+"endRowNum");
		System.out.println("applyEventDto"+applyEventDto.getIndex()+"applyEventDto");
		System.out.println("applyEventDto"+applyEventDto.getResult()+"applyEventDto");
		System.out.println();
		System.out.println("*****************************************");
		
		List<ApplyEventDto> applyEventList = applyEventDao.getList(applyEventDto);
		request.setAttribute("applyEventList", applyEventList);
		request.setAttribute("startPageNum", startPageNum);
		request.setAttribute("endPageNum", endPageNum);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("totalPageCount", totalPageCount);
		request.setAttribute("totalRow", totalRow);
		
	}

	@Override
	public void drawMemberList(List<String> indexList) {
		for(String index : indexList) {
			applyEventDao.updateWin(Integer.parseInt(index));
		}	
	}

	@Override
	public void dropMemberList(List<String> indexList) {
		for(String index : indexList) {
			applyEventDao.updateLose(Integer.parseInt(index));
		}
	}

	
	
}
