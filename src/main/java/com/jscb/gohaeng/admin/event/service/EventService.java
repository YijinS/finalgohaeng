package com.jscb.gohaeng.admin.event.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.jscb.gohaeng.dto.ApplyEventDto;
import com.jscb.gohaeng.dto.EventCommentDto;
import com.jscb.gohaeng.dto.EventDto;


public interface EventService {
	public void getEventList(HttpServletRequest request);
	public void getEventDetail(HttpServletRequest request);
	public void regEvent(EventDto eventDto);
	public void saveComment(HttpServletRequest request);
	public void updateComment(EventCommentDto eventCommentDto);
	public void deleteComment(int eventCommentIndex);
	//원글 수정폼 출력에 필요한 메소드 
	public void getUpdateData(ModelAndView mView, int index);
	//원글 수정하는 메소드 
	public void updateEvent(EventDto eventDto);
	//원글 삭제 하는 메소드 
	public void deleteEvent(int index);
	//체크된 여러개의 이벤트를 삭제 하는 메소드 
	public void deleteEventList(List<String> indexList);
	public void applyEvent(ApplyEventDto applyEventDto);
	

}
