<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="body">
	<div class="containerWrap">
		<!--내용-->
		<section class="contentSection">
			<!-- ----------왼쪽메뉴---------- 영역 -->
			<nav class="lnbNav">
				<div id="snb" class="lnb">
					<h2 id="03" class="lnb_title">당첨결과</h2>
					<ul id="lnb" class="lnb_dep1">
						<li id="03-01"><a
								href="${pageContext.request.contextPath }/gameresult/lotto645/1"
								class="menuLnb"><span>로또6/45</span></a>
							<ul class="lnb_dep2">
								<li id="03-01-01"><a
										href="${pageContext.request.contextPath }/gameresult/lotto645/1"><span>
											회차별 당첨번호</span></a></li>
								<li id="03-01-02"><a
										href="${pageContext.request.contextPath }/gameresult/lotto645/2"><span>
											내번호 당첨확인</span></a></li>
								<li id="03-01-03"><a
										href="${pageContext.request.contextPath }/gameresult/lotto645/3"><span>
											당첨내역</span></a></li>
								<li id="03-01-04"><a
										href="${pageContext.request.contextPath }/gameresult/lotto645/4"><span>
											당첨금 지급안내</span></a></li>
								<li id="03-01-05"><a
										href="${pageContext.request.contextPath }/gameresult/lotto645/5"><span>
											추첨방송 다시보기</span></a></li>
								<li id="03-01-06"><a
										href="${pageContext.request.contextPath }/gameresult/lotto645/drawshowlist"><span>
											추첨방송 참관신청</span></a></li>
							</ul>
						</li>
						<li id="03-02"><a href="${pageContext.request.contextPath }/gameresult/pension520/1" class="menuLnb">
							<span>연금복권520</span></a>
						</li>
						<li id="03-05"><a href="${pageContext.request.contextPath }/gameresult/lottostat/1" class="menuLnb">
							<span>로또6/45 당첨통계</span></a>
						</li>
						<li id="03-06"><a href="${pageContext.request.contextPath }/gameresult/pensionstat/1" class="menuLnb">
							<span style="letter-spacing: -1px;">연금복권520 당첨통계</span></a>
						</li>
						<li class="active" id="03-07"><a href="${pageContext.request.contextPath }/gameresult/winningnews/1" class="menuLnb">
							<span>당첨소식</span></a></li>
						<li id="03-08"><a href="${pageContext.request.contextPath }/gameresult/unreceived/1" class="menuLnb">
							<span>미수령 당첨금</span></a>
						</li>
					</ul>
				</div>
			</nav>
			<!-- -------------------------------------- -->
			<!-- 컨텐츠 영역 -->
			<div id="article" class="contentsArticle">
				<div class="header_article">
					<h3 class="sub_title">당첨자 인터뷰</h3>
					<p class="location">
						<a class="home" href="/"> Home </a><span class="gt">&gt;</span><a
							href="/event/list">당첨 소식</a><span class="gt">&gt;</span><a
							href="/event/detail?index=${eventDto.index }">당첨자 인터뷰</a>
					</p>
				</div>
				<div>
					<div class="content_wrap content_event_detail">
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
									<fmt:formatDate var="date" value="${dto.wiDrawDate}"
										pattern="yyyy-MM-dd" />
									<td>${date}</td>
									<th scope="row">조회수</th>
									<td>${dto.wiHit}</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="4" class="content">${dto.wiContent}</td>
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
						<div class="btn_common form list">
							<a href="1">목록</a>
						</div>
					</div>
				</div>
			</div>
			<!-- ---------컨텐츠영역 끝---------------------------------- -->
		</section>
	</div>
</div>