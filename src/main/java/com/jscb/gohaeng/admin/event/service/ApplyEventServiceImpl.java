package com.jscb.gohaeng.admin.event.service;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.jscb.gohaeng.dao.ApplyEventDao;
import com.jscb.gohaeng.dto.ApplyEventDto;
import com.jscb.gohaeng.dto.NoticeDto;

@Service
public class ApplyEventServiceImpl implements ApplyEventService {

	@Autowired
	private ApplyEventDao applyEventDao;


	static final int PAGE_ROW_COUNT = 5;
	static final int PAGE_DISPLAY_COUNT = 5;
	
	@Override
	public Map<String, Object> getApplyEventList(Map<String, Object> map) {
		
		Map<String, Object> data = new HashMap<String,Object>();
		
		//검색과 관련된 파라미터를 읽어와 본다.
		String keyword = (String)map.get("keyword");
		String condition = (String)map.get("condition");
		
		ApplyEventDto dto = new ApplyEventDto();
		
		if(keyword != null) {
			if(condition.equals("title")) { //제목 검색
				dto.setTitle(keyword);
			}else if(condition.equals("id")) { //아이디 검색
				dto.setId(keyword);
			}else if(condition.equals("drawDate")) { //추첨일 검색
				dto.setResult(Integer.parseInt(keyword));
			}
		
			//request에 검색조건과 키워드 담기
			data.put("condition",condition);
			
			/*
			 *  검색 키워드에는 한글이 포함될 가능성이 있기 때문에
			 *  링크에 그대로 출력가능하도록 하기 위해 미리 인코딩을 해서
			 *  request 에 담아준다.
			 */
			String encodedKeyword=null;
			try {
				encodedKeyword=URLEncoder.encode(keyword, "utf-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			//인코딩된 키워드와 인코딩 안된 키워드를 모두 담는다.
			data.put("encodedKeyword",encodedKeyword);
			data.put("keyword",keyword);
		}
		
		// 보여줄 페이지의 번호
			int pageNum = (int)map.get("page");
			// 보여줄 페이지 데이터의 시작 ResultSet row 번호
			int startRowNum = 1 + (pageNum - 1) * PAGE_ROW_COUNT;
			// 보여줄 페이지 데이터의 끝 ResultSet row 번호
			int endRowNum = pageNum * PAGE_ROW_COUNT;

			// 전체 row 의 갯수를 읽어온다.
			int totalRow = applyEventDao.getCount(dto);
			// 전체 페이지의 갯수 구하기
			int totalPageCount = (int) Math.ceil(totalRow / (double) PAGE_ROW_COUNT);
			// 시작 페이지 번호
			int startPageNum = 1 + ((pageNum - 1) / PAGE_DISPLAY_COUNT) * PAGE_DISPLAY_COUNT;
			// 끝 페이지 번호
			int endPageNum = startPageNum + PAGE_DISPLAY_COUNT - 1;
			// 끝 페이지 번호가 잘못된 값이라면
			if (totalPageCount < endPageNum) {
				endPageNum = totalPageCount; // 보정해준다.
			}

			// startRowNum 과 endRowNum 을 ApplyEventDto 객체에 담고
			dto.setStartRowNum(startRowNum);
			dto.setEndRowNum(endRowNum);
			
			// startRowNum 과 endRowNum 에 해당하는 공지사항글 목록을 select 해 온다.
			List<ApplyEventDto> list = applyEventDao.getList(dto);
			
			
			data.put("list",list);
			data.put("startPageNum",startPageNum);
			data.put("endPageNum",endPageNum);
			data.put("pageNum",pageNum);
			data.put("totalPageCount",totalPageCount);
			data.put("totalRow",totalRow);
		
		return data;
	}
	/*
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
	*/

	
	
	@Override
	public void drawMemberList(List<Map<String,Object>> list) {
		for(Map<String,Object> map : list) {
			int index = Integer.parseInt(map.get("index").toString());
		
			System.out.println(index);
			System.out.println(map.get("id").toString());
			applyEventDao.updateWin(index, map.get("id").toString());
		}	
	}

	@Override
	public void dropMemberList(List<Map<String,Object>> list) {
		for(Map<String,Object> map : list) {
			int index = Integer.parseInt(map.get("index").toString());
			
			applyEventDao.updateLose(index, map.get("id").toString());
		}
	}
	
	
}
