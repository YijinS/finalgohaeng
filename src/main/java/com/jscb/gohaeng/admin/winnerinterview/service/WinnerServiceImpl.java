package com.jscb.gohaeng.admin.winnerinterview.service;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.jscb.gohaeng.dao.WinnerDao;
import com.jscb.gohaeng.dto.MemberDto;
import com.jscb.gohaeng.dto.WinnerDto;

@Service
public class WinnerServiceImpl implements WinnerService {

	@Autowired
	private WinnerDao winnerDao;
	

	// 한 페이지에 나타낼 row 의 갯수
	static final int PAGE_ROW_COUNT = 5;
	// 하단 디스플레이 페이지 갯수
	static final int PAGE_DISPLAY_COUNT = 5;
	
	@Override
	public void getList(HttpServletRequest request) {
		WinnerDto dto = new WinnerDto();/*
										 * WinnerDto winner = (WinnerDto)session.getAttribute("wiCategory"); int
										 * wiCategory = winner.getWiCategory(); dto = winnerDao.getData(wiCategory);
										 * System.out.println("wiCategory");
										 */
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
				
				//전체 row 의 갯수를 읽어온다.
				int totalRow=winnerDao.getCount(dto);  //조건에 맞는 글의 갯수를 읽는 것. 
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
				
				
		
		
		List<WinnerDto> list = winnerDao.getList(dto);
	

		//view 페이지에서 필요한 값을 request 에 담고 
		request.setAttribute("list", list);
		request.setAttribute("startPageNum", startPageNum);
		request.setAttribute("endPageNum", endPageNum);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("totalPageCount", totalPageCount);	
		//전체 글의 갯수도 request 에 담는다.
		request.setAttribute("totalRow", totalRow);			
	}

	@Override
	public void getData(ModelAndView mView, int wiIndex) {
		WinnerDto dto = winnerDao.getData(wiIndex);
		mView.addObject("dto", dto);
		
	}

	@Override
	public void delete(int wiIndex) {
		winnerDao.delete(wiIndex);
	}

	@Override
	public void insert(WinnerDto dto) {
		winnerDao.insert(dto);
		
	}

	@Override
	public void update(WinnerDto dto) {
		winnerDao.update(dto);
		
	}

}
