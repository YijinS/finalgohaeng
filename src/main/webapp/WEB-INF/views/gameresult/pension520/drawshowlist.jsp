<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="body">
	<div class="containerWrap">
		<section class="contentSection">
			<!-- ----------왼쪽메뉴---------- 영역 -->
			<nav class="lnbNav">
				<div id="snb" class="lnb">
					<h2 id="03" class="lnb_title">당첨결과</h2>
					<ul id="lnb" class="lnb_dep1">
						<li id="03-01"><a
							href="${pageContext.request.contextPath }/gameresult/lotto645/1"
							class="menuLnb"><span>로또6/45</span></a></li>
						<li id="03-02" class="active"><a href="#" class="menuLnb"><span>연금복권520</span></a>
							<ul class="lnb_dep2">
								<li id="03-02-01"><a
									href="${pageContext.request.contextPath }/gameresult/pension520/1"><span>회차별
											당첨번호</span></a></li>
								<li id="03-02-02"><a
									href="${pageContext.request.contextPath }/gameresult/pension520/2"><span>
											내번호 당첨확인</span></a></li>
								<li id="03-02-03"><a
									href="${pageContext.request.contextPath }/gameresult/pension520/3"><span>
											당첨내역</span></a></li>
								<li id="03-02-04"><a
									href="${pageContext.request.contextPath }/gameresult/pension520/4"><span>
											당첨금 지급안내</span></a></li>
								<li id="03-02-05"><a
									href="${pageContext.request.contextPath }/gameresult/pension520/5"><span>
											추첨방송 다시보기</span></a></li>
								<li id="03-02-06" class="active"><a
									href="${pageContext.request.contextPath }/gameresult/pension520/drawshowlist"><span>
											추첨방송 참관신청</span></a></li>
							</ul></li>
						<li id="03-05"><a
							href="${pageContext.request.contextPath }/gameresult/lottostat/1"
							class="menuLnb"> <span>로또6/45 당첨통계</span></a></li>
						<li id="03-06"><a
							href="${pageContext.request.contextPath }/gameresult/pensionstat/1"
							class="menuLnb"> <span style="letter-spacing: -1px;">연금복권520
									당첨통계</span></a></li>
						<li id="03-07"><a
							href="${pageContext.request.contextPath }/gameresult/winningnews/1"
							class="menuLnb"> <span>당첨소식</span></a></li>
						<li id="03-08"><a
							href="${pageContext.request.contextPath }/gameresult/unreceived/1"
							class="menuLnb"> <span>미수령 당첨금</span></a></li>
					</ul>
				</div>


				<a href="#" target="_blank"><img
					src="${pageContext.request.contextPath }/resources/images/common/leftm_banner05.png"
					alt="당첨확인서비스"></a>
			</nav>
			<!-- -------------------------------------- -->
			<!-- ----------메인컨텐츠---------- 영역 -->
			<main id="article" class="contentsArticle">
			<div class="header_article">
				<h3 class="sub_title">추첨방송 참관신청</h3>
				<p class="location">
					<a class="home" href="/"> Home </a><span class="gt">&gt;</span><a
						href="#">당첨결과</a><span class="gt">&gt;</span><a href="#"><span>로또6/45</span></a><span
						class="gt">&gt;</span><a href="#"> 추첨방송 참관신청</a>
				</p>
			</div>
			<div>
				<div class="content_wrap content_result_visitlist">
					<div class="top_info">
						<ul class="list_text_common">
							<li>참관신청을 하신 날짜기준으로 2~3일 전 남겨주신 연락처로 개별 연락을 드립니다.</li>
							<li>별도의 참관비용은 지불하지 않습니다.</li>
							<li>참관은 <strong>추첨방송 당 1회만 가능</strong>하여, 이미 1회 참관하신 분은 더 이상
								참관신청을 하여도 연락이 가지 않습니다.
							</li>
						</ul>
						<a href="applyform" class="btn_common mid blu">참관신청</a>
					</div>
					<div class="group_content">
						<div class="group_title">
							<h4 class="title">참관신청 당첨자 발표</h4>
						</div>
						<table class="tbl_data tbl_data_col">
							<caption>번호, 제목, 모집기간, 추첨일자 등 참관신청 당첨자 안내</caption>
							<colgroup>
								<col style="width: 60px">
								<col style="width: 120px">
								<col style="width: auto">
								<col style="width: 195px">
								<col style="width: 110px">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">번호</th>
									<th scope="col">신청구분</th>
									<th scope="col">모집기간</th>
									<th scope="col">참관일자</th>
									<th scope="col">당첨결과</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty list }">
										<tr>
											<td colspan="5" class="nodata">조회된 결과가 없습니다.</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="list" items="${list}">
											<tr>
												<td>${list.index}</td>
												<c:choose>
													<c:when test="${list.category eq 0}">
														<td>로또</td>
													</c:when>
													<c:otherwise>
														<td>연금</td>
													</c:otherwise>
												</c:choose>
												<td>2019-09-21~2019-10-12</td>
												<fmt:formatDate var="date" value="${list.drawDate}"
													pattern="yyyy-MM-dd" />
												<td>${date}</td>
												<c:choose>
													<c:when test="${list.enable eq 1 }">
														<td>당첨</td>
													</c:when>
													<c:otherwise>
														<td>-</td>
													</c:otherwise>
												</c:choose>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
						<div class="wrap_paginate">
							<div class="page-display">
								<div class="paginate_common" id="page_box">
									<ul class="pagination">
										<c:choose>
											<c:when test="${startPageNum ne 1 }">
												<li><a href="list?pageNum=${startPageNum-1 }">&laquo;
												</a></li>
											</c:when>
											<c:otherwise>
												<li class="disabled"><a href="javascript:">&laquo;</a></li>
											</c:otherwise>
										</c:choose>
										<c:forEach var="i" begin="${startPageNum }"
											end="${endPageNum }" step="1">
											<c:choose>
												<c:when test="${i eq pageNum }">
													<li class="active"><a href="list?pageNum=${i }">${i }</a></li>
												</c:when>
												<c:otherwise>
													<li><a href="list?pageNum=${i }">${i }</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>

										<c:choose>
											<c:when test="${endPageNum lt totalPageCount }">
												<li><a href="list?pageNum=${endPageNum+1 }">&raquo;
												</a></li>
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
			<!-- -------------------------------------- -->
		</section>
	</div>
</div>
