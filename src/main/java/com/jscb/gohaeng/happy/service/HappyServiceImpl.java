package com.jscb.gohaeng.happy.service;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jscb.gohaeng.dao.NoticeDao;
import com.jscb.gohaeng.dto.NoticeDto;

@Service
public class HappyServiceImpl implements HappyService {

	@Autowired
	private NoticeDao noticeDao;

	// 한 페이지에 나타낼 row 의 갯수
	static final int PAGE_ROW_COUNT = 5;
	// 하단 디스플레이 페이지 갯수
	static final int PAGE_DISPLAY_COUNT = 5;

	@Override
	public Map<String,Object> getNoticeList(Map<String,Object> map) {
		
		Map<String,Object> data = new HashMap<String,Object>();
		
		// 검색과 관련된 파라미터를 읽어와 본다.
		String keyword = (String)map.get("keyword");
		String condition = (String)map.get("condition");
		
		NoticeDto dto = new NoticeDto();
		
		if(keyword != null) {//검색 키워드가 전달된 경우
			if(condition.equals("total")) {//제목+내용 검색
				dto.setTitle(keyword);
				dto.setContent(keyword);
			}else if(condition.equals("title")) {//제목 검색
				dto.setTitle(keyword);
			}else if(condition.equals("content")) {//작성자 검색
				dto.setContent(keyword);
			}
			
			//request 에 검색 조건과 키워드 담기
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
		int totalRow = noticeDao.getCount(dto);
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

		// startRowNum 과 endRowNum 을 CafeDto 객체에 담고
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		
		// startRowNum 과 endRowNum 에 해당하는 공지사항글 목록을 select 해 온다.
		List<NoticeDto> list = noticeDao.getList(dto);
		
		
		data.put("list",list);
		data.put("startPageNum",startPageNum);
		data.put("endPageNum",endPageNum);
		data.put("pageNum",pageNum);
		data.put("totalPageCount",totalPageCount);
		data.put("totalRow",totalRow);
		
		return data;
	}

	@Transactional
	public NoticeDto viewNoticeDetails(int index) {
		
		NoticeDto dto = noticeDao.getData(index);
		noticeDao.addHitCount(index);
		return dto;
	}



}
