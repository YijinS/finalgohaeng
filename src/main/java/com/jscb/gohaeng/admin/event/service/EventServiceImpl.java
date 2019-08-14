package com.jscb.gohaeng.admin.event.service;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.jscb.gohaeng.dao.EventDao;
import com.jscb.gohaeng.dto.EventDto;

@Service
public class EventServiceImpl implements EventService {

	@Autowired
	private EventDao eventDao;

	static final int PAGE_ROW_COUNT = 5;
	static final int PAGE_DISPLAY_COUNT = 5;
	
	@Override
	public void getEventList(HttpServletRequest request) {
		
		String keyword=request.getParameter("keyword");
		String condition=request.getParameter("condition");
		
		EventDto eventDto = new EventDto();
		
		if(keyword != null) {
			if(condition.equals("titlecontent")) {
				eventDto.setTitle(keyword);
				eventDto.setContent(keyword);
			}else if(condition.equals("title")) {
				eventDto.setTitle(keyword);
			}else if(condition.equals("subTitle")) {
				eventDto.setSubTitle(keyword);
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
		
		int totalRow = eventDao.getCount(eventDto);
		int totalPageCount = (int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		
		int startPageNum = 1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		int endPageNum = startPageNum+PAGE_DISPLAY_COUNT-1;
		if(totalPageCount < endPageNum) {
			endPageNum = totalPageCount;
		}
		
		eventDto.setStartRowNum(startRowNum);
		eventDto.setEndRowNum(endRowNum);
		
		List<EventDto> eventList = eventDao.getList(eventDto);
		
		request.setAttribute("eventList", eventList);
		request.setAttribute("startPageNum", startPageNum);
		request.setAttribute("endPageNum", endPageNum);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("totalPageCount", totalPageCount);
		request.setAttribute("totalRow", totalRow);
		
	}

	@Override
	public void getEventDetail(HttpServletRequest request) {
		
		EventDto eventDto = null;
		
		try {
			eventDto = eventDao.getDetail(Integer.parseInt(request.getParameter("index")));
		}catch (Exception e) {
			// TODO: handle exception
			
			System.out.println("이벤트 인덱스 에러");
			request.setAttribute("error", "error");
		}
		
		request.setAttribute("dto", eventDto);
		
	}

	@Override
	public void regEvent(EventDto eventDto) {
		
		eventDao.insert(eventDto);
	}
	


}










