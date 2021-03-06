<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


	<div class="body">
		<div class="containerWrap">
			<section class="contentSection">
				<!-- ----------왼쪽메뉴---------- 영역 -->
				<nav class="lnbNav">
					<!-- left menu include -------------->


					<div id="snb" class="lnb">
						<h2 id="07" class="lnb_title">마이페이지</h2>
						<ul id="lnb" class="lnb_dep1">
							<li id="07-01" class="active"><a
								href="${pageContext.request.contextPath }/mypage/home" class="menuLnb"><span>마이페이지
										홈</span></a></li>
							<li id="07-02"><a href="${pageContext.request.contextPath }/mypage/purchasewinning/1"
								class="menuLnb"><span>구매/당첨</span></a></li>
							<li id="07-03"><a href="${pageContext.request.contextPath }/mypage/mystat"
								class="menuLnb"><span>구매현황분석</span></a></li>
							<li id="07-04"><a href="#"
								class="menuLnb"><span>건전구매 프로그램</span></a></li>
							<li id="07-05"><a href="${pageContext.request.contextPath }/mypage/deposit/1" class="menuLnb"><span>예치금</span></a></li>
							<li id="07-06"><a
								href="#" class="menuLnb"><span>행복더하기
										신청</span></a></li>
							<li id="07-07"><a
								href="${pageContext.request.contextPath }/mypage/personaldata/editData"
								class="menuLnb"><span>개인정보</span></a></li>
						</ul>
					</div>
					<!-- ----------------------------- -->
				</nav>
				<!-- -------------------------------------- -->
				<!-- ----------메인컨텐츠---------- 영역 -->
				<div id="article" class="contentsArticle">
					<div class="header_article">
						<h3 class="sub_title">마이페이지 홈</h3>

						<p class="location">
							<a class="home" href="/"> Home </a><span class="gt">&gt;</span><a
								href="#">마이페이지</a><span class="gt">&gt;</span><a
								href="#">마이페이지 홈</a>
						</p>

					</div>
					<div>
						<div class="content_wrap content_mypage_home">
							<!-- -------------------------------------------------------------------------------------- -->
							<div class="box_information">
								<div class="box information">
									<div class="head">
										<h4>
											<strong>${sessionScope.member.name }</strong>님
										</h4>
										<a class="link_common"
											href="${pageContext.request.contextPath }/mypage/personaldata/editData">개인정보수정</a>
									</div>
									<table class="tbl_form_write">
										<caption>아이디,휴대폰번호,이메일 등 요약된 개인정보를 확인합니다.</caption>
										<colgroup>
											<col style="width: 110px">
											<col>
											<col style="width: 150px">
										</colgroup>
										<tbody>
											<tr>
												<th scope="row">아이디</th>
												<td colspan="2">${sessionScope.member.id }</td>
											</tr>
											<tr>
												<th scope="row">휴대폰번호</th>
												<td colspan="2">${sessionScope.member.hp }</td>
											</tr>
											<tr>
												<th scope="row">이메일</th>
												<td colspan="2">${sessionScope.member.email }</td>
											</tr>
											<tr>
												<th scope="row">SMS 수신여부</th>



												<c:choose>
													<c:when test="${sessionScope.member.checkSms eq 1}">
														<td>수신거부</td>
														<td class="ta_right">
															<a class="btn_common sml" href="#">수신</a>
														</td>
													</c:when>
													<c:otherwise>
														<td>수신</td>
														<td class="ta_right">
															<a class="btn_common sml" href="#">수신거부</a>
														</td>
													</c:otherwise>
												</c:choose>
	
												



											</tr>
											<tr>
												<th scope="row">이메일 수신여부</th>


												<c:choose>
													<c:when test="${sessionScope.member.checkEmail eq 1}">
														<td>수신거부</td>
														<td class="ta_right">
															<a class="btn_common sml" href="#">수신</a>
														</td>
													</c:when>
													<c:otherwise>
														<td>수신</td>
														<td class="ta_right">
															<a class="btn_common sml" href="#">수신거부</a>
														</td>
													</c:otherwise>
												</c:choose>



											</tr>
											<tr>
												<th scope="row">구매한도</th>
												<td>미관리</td>
												<td class="ta_right"><a class="btn_common sml"
													href="#">설정하기</a></td>
											</tr>
										</tbody>
									</table>
							
									<div class="btn_bottom">
										<a class="btn_common mid" href="${pageContext.request.contextPath }/callcenter/faq/all">자주
											묻는 질문</a> <a class="btn_common mid"
											href="${pageContext.request.contextPath }/callcenter/qna/list">1:1 상담</a> <a
											class="btn_common mid"
											href="#">불법신고센터</a>
									</div>
								</div>
								<div class="box money">
									<div class="head">
										<h4>
											회원님의 <strong>예치금 현황</strong>입니다.
										</h4>
										<a class="link_common"
											href="#">자세히 보기</a>
									</div>
									<p class="total">
										<span>총 예치금</span><strong>${sessionScope.member.deposit }</strong><span>원</span>
									</p>
									<table class="tbl_form_write">
										<caption>구매가능금액, 구매불가능금액, 출금신청중 금액 등 예치금 현황 정보</caption>
										<colgroup>
											<col style="width: 140px">
											<col>
											<col style="width: 110px">
										</colgroup>
										<tbody>
											<tr>
												<th scope="row">구매가능금액
													<div class="wrap_help">
														<a href="#help1" class="ico_help" aria-labelledby="help1">구매가능금액이란?</a>
														<div id="help1" class="box_help">
															<p>복권구매 가능금액 입니다.</p>
														</div>
													</div>
												</th>
												<td class="ta_right">${sessionScope.member.deposit } 원</td>
												<td class="ta_right">
													<a class="btn_common sml" href="${pageContext.request.contextPath }/mypage/deposit/2">충전</a>
													<a class="btn_common sml" href="${pageContext.request.contextPath }/mypage/deposit/3">출금</a>

												</td>
											</tr>
											<tr>
												<th scope="row">구매불가능금액
													<div class="wrap_help">
														<a href="#help2" class="ico_help" aria-labelledby="help2">구매불가능금액이란?</a>
														<div id="help2" class="box_help">
															<p>출금신청(이체수수료 포함) 접수된 예치금 입니다.</p>
														</div>
													</div>
												</th>
												<td class="ta_right">0 원</td>
												<td class="ta_right">
													
												</td>
											</tr>
											<tr>
												<th scope="row">출금신청중금액
													<div class="wrap_help">
														<a href="#help3" class="ico_help" aria-labelledby="help3">출금신청중금액이란?</a>
														<div id="help3" class="box_help">
															<p>출금신청 접수된 예치금 입니다.</p>
														</div>
													</div>
												</th>
												<td class="ta_right">0 원</td>
												<td class="ta_right">
											
												</td>
											</tr>

										</tbody>
									</table>
									<p class="prgrp_common prgrp_note">복권의 1인 1회 구매한도는 10만원을
										초과할 수 없습니다.</p>
									<div class="btn_bottom">
										<a class="btn_common mid blu"
											href="#">전자복권 구매하기</a>
									</div>
								</div>
							</div>

							<div class="group_content">
								<div class="group_title">
									<h4 class="title">최근 구입내역</h4>
									<a class="link_common"
										href="${pageContext.request.contextPath }/mypage/purchasewinning/1">자세히 보기</a>
								</div>
								<table convert="true" class="tbl_data tbl_data_col">
									<caption>일자,복권명,회차,번호,구매매수,당첨결과,당첨금액 등 최근 구입내역</caption>
									<colgroup>
										<col>
										<col>
										<col>
										<col style="width: 160px">
										<col>
										<col>
										<col>
									</colgroup>
									<thead>
										<tr>
											<th scope="col">구입일자</th>
											<th scope="col">회차</th>
											<th scope="col">복권명</th>
											<th scope="col">복권번호</th>
											<th scope="col">구입매수</th>
											<th scope="col">당첨결과</th>
											<th scope="col">당첨금액</th>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${not empty list}">
												<c:forEach var="purchase" items="${list }">
												<fmt:formatDate var="issueDate" value="${purchase.issueDate }" pattern="yyyy-MM-dd"/>
													<tr>
														<td>${issueDate}</td>
														<td>${purchase.lgmGames }</td>
														<td>로또 6/45</td>
														<td>
															<a href="${pageContext.request.contextPath }/mypage/lottolist?pi=${purchase.index }"
																onclick="window.open(this.href, '_blanck', 'width=360, height=560'); return false"">
																${purchase.index }
															</a>
														</td>
														<td>미구현</td>
														<td></td>
														<td></td>
													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<tr>
													<td colspan="7" class="nodata">최근 구입내역이 없습니다.</td>
												</tr>
											</c:otherwise>
										</c:choose>
									</tbody>
								</table>
							</div>

							<!-- -------------------------------------------------------------------------------------- -->
						</div>
					</div>
				</div>
				<!-- 메인컨텐츠 끝 -->

			
			</section>
		</div>
	</div>
	