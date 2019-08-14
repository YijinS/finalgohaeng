<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<main>
<div id="article" class="contentsArticle">
	<div class="header_article">
		<h3 class="sub_title">공지사항</h3>
	</div>
	<div>
		<div class="content_wrap content_notice_view">
			<!-- -------------------------------------------------------------------------------------- -->
			<form id="searchList" method="post">
				<input type="hidden" id="noticeSerial" name="noticeSerial">
				<table class="tbl_data tbl_board_view">
					<caption>제목, 등록일, 첨부파일 등 공지사항 상세</caption>
					<colgroup>
						<col style="width: 105px">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">제목</th>
							<td class="subject">${dto.title }</td>
						</tr>
						<tr>
							<th scope="row">등록일</th>
							<td>${dto.regDate}</td>
						</tr>
						<tr>
							<th scope="row">조회수</th>
							<td>${dto.hit}</td>
						</tr>
						<tr>
							<td colspan="2" class="content">
								<div>${dto.content }</div>
								<div>
									<br>
								</div>
							</td>
						</tr>

						<tr class="prev_next">
							<th scope="row"><span class="prev">이전글</span></th>
							<c:if test="${dto.prevNum ne 0 }">
								<td><a href="detail.do?index=${dto.prevNum}">${dto.prevTitle}</a></td>
							</c:if>
							<c:if test="${dto.prevNum eq 0 }">
								<td>이전글이 없습니다.</td>
							</c:if>
						</tr>
						<tr class="prev_next">
							<th scope="row"><span class="next">다음글</span></th>
							<c:if test="${dto.nextNum ne 0 }">
								<td><a href="detail.do?index=${dto.nextNum}">${dto.nextTitle}</a></td>
							</c:if>
							<c:if test="${dto.nextNum eq 0 }">
								<td>다음글이 없습니다.</td>
							</c:if>
						</tr>
					</tbody>
				</table>
				<a href="list.do" id="" class="btn_common form list">목록</a> 
				<a href="#" id="" class="btn_common form edit">수정</a> 
				<a href="delete.do?index=${dto.index}" id="" class="btn_common form remove">삭제</a>
			</form>
		</div>
	</div>
</div>
</main>