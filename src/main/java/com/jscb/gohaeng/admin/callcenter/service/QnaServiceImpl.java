package com.jscb.gohaeng.admin.callcenter.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.jscb.gohaeng.dao.MemberDao;
import com.jscb.gohaeng.dao.QnaDao;
import com.jscb.gohaeng.dto.MemberDto;
import com.jscb.gohaeng.dto.QnaDto;

@Service
public class QnaServiceImpl implements QnaService {

	@Autowired
	private QnaDao qnaDao;
	@Autowired
	private MemberDao memberDao;

	// 한 페이지에 나타낼 row 의 갯수
	static final int PAGE_ROW_COUNT = 5;
	// 하단 디스플레이 페이지 갯수
	static final int PAGE_DISPLAY_COUNT = 5;

	@Override
	public void getList(HttpServletRequest request) {

		QnaDto dto = new QnaDto();
		// System.out.println("searchType---->"+request.getParameter("searchType"));

		// 라디오 선택 값 파라미터로 읽기.
		String searchRadioOptions = request.getParameter("searchRadioOptions");
		String searchType = request.getParameter("searchType");

		if (searchRadioOptions != null)
			dto.setSearchType(searchRadioOptions);

		request.setAttribute("searchRadioOptions", searchRadioOptions);
		request.setAttribute("searchType", searchType);

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
		int totalRow = qnaDao.getCount(dto);
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

		List<QnaDto> list = qnaDao.getList(dto);

		request.setAttribute("list", list);
		request.setAttribute("startPageNum", startPageNum);
		request.setAttribute("endPageNum", endPageNum);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("totalPageCount", totalPageCount);
		request.setAttribute("totalRow", totalRow);

	}

	@Override
	public void getData(int index, ModelAndView mView) {
		QnaDto dto = qnaDao.getData(index);
		mView.addObject("dto", dto);

	}

	@Override
	public void delete(int index) {
		qnaDao.delete(index);

	}

	@Override
	public void insert(HttpServletRequest request, HttpSession session) {

		QnaDto dto = new QnaDto();

		MemberDto member = (MemberDto) session.getAttribute("member");
		String memberId = member.getId();
		String category = request.getParameter("category");
		String title = request.getParameter("title");
		String content = request.getParameter("content");

		dto.setMemberId(memberId);
		dto.setCategory(category);
		dto.setTitle(title);
		dto.setContent(content);
		System.out.println("*******************************카테고리" + category);
		System.out.println("*******************************memberId" + memberId);
		System.out.println("*******************************title" + title);
		System.out.println("*******************************content" + content);
		qnaDao.insert(dto);
	}

	@Override
	public void getMyList(ModelAndView mView, HttpSession session,HttpServletRequest request) {

		QnaDto dto = new QnaDto();

		MemberDto member = (MemberDto) session.getAttribute("member");
		String memberId = member.getId();

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
		dto.setMemberId(memberId);
		// 전체 row 의 갯수를 읽어온다.
		int totalRow = qnaDao.getCount(dto);
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
		System.out.println("********totalRow"+totalRow);
		System.out.println("********totalPageCount"+totalPageCount);
		if (memberId != null) {
			dto.setMemberId(memberId);
			List<QnaDto> list = qnaDao.getMyList(dto);
			mView.addObject("list", list);
		}
		
		mView.addObject("startPageNum", startPageNum);
		mView.addObject("endPageNum", endPageNum);
		mView.addObject("pageNum", pageNum);
		mView.addObject("totalPageCount", totalPageCount);
		mView.addObject("totalRow", totalRow);

//		MemberDto memberdto = memberDao.getData(memberId);
//		
//		if(memberdto != null) {
//			List<QnaDto> list = qnaDao.getMyList(memberId);
//			mView.addObject("list", list);
//		}
	}

	@Override
	public void update(HttpServletRequest request) {

		QnaDto dto = new QnaDto();

		int index = Integer.parseInt(request.getParameter("index"));
		String category = request.getParameter("category");
		String title = request.getParameter("title");
		String content = request.getParameter("content");

		dto.setIndex(index);
		dto.setCategory(category);
		dto.setTitle(title);
		dto.setContent(content);

		qnaDao.update(dto);

	}

	@Override
	public void replyinsert(String reply, int index) {
		QnaDto dto = new QnaDto();
		
		dto.setReply(reply);
		dto.setIndex(index);
		
		qnaDao.update(dto);
		
	}

	@Override
	public void replydelete(int index) {
		
		QnaDto dto = new QnaDto();
			
		dto.setReply(null);
		dto.setReplydate(null);
		dto.setIndex(index);
		
		qnaDao.update(dto);
		
	}

}
