<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="body">
	<div class="containerWrap">
		<section class="contentSection">
			<!-- ----------왼쪽메뉴---------- 영역 -->
			<nav class="lnbNav">

				<div id="snb" class="lnb">
					<h2 id="09" class="lnb_title">행복공감</h2>
					<ul id="lnb" class="lnb_dep1">
						<li id="06-01"><a href="${pageContext.request.contextPath }/happy/healthy/1" class="menuLnb"><span>건전한
									복권문화</span></a></li>
						<li id="06-02"><a href="${pageContext.request.contextPath }/happy/fund/1" class="menuLnb"><span>복권기금</span></a></li>
						<li id="06-03"><a href="${pageContext.request.contextPath }/happy/service" class="menuLnb"><span>행복공감
									봉사단</span></a></li>
						<li id="06-04" class="active"><a href="${pageContext.request.contextPath }/happy/promotion/1" class="menuLnb"><span>홍보센터</span></a>							<ul class="lnb_dep2">
								<li id="06-04-01"><a href="${pageContext.request.contextPath }/happy/promotion/1"><span>광고</span></a></li>
								<li id="06-04-02"><a href="${pageContext.request.contextPath }/happy/promotion/2"><span>보도자료</span></a></li>
								<li id="06-04-03" class="active"><a href="${pageContext.request.contextPath }/happy/promotion/3"><span>공지사항</span></a></li>
							</ul>
						</li>
					</ul>
				</div>

			</nav>
			<!-- -------------------------------------- -->
			<!-- ----------메인컨텐츠---------- 영역 -->
			<div id="article" class="contentsArticle">
				<div class="header_article">
					<h3 class="sub_title">공지사항</h3>
					<p class="location">
						<a class="home" href="/"> Home </a> <span class="gt">></span> <a
							href="#"> 행복공감 </a> <span class="gt">></span> <a href="#">
							홍보센터 </a> <span class="gt">></span> <a href="#"> 공지사항 </a>
					</p>
				</div>
				<!-- header_article 끝 -->
				<div>
					<div class="content_wrap content_happy_fund_archive">
						<div class="group_content group_data_search">
							<div class="group_title">
								<!-- 검색 부분 -->
								<div class="action">
									<div class="search">
										<form name="searchList" id="searchList">
											<select id="kind" name="condition" title="조회옵션 선택">
												<option value="total"
													<c:if test="${save.condition eq 'total' }">selected</c:if>>전체</option>
												<option value="title"
													<c:if test="${save.condition eq 'title' }">selected</c:if>>제목</option>
												<option value="content"
													<c:if test="${save.condition eq 'content' }">selected</c:if>>내용</option>
											</select> <input type="text" name="keyword" value="${save.keyword}"
												title="검색어 입력">
											<button id="goSearch" class="btn_common form blu" type="submit">조회</button>
										</form>
										<script>
											$(function(){
												var btn = $("#goSearch");
												btn.click(function(){
													history.replaceState({},null,location.pathname);
												});
											});
										</script>
									</div>
								</div>
							</div>
							<c:if test="${not empty save.keyword and save.keyword == '' }">
								<p>
									<strong>${save.keyword }</strong> 라는 검색어로 <strong>${data.totalRow }</strong>
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
									</tr>
								</thead>
								<tbody>
									<c:forEach var="notice" items="${data.list }">
										<fmt:formatDate var="regDate" value="${notice.regDate }" pattern="yyyy-MM-dd"/>
										<tr>
											<td>${notice.index }</td>
											<td class="ta_left"><a href="3_detail?index=${notice.index }&condition=${save.condition}&keyword=${save.keyword}">${notice.title }</a></td>
											<td><a class="btn_attach" href="#none" onclick="fileDownload(24)"></a></td>
											<td>${regDate }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<!-- 페이징 구현 -->
							<div class="wrap_paginate">
								<div class="paginate_common" id="page_box">
									<a class="go first" href="3?condition=${save.condition}&keyword=${save.keyword}">처음 페이지</a>
									<c:if test="${data.startPageNum ne 1 }">
										<a class="go prev" href="3?page=${data.startPageNum-1 }&start=${save.condition}&keyword=${save.keyword}">
											이전 페이지
										</a>
									</c:if>
									<c:forEach var="i" begin="${data.startPageNum }" end="${data.endPageNum }" step="1">
										<c:choose>
											<c:when test="${i eq data.pageNum }">
												<a class="current" title="현재 위치" href="3?page=${i }&start=${save.condition}&keyword=${save.keyword}"><strong>${i }</strong></a>
											</c:when>
											<c:otherwise>
												<a href="3?page=${i }&start=${save.condition}&keyword=${save.keyword }">${i }</a>
											</c:otherwise>
										</c:choose>
									</c:forEach>
		
									<c:if test="${data.endPageNum lt data.totalPageCount }">
										<a class="go next" href="3?page=${data.endPageNum+1 }&start=${save.condition }&keyword=${save.keyword }">
											다음 페이지
										</a>
									</c:if>
									<a class="go end" href="3?page=${data.totalPageCount }&start=${save.condition }&keyword=${save.keyword }">
										끝 페이지
									</a>
								</div>
								<!-- paginate_common 끝 -->
							</div>
							<!-- wrap_paginate 끝 -->
						</div>
						<!-- group_content.group_data_search 끝 -->
					</div>
					<!-- content_wrap content_happy_fund_archive 끝 -->
				</div>
			</div>
			<!-- 메인컨텐츠 끝 -->

			<!-- -------------------------------------- -->

		</section>
	</div>
</div>
