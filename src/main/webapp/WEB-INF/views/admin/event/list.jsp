<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="article">
	<div class="content_wrap content_interview_winner">
		<!-- --------------------------------------- 컨텐트 시작 ----------------------------------------------- -->


		<div>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>시작일</th>
					<th>종료일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${eventList}">
					<fmt:formatDate value="${list.startDate }" var="start"
						pattern="yyyy-MM-dd HH:mm" />
					<fmt:formatDate value="${list.endDate }" var="end"
						pattern="yyyy-MM-dd HH:mm" />
					<tr>
						<td>${list.index}</td>
						<td>관리자</td>
						<td><a
							href="detail.do?index=${list.index}&condition=${condition}&keyword=${encodedKeyword}">${list.title}</a></td>
						<td>${start}</td>
						<td>${end}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<a class="btn btn-primary" href="${pageContext.request.contextPath }/admin/event/insertform.do" role="button">등록</a>

		<div class="page-display">
			<ul class="pagination">
				<c:choose>
					<c:when test="${startPageNum ne 1 }">
						<li><a
							href="list.do?pageNum=${startPageNum-1 }&condition=${condition }&keyword=${encodedKeyword }">
								&laquo; </a></li>
					</c:when>
					<c:otherwise>
						<li class="disabled"><a href="javascript:">&laquo;</a></li>
					</c:otherwise>
				</c:choose>
				<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }"
					step="1">
					<c:choose>
						<c:when test="${i eq pageNum }">
							<li class="active"><a
								href="list.do?pageNum=${i }&condition=${condition }&keyword=${encodedKeyword }">${i }</a></li>
						</c:when>
						<c:otherwise>
							<li><a
								href="list.do?pageNum=${i }&condition=${condition }&keyword=${encodedKeyword }">${i }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<c:choose>
					<c:when test="${endPageNum lt totalPageCount }">
						<li><a
							href="list.do?pageNum=${endPageNum+1 }&condition=${condition }&keyword=${encodedKeyword }">
								&raquo; </a></li>
					</c:when>
					<c:otherwise>
						<li class="disabled"><a href="javascript:">&raquo;</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		<%-- 글 검색 기능 폼 --%>

		<form action="list.do" method="get">
			<label for="condition">검색조건</label> <select name="condition"
				id="condition">
				<option value="titlecontent"
					<c:if test="${condition eq 'titlecontent' }">selected</c:if>>제목+내용</option>
				<option value="title"
					<c:if test="${condition eq 'title' }">selected</c:if>>제목</option>
				<option value="subTitle"
					<c:if test="${condition eq 'subTitle' }">selected</c:if>>소제목</option>
			</select> <input type="text" name="keyword" placeholder="검색어 입력..."
				value="${keyword }" />
			<button type="submit">검색</button>
		</form>

		<c:if test="${not empty keyword }">
			<p>
				<strong>${keyword }</strong> 라는 검색어로 <strong>${totalRow }</strong>
				개의 글이 검색 되었습니다.
			</p>
		</c:if>
		<!-- --------------------------------------------컨텐트 끝 ------------------------------------------ -->
	</div>
</div>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">