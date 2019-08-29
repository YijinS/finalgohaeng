package com.jscb.gohaeng.event.service;

import javax.servlet.http.HttpServletRequest;
import com.jscb.gohaeng.dto.ApplyEventDto;
import com.jscb.gohaeng.dto.EventCommentDto;


public interface EventService {
	public boolean applyEvent(ApplyEventDto applyEventDto);
	public void getEventList(HttpServletRequest request);
	public void getEventDetail(HttpServletRequest request);
	public void saveComment(HttpServletRequest request);
	public void updateComment(EventCommentDto eventCommentDto);
	public void deleteComment(int eventCommentIndex);
}
