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
					<h2 id="07" class="lnb_title">마이페이지</h2>
					<ul id="lnb" class="lnb_dep1">
						<li id="07-01"><a href="${pageContext.request.contextPath }/mypage/home" class="menuLnb"><span>마이페이지
									홈</span></a></li>
						<li id="07-02"><a href="${pageContext.request.contextPath }/mypage/purchasewinning/1" class="menuLnb"><span>구매/당첨</span></a></li>
						<li id="07-03"><a href="${pageContext.request.contextPath }/mypage/mystat" class="menuLnb"><span>구매현황분석</span></a></li>
						<li id="07-04"><a href="#" class="menuLnb"><span>건전구매
									프로그램</span></a></li>
						<li id="07-05" class="active"><a href="${pageContext.request.contextPath }/mypage/deposit/1" class="menuLnb"><span>예치금</span></a>
							<ul class="lnb_dep2">
								<li id="07-05-01" class="active"><a href="${pageContext.request.contextPath }/mypage/deposit/1"><span> 예치금 충전 내역</span></a></li>
								<li id="07-05-02"><a href="${pageContext.request.contextPath }/mypage/deposit/2"><span> 충전하기</span></a></li>
								<li id="07-05-03"><a href="${pageContext.request.contextPath }/mypage/deposit/3"><span> 출금 신청</span></a></li>
							</ul></li>
						<li id="07-06"><a href="#" class="menuLnb"><span>행복더하기
									신청</span></a></li>
						<li id="07-07"><a href="${pageContext.request.contextPath }/mypage/personaldata/editData" class="menuLnb"><span>개인정보</span></a></li>
					</ul>
				</div>

			</nav>
			<!-- -------------------------------------- -->
			<!-- ----------메인컨텐츠---------- 영역 -->
			<main id="article" class="contentsArticle">
			<div class="header_article">
				<h3 class="sub_title">예치금 충전내역</h3>
				<p class="location">
					<a class="home" href="/"> Home </a><span class="gt">&gt;</span><a
						href="#">마이페이지</a><span class="gt">&gt;</span><a href="#"><span>예치금</span></a><span
						class="gt">&gt;</span><a href="#"> 예치금 충전 내역</a>
				</p>
			</div>
			<div>
				<div class="content_wrap content_deposit_history">
					<!-- -------------------------------------------------------------------------------------- -->
					
					<!-- contents -->
					<form name="frm" id="frm" method="post">
						<input type="hidden" name="nowPage" id="nowPage" value="">
						<input type="hidden" name="searchStartDate" id="searchStartDate"
							value="20190729"> <input type="hidden"
							name="searchEndDate" id="searchEndDate" value="20190729">
						<table class="tbl_data tbl_form tbl_search_opt">
							<caption>복권유형, 조회기간, 조회결과순서 등의 조건 등의 고액당첨내역 조회 조건을
								입력합니다.</caption>
							<colgroup>
								<col style="width: 130px">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">조회기간</th>
									<td><input type="text" id="calendarStartDt"
										name="calendarStartDt" maxlength="8" value=""
										autocomplete="off" title="조회 시작날짜" class="hasDatepicker"><img
										class="ui-datepicker-trigger"
										src="${pageContext.request.contextPath }/resources/images/common/ico-calendar.png"
										alt="조회 시작날짜 선택" title="조회 시작날짜 선택"> <span class="dash">~</span>
										<input type="text" id="calendarEndDt" name="calendarEndDt"
										maxlength="8" value="" autocomplete="off" title="조회 종료날짜"
										class="hasDatepicker"><img
										class="ui-datepicker-trigger"
										src="${pageContext.request.contextPath }/resources/images/common/ico-calendar.png"
										alt="조회 종료날짜 선택" title="조회 종료날짜 선택"> <span
										class="period"> <a class="btn_common form"
											href="javascript:changeTerm( 0, '당일');">당일</a> <a
											class="btn_common form"
											href="javascript:changeTerm( 6, '1주일');">1주일</a> <a
											class="btn_common form"
											href="javascript:changeTerm(30, '1개월');">1개월</a> <a
											class="btn_common form"
											href="javascript:changeTerm(90, '3개월');">3개월</a>
									</span></td>
								</tr>
							</tbody>
						</table>
					</form>
					<div class="btns_submit search">
						<a href="#" class="btn_common mid blu"
							onclick="selfSubmit(1); return false;">조회</a>
					</div>

					<div class="group_content">
						<div class="group_title">
							<h4 class="title">예치금 조회내역</h4>
						</div>
						<div>
							<table class="tbl_data tbl_data_col" id="commonList">

								<caption>적립/사용일자별 내용, 입금액, 출금액, 잔액 등 예치금 조회내역 보기</caption>
								<colgroup>
									<col style="width: 150px">
									<col>
									<col>
									<col>
									<!-- <col> -->
								</colgroup>

								<thead>
									<tr>
										<th scope="col">적립/사용일자</th>
										<th scope="col">내용</th>
										<th scope="col">입금액</th>
										<th scope="col">출금액</th>
										<!-- <th scope="col">잔액</th> -->
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${not empty depositList }">
											<c:forEach var="deposit" items="${depositList }">
												<tr>
													<fmt:formatDate var="date" value="${deposit.date }" pattern="yyyy-MM-dd"/>
													<td>${date}</td>
													<c:choose>
														<c:when test="${deposit.inout eq 1}">
															<td>무통장 입금</td>
															<td>${deposit.price } 원</td>
															<td></td>
														</c:when>
														<c:otherwise>
															<td><p>(${deposit.bank})${deposit.account }</p></td>
															<td></td>
															<td>${deposit.price } 원</td>
														</c:otherwise>
													</c:choose>
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td colspan="4" class="nodata">조회 결과가 없습니다.</td>
											</tr>	
										</c:otherwise>
									</c:choose>
									
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			</main>
			<!-- -------------------------------------- -->
		</section>
	</div>
</div>
<!-- ----------------------------------------------------- -->