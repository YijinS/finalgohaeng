<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<main>
<table class="tbl_data tbl_board_view">
	<caption>당첨자 당첨소감 인터뷰 내용 보기</caption>
	<colgroup>
		<col style="width: 105px">
		<col style="width: 350px">
		<col style="width: 105px">
		<col>
	</colgroup>
	<thead>
		<tr>
			<th scope="row">제목</th>
			<td colspan="3" class="subject">${dto.wiTitle}</td>
		</tr>
		<tr>
			<th scope="row">당첨일</th>
			<td>${dto.wiDrawDate}</td>
			<th scope="row">조회수</th>
			<td>${dto.wiHit}</td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td colspan="4" class="content">
				${dto.wiContent}
			</td>
		</tr>
		<tr class="prev_next">
			<th scope="row"><span class="prev">이전글</span></th>
			<c:if test="${dto.prevNum ne 0 }">
				<td><a href="1detail?wiIndex=${dto.prevNum}">${dto.prevTitle}</a></td>
			</c:if>
			<c:if test="${dto.prevNum eq 0 }">
				<td>이전글이 없습니다.</td>
			</c:if>
		</tr>
		<tr class="prev_next">
			<th scope="row"><span class="next">다음글</span></th>
			<c:if test="${dto.nextNum ne 0 }">
				<td><a href="1detail?wiIndex=${dto.nextNum}">${dto.nextTitle}</a></td>
			</c:if>
			<c:if test="${dto.nextNum eq 0 }">
				<td>다음글이 없습니다.</td>
			</c:if>
		</tr>
	</tbody>
</table>
<div class="btn_common form list"><a href="1">목록</a></div>
</main>