<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<main>
<div id="article" class="contentsArticle">
	<div class="header_article">
		<h3 class="sub_title">1대1상담 자세히보기</h3>
	</div>
	<div>
		<div class="content_wrap content_notice_view">
			<!-- -------------------------------------------------------------------------------------- -->
			<form id="searchList" method="post">
				<input type="hidden" id="noticeSerial" name="noticeSerial">
				<table class="tbl_data tbl_board_view">
					<caption>번호,분류,제목,등록일 및 처리현황 등 나의 1:1 상담 내역</caption>
					<colgroup>
						<col style="width: 105px">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">제목</th>
							<td class="subject" colspan="3">${dto.title}</td>
						</tr>
						<tr>
							<th scope="row">등록일</th>
							<td>${dto.regdate }</td>
							<th scope="row">분류</th>
							<c:choose>
								<c:when test="${dto.category eq 0}">
									<td>로또</td>
								</c:when>
								<c:when test="${dto.category ne 0}">
									<td>연금</td>
								</c:when>
							</c:choose>
						</tr>
						<tr>
							<th scope="row">첨부파일</th>
							<td>파일</td>
							<th scope="row">처리현황</th>
							<td>미정</td>
						</tr>
						<tr>
							<td colspan="4" class="content">${dto.content}</td>
						</tr>
					</tbody>
				</table>
				<a href="list.do" class="btn_common form list">목록</a> 
				<a href="" class="btn_common form list">답변</a>
				<a href="#" class="btn_common form edit">수정</a> 
				<a href="delete.do?index=${dto.index}" class="btn_common form remove">삭제</a>

			</form>
		</div>
	</div>
</div>
</main>