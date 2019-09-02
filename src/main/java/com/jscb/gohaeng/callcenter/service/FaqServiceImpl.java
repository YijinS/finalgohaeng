package com.jscb.gohaeng.callcenter.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jscb.gohaeng.dao.FaqDao;
import com.jscb.gohaeng.dto.FaqDto;

@Service
public class FaqServiceImpl implements FaqService{

	@Autowired
	private FaqDao faqDao;

	// 한 페이지에 나타낼 row 의 갯수
	static final int PAGE_ROW_COUNT = 5;
	// 하단 디스플레이 페이지 갯수
	static final int PAGE_DISPLAY_COUNT = 5;


	@Override
	public void getList(HttpServletRequest request, int category) {
	
		System.out.println("category" + category);
		
		
		//CafeDto 객체 생성 (select 할때 필요한 정보를 담기 위해)
		FaqDto dto=new FaqDto();
		
		//보여줄 페이지의 번호
		int pageNum=1;
		//보여줄 페이지의 번호가 파라미터로 전달되는지 읽어와 본다.	
		String strPageNum=request.getParameter("pageNum");
		if(strPageNum != null){//페이지 번호가 파라미터로 넘어온다면
			//페이지 번호를 설정한다.
			pageNum=Integer.parseInt(strPageNum);
		}
		//보여줄 페이지 데이터의 시작 ResultSet row 번호
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		//보여줄 페이지 데이터의 끝 ResultSet row 번호
		int endRowNum=pageNum*PAGE_ROW_COUNT;
		
		dto.setCategory(category); //카테고리 세팅
		
		//전체 row 의 갯수를 읽어온다.
		int totalRow=faqDao.getCount(dto);  //조건에 맞는 글의 갯수를 읽는 것. 
		//전체 페이지의 갯수 구하기
		int totalPageCount=
				(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		//시작 페이지 번호
		int startPageNum=
			1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		//끝 페이지 번호
		int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
		//끝 페이지 번호가 잘못된 값이라면 
		if(totalPageCount < endPageNum){
			endPageNum= totalPageCount; //보정해준다. 
		}
		// startRowNum 과 endRowNum 을 CafeDto 객체에 담고 
		dto.setStartRowNum(startRowNum);  //로직에서 계산되서 값이 들어가는것?
		dto.setEndRowNum(endRowNum);
		
		
		// startRowNum 과 endRowNum 에 해당하는 카페글 목록을 select 해 온다.
		List<FaqDto> list=faqDao.getList(dto);
		
		
		//view 페이지에서 필요한 값을 request 에 담고 
		request.setAttribute("list", list);
		request.setAttribute("startPageNum", startPageNum);
		request.setAttribute("endPageNum", endPageNum);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("totalPageCount", totalPageCount);	
		//전체 글의 갯수도 request 에 담는다.
		request.setAttribute("totalRow", totalRow);			
	}
}
