<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<main>
<div id="article" class="contentsArticle">
	<div class="header_article">
		<h3 class="sub_title">공지사항</h3>
	</div>
	<div>
		<div class="content_wrap content_notice_list">
			<!-- -------------------------------------------------------------------------------------- -->
			<div class="group_content group_data_search">
				<div class="group_title">
					<div class="action">
						<div class="search">
							<form name="searchList" id="searchList" method="get"
								action="list.do">
								<input type="hidden" name="noticeSerial" id="noticeSerial">
								<select id="kind" name="condition" title="조회옵션 선택">
									<option value="total"
										<c:if test="${condition eq 'total' }">selected</c:if>>전체</option>
									<option value="title"
										<c:if test="${condition eq 'title' }">selected</c:if>>제목</option>
									<option value="content"
										<c:if test="${condition eq 'content' }">selected</c:if>>내용</option>
								</select> <input type="text" name="keyword" value="${keyword}"
									title="검색어 입력">
								<button id="goSearch" class="btn_common form blu" type="submit">조회</button>
							</form>
						</div>
					</div>
				</div>
				<c:if test="${not empty keyword }">
					<p>
						<strong>${keyword }</strong> 라는 검색어로 <strong>${totalRow }</strong>
						개의 글이 검색 되었습니다.
					</p>
				</c:if>
				<table class="tbl_data tbl_data_col">
					<caption>번호, 제목, 첨부파일, 등록일등 공지사항 목록</caption>
					<colgroup>
						<col style="width: 85px">
						<col>
						<col style="width: 110px">
						<col style="width: 130px">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">제목</th>
							<th scope="col">첨부파일</th>
							<th scope="col">등록일</th>
							<th scope="col">조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="list" items="${list}">
						<fmt:formatDate value="${list.regDate }" var="regDate" pattern="yyyy-MM-dd HH:mm:ss"/>
							<tr>
								<td>${list.index}</td>
								<td><a href="detail.do?index=${list.index}">${list.title}</a></td>
								<td>파일</td>
								<td>${regDate}</td>
								<td>${list.hit}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="action right">
					<a href="${pageContext.request.contextPath }/admin/notice/insertform" id="review_order_btn" class="btn_common form"
						title="새창 열림">등록</a>
				</div>
				<div class="page-display">
					<div class="paginate_common" id="page_box">
						<ul class="pagination">
							<c:choose>
								<c:when test="${startPageNum ne 1 }">
									<li><a
										href="list.do?pageNum=${startPageNum-1 }&condition=${condition }&keyword=${Keyword }">
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
											href="list.do?pageNum=${i }&condition=${condition }&keyword=${Keyword }">${i }</a></li>
									</c:when>
									<c:otherwise>
										<li><a
											href="list.do?pageNum=${i }&condition=${condition }&keyword=${Keyword }">${i }</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>

							<c:choose>
								<c:when test="${endPageNum lt totalPageCount }">
									<li><a
										href="list.do?pageNum=${endPageNum+1 }&condition=${condition }&keyword=${Keyword }">
											&raquo; </a></li>
								</c:when>
								<c:otherwise>
									<li class="disabled"><a href="javascript:">&raquo;</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</main>