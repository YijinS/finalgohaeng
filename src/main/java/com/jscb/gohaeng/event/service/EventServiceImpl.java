package com.jscb.gohaeng.event.service;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jscb.gohaeng.dao.ApplyEventDao;
import com.jscb.gohaeng.dao.EventCommentDao;
import com.jscb.gohaeng.dao.EventDao;
import com.jscb.gohaeng.dto.ApplyEventDto;
import com.jscb.gohaeng.dto.EventCommentDto;
import com.jscb.gohaeng.dto.EventDto;
import com.jscb.gohaeng.dto.MemberDto;

@Service
public class EventServiceImpl implements EventService {

	@Autowired
	private EventDao eventDao;
	@Autowired
	private ApplyEventDao applyEventDao;
	@Autowired
	private EventCommentDao eventCommentDao;

	static final int PAGE_ROW_COUNT = 5;
	static final int PAGE_DISPLAY_COUNT = 5;
	
	@Override
	public boolean applyEvent(ApplyEventDto applyEventDto) {

		
		int result = applyEventDao.insert(applyEventDto);
		System.out.println();
		System.out.println();
		System.out.println(result);
		System.out.println();
		System.out.println();
		
		if(result != 0)
			return true;
		
		return false;
	}

	@Override
	public void getEventList(HttpServletRequest request) {
		String keyword = request.getParameter("keyword");
		String condition = request.getParameter("condition");

		EventDto eventDto = new EventDto();

		if (keyword != null) {
			if (condition.equals("titlecontent")) {
				eventDto.setTitle(keyword);
				eventDto.setContent(keyword);
			} else if (condition.equals("title")) {
				eventDto.setTitle(keyword);
			} else if (condition.equals("subTitle")) {
				eventDto.setSubTitle(keyword);
			}

			request.setAttribute("condition", condition);

			String encodedKeyword = null;
			try {
				encodedKeyword = URLEncoder.encode(keyword, "utf-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}

			request.setAttribute("encodedKeyword", encodedKeyword);
			request.setAttribute("keyword", keyword);

		}

		int pageNum = 1;

		String strPageNum = request.getParameter("pageNum");
		if (strPageNum != null && strPageNum != "") {
			pageNum = Integer.parseInt(strPageNum);
		}

		int startRowNum = 1 + (pageNum - 1) * PAGE_ROW_COUNT;
		int endRowNum = pageNum * PAGE_ROW_COUNT;

		int totalRow = eventDao.getCount(eventDto);
		int totalPageCount = (int) Math.ceil(totalRow / (double) PAGE_ROW_COUNT);

		int startPageNum = 1 + ((pageNum - 1) / PAGE_DISPLAY_COUNT) * PAGE_DISPLAY_COUNT;
		int endPageNum = startPageNum + PAGE_DISPLAY_COUNT - 1;
		if (totalPageCount < endPageNum) {
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
		// 파라미터로 전달되는 글번호
		int eventIndex = Integer.parseInt(request.getParameter("index"));

		// 검색과 관련된 파라미터를 읽어와 본다.
		String keyword = request.getParameter("keyword");
		String condition = request.getParameter("condition");

		// EventDto 객체 생성 (select 할 때 필요한 정보를 담기 위해)
		EventDto eventDto = new EventDto();

		if (keyword != null) {// 검색 키워드가 전달된 경우
			if (condition.equals("titlecontent")) {// 제목+내용 검색
				eventDto.setTitle(keyword);
				eventDto.setContent(keyword);
			} else if (condition.equals("title")) {
				eventDto.setTitle(keyword);
			} else if (condition.equals("subTitle")) {
				eventDto.setSubTitle(keyword);
			}
			// request에 검색 조건과 키워드 담기
			request.setAttribute("condition", condition);
			/*
			 * 검색 키워드에는 한글이 포함될 가능성이 있기 때문에 링크에 그대로 출력가능하도록 하기 위해 미리 인코딩을 해서 request에 담아준다.
			 */
			String encodedKeyword = null;

			try {
				encodedKeyword = URLEncoder.encode(keyword, "utf-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			// 인코딩된 키워드와 인코딩 안된 키워드를 모두 담는다.
			request.setAttribute("encodedKeyword", encodedKeyword);
			request.setAttribute("keyword", keyword);
		}
		// EventDto 에 글번호도 담기
		eventDto.setIndex(eventIndex);

		// 조회수 1 증가 시키기
		eventDao.addHitCount(eventIndex);
		// 글정보를 얻어와서
		EventDto eventDto2 = eventDao.getDetail(eventDto);
		System.out.println();
		System.out.println();
		System.out.println("*************************" + eventIndex
				+ "************************************************************************");
		System.out.println();
		System.out.println();
		// 댓글 목록 얻어오기
		List<EventCommentDto> eventCommentList = eventCommentDao.getList(eventIndex);
		System.out.println(eventCommentList + "************************************************************************");
		// request 에 글정보를 담고
		request.setAttribute("eventDto", eventDto2);
		// request 에 댓글목록도 담아야한다
		request.setAttribute("commentList", eventCommentList);
		
		MemberDto member = (MemberDto)request.getSession().getAttribute("member");
		if(member != null)
			request.setAttribute("isExist", applyEventDao.isExist(eventIndex, member.getId()));

	}

	@Override
	public void saveComment(HttpServletRequest request) {
		// 댓글 작성자
		String writerId = ((MemberDto) request.getSession().getAttribute("member")).getId();
		// 댓글의 그룹번호
		int eventIndex = Integer.parseInt(request.getParameter("eventIndex"));
		// 댓글 대상자 아이디
		String targetId = request.getParameter("targetId");
		// 댓글의 내용
		String commentContent = request.getParameter("commentContent");
		// 댓글 내에서의 그룹번호(null 이면 원글의 댓글이다)
		String commentGroup = request.getParameter("commentGroup");
		// 저장할 댓글의 primary key 값이 필요하다
		int seq = eventCommentDao.getSequence();

		// 댓글 정보를 Dto에 담기
		EventCommentDto eventCommentDto = new EventCommentDto();
		eventCommentDto.setIndex(seq);
		eventCommentDto.setWriterId(writerId);
		eventCommentDto.setTargetId(targetId);
		eventCommentDto.setContent(commentContent);
		eventCommentDto.setEventIndex(eventIndex);

		if (commentGroup == null) { // 원글의 댓글인 경우
			// 댓글의 글번호가 댓글의 그룹번호가 된다.
			eventCommentDto.setCommentGroup(seq);
		} else { // 댓글의 댓글인 경우
			// commentGroup 번호가 댓글의 그룹번호가 된다.
			eventCommentDto.setCommentGroup(Integer.parseInt(commentGroup));
		}

		// 댓글 정보를 DB에 저장한다.
		eventCommentDao.insert(eventCommentDto);

	}

	@Override
	public void updateComment(EventCommentDto eventCommentDto) {
		// 댓글 내용 수정 반영하기
		eventCommentDao.update(eventCommentDto);
	}

	@Override
	public void deleteComment(int eventCommentIndex) {
		// 댓글 삭제
		eventCommentDao.delete(eventCommentIndex);
	}

}
