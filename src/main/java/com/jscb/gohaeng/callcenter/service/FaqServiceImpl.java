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
				FaqDto dto = new FaqDto();
		
		// 보여줄 페이지의 번호
				int pageNum = 1;
				// 보여줄 페이지의 번호가 파라미터로 전달되는지 읽어와 본다.
				String strPageNum = request.getParameter("pageNum");
				if (strPageNum != null) {// 페이지 번호가 파라미터로 넘어온다면
					// 페이지 번호를 설정한다.
					pageNum = Integer.parseInt(strPageNum);
				}
				// 보여줄 페이지 데이터의 시작 ResultSet row 번호
				int startRowNum = 1 + (pageNum - 1) * PAGE_ROW_COUNT;
				// 보여줄 페이지 데이터의 끝 ResultSet row 번호
				int endRowNum = pageNum * PAGE_ROW_COUNT;

				// 전체 row 의 갯수를 읽어온다.
				int totalRow = faqDao.getCount(dto);
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
				
				dto.setStartRowNum(startRowNum);
				dto.setEndRowNum(endRowNum);
				System.out.println(category);
				dto.setCategory(category);
				
				List<FaqDto> list = faqDao.getList(dto);
				request.setAttribute("list", list);
				/*이거랑 같은애  mView.addObject("list", list); */
				request.setAttribute("startPageNum", startPageNum);
				request.setAttribute("endPageNum", endPageNum);
				request.setAttribute("pageNum", pageNum);
				request.setAttribute("totalPageCount", totalPageCount);   
				request.setAttribute("totalRow", totalRow);
				//request.setAttribute("category", category);
				
		
	}

}
