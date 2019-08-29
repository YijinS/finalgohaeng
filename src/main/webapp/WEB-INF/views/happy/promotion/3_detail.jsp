<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
				<div>
					<div class="content_wrap content_notice_view">
						<!-- -------------------------------------------------------------------------------------- -->
						<form id="searchList" method="post">
							<input type="hidden" id="noticeSerial" name="noticeSerial">
							<table class="tbl_data tbl_board_view">
								<fmt:formatDate value="${dto.regDate }" var="regDate"
									pattern="yyyy-MM-dd HH:mm:ss" />
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
										<td>${regDate}</td>
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
											<td><a href="3_detail?index=${dto.prevNum}">${dto.prevTitle}</a></td>
										</c:if>
										<c:if test="${dto.prevNum eq 0 }">
											<td>이전글이 없습니다.</td>
										</c:if>
									</tr>
									<tr class="prev_next">
										<th scope="row"><span class="next">다음글</span></th>
										<c:if test="${dto.nextNum ne 0 }">
											<td><a href="3_detail?index=${dto.nextNum}">${dto.nextTitle}</a></td>
										</c:if>
										<c:if test="${dto.nextNum eq 0 }">
											<td>다음글이 없습니다.</td>
										</c:if>
									</tr>
								</tbody>
							</table>
							<a
								href="3?page=${save.page }&condition=${save.condition}&keyword=${save.keyword}"
								class="btn_common form list">목록</a>
						</form>
					</div>
				</div>
			</div>
			<!-- 메인컨텐츠 끝 -->
			<!-- -------------------------------------- -->
		</section>
	</div>
</div>
