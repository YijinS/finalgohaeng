package com.jscb.gohaeng.dto;

import java.util.Date;

public class EventCommentDto {

	private int index;
	private String writerId; //글쓴 멤버의 아이디
	private String content;
	private String targetId; //댓글 대상자의 아이디
	private int eventIndex; //댓글의 그룹 번호 (원글의 글번호)
	private int commentGroup; //댓글 내에서의 그룹번호
	private String deleted; //삭제한 댓글인지 여부 no | yes
	private Date regDate;
	
	public EventCommentDto() {}
	public EventCommentDto(int index, String writerId, String content, String targetId, int eventIndex,
			int commentGroup, String deleted, Date regDate) {
		super();
		this.index = index;
		this.writerId = writerId;
		this.content = content;
		this.targetId = targetId;
		this.eventIndex = eventIndex;
		this.commentGroup = commentGroup;
		this.deleted = deleted;
		this.regDate = regDate;
	}
	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}
	public String getWriterId() {
		return writerId;
	}
	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTargetId() {
		return targetId;
	}
	public void setTargetId(String targetId) {
		this.targetId = targetId;
	}
	public int getEventIndex() {
		return eventIndex;
	}
	public void setEventIndex(int eventIndex) {
		this.eventIndex = eventIndex;
	}
	public int getCommentGroup() {
		return commentGroup;
	}
	public void setCommentGroup(int commentGroup) {
		this.commentGroup = commentGroup;
	}
	public String getDeleted() {
		return deleted;
	}
	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
}
