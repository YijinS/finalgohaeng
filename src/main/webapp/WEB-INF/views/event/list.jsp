<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="body">
	<div class="containerWrap">
		<section class="contentSection">
			<!-- ----------왼쪽메뉴---------- 영역 -->
			<nav class="lnbNav">
				<div id="snb" class="lnb">
					<h2 id="05" class="lnb_title">이벤트</h2>
					<ul id="lnb" class="lnb_dep1">
						<li id="05-01" class="active"><a
							href="/event.do?method=Eventend" class="menuLnb"><span>이벤트</span></a>
						</li>
					</ul>
				</div>
			</nav>
			<!-- -------------------------------------- -->
			<!-- ----------메인컨텐츠---------- 영역 -->
			<main id="article" class="contentsArticle">
				<div class="header_article">
					<h3 class="sub_title">이벤트</h3>
					<p class="location">
						<a class="home" href="/"> Home </a><span class="gt">&gt;</span><a
							href="/event/list">이벤트</a><span class="gt">&gt;</span><a
							href="/event/list">이벤트</a>
					</p>
				</div>
				<div>
					<div class="content_wrap">
						<!-- --------------------------------------- 컨텐트 시작 ----------------------------------------------- -->

						
						<form id="searchfrm" action="list.do" method="get">
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
							<button class="btn_common form blu"  type="submit">검색</button>
						</form>

						<div class="list_pic_summ list_event">
							<ul>
							<c:forEach var="list" items="${eventList}">
								<fmt:formatDate value="${list.startDate }" var="start"
									pattern="yyyy-MM-dd" />
								<fmt:formatDate value="${list.endDate }" var="end"
									pattern="yyyy-MM-dd" />
								<li>
									<a href="detail?index=${list.index}&condition=${condition}&keyword=${encodedKeyword}">
										<img src="${pageContext.request.contextPath }/resources/img/event/event_01.jpg"
										alt="가상계좌 입금수수료 보상 이벤트 썸네일" style="width: 245px;">
									</a>
									<div class="top">
										<p class="subject">
											<span class="label ing"> 진행중 </span>
											<a href="detail?index=${list.index}&condition=${condition}&keyword=${encodedKeyword}">${list.title}</a>
										</p>
										<p class="summary"></p>
									</div>
									<div class="bottom">
										<p class="information">
											<strong>이벤트 기간 : </strong><span>${start} ~ ${end}</span><br>
											<strong>당첨자 발표일 : </strong><span>2019-11-01</span>
										</p>
									</div>
								</li>
								</c:forEach>
							</ul>
						</div>
						
						
						<div class="page-display">
							<ul class="pagination">
								<c:choose>
									<c:when test="${startPageNum ne 1 }">
										<li><a
											href="list?pageNum=${startPageNum-1 }&condition=${condition }&keyword=${encodedKeyword }">
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
						<!-- --------------------------------------------컨텐트 끝 ------------------------------------------ -->
					</div>
				</div>
			</main>
			<!-- -------------------------------------- -->
		</section>
	</div>
</div>
<!-- ----------------------------------------------------- -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">