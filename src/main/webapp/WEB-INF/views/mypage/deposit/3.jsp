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
								<li id="07-05-01"><a href="${pageContext.request.contextPath }/mypage/deposit/1"><span> 예치금 충전 내역</span></a></li>
								<li id="07-05-02"><a href="${pageContext.request.contextPath }/mypage/deposit/2"><span> 충전하기</span></a></li>
								<li id="07-05-03" class="active"><a href="${pageContext.request.contextPath }/mypage/deposit/3"><span> 출금 신청</span></a></li>
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
				<h3 class="sub_title">출금신청</h3>
				<p class="location">
					<a class="home" href="/"> Home </a><span class="gt">&gt;</span><a
						href="#">마이페이지</a><span class="gt">&gt;</span><a href="#"><span>예치금</span></a><span
						class="gt">&gt;</span><a href="#"> 출금 신청</a>
				</p>
			</div>
			<div>
				<div class="content_wrap content_balance_withdraw">
					<!-- -------------------------------------------------------------------------------------- -->

					<div class="top_info chti">
						<ul class="list_text_common">
							<li>출금신청하신 예치금은 본인명의의 계좌번호로 이체됩니다.</li>
							<li>계좌정보가 정확해야 이체되므로 <br>계좌번호 확인 후 신청해 주시기 바랍니다.
							</li>
						</ul>



						<p class="total">
							<span>총 예치금</span><strong>${sessionScope.member.deposit }</strong><span>원</span>
						</p>


					</div>
					<ul class="list_text_common chltc">
						<li>예치금 출금이체는 1일 1회 처리됩니다.(단, 주말과 공휴일은 제외)
							<ul>
								<li>당일 오전 10시까지 출금신청된 내역을 신청마감하고, 집계된 내역은 당일 15시경 신청하신 계좌로
									이체됩니다.</li>
							</ul>
						</li>
						<li>예치금 출금신청 시 <span style="text-decoration: underline;">이체수수료는
								이용자 부담입니다.(<font color="red">케이뱅크는 무료</font>, 그 외 은행은 300원)
						</span></li>
						<li>회원 본인의 명의의 계좌정보만 유효합니다.
							<ul>
								<li>출금계좌 등록은 회원명과 예금주명이 동일한 경우 등록됩니다.</li>
								<li>은행 이체 시 이체오류가 발생한 경우에는 당일 18시 이전에 예치금으로 반환 처리됩니다.</li>
								<li>반복적으로 이체오류가 발생하는 경우, 계좌정보를 변경 등록하시기 바랍니다.</li>
							</ul>
						</li>
						<li>이체불가
							<ul>
								<li>맞춤형 은행계좌인 경우에는 계좌정보가 정상적으로 등록되더라도, 이체되지 않습니다.</li>
								<li>이벤트 입금액 및 샘플게임의 당첨금은 현금으로 이체되지 않습니다.</li>
								<li>신청내역을 취소한 경우</li>
							</ul>
						</li>
					</ul>
					<div id="accountDiv">
						<div class="group_content">
							<div class="group_title">
								<h4 class="title">출금 계좌 등록</h4>
							</div>
							<table class="tbl_data tbl_form">
								<caption>예치금 출금 계좌 등록을 위해 은행명, 계좌번호를 등록합니다.</caption>
								<colgroup>
									<col style="width: 140px">
									<col style="width: 310px">
									<col style="width: 140px">
									<col>
								</colgroup>
								<tbody>
								<form id="withDraw_form" method="post">
									<tr>
										<th scope="row">은행명</th>
										<td>
											<select id="EP_bank_cd" name="bank">
												<option value="농협중앙회">농협중앙회</option>
												<option value="단위농협">단위농협</option>
												<option value="기업은행">기업은행</option>
												<option value="국민은행">국민은행</option>
												<option value="우리은행">우리은행</option>
												<option value="신한은행">신한은행</option>
												<option value="카카오뱅크">카카오뱅크</option>
											</select>
										</td>
										<th scope="row">출금액</th>
										<td><input name="price" type="text" value="0" /></td>

									</tr>
									<tr>
										<th scope="row"><label for="EP_account_no">계좌번호</label></th>
										<td><input type="text" id="EP_account_no"
											name="account" size="20" maxlength="32" value=""
											style="width: 100%" numberonly=""> <!-- <span>(계좌번호 입력시 '-'을 제외한 번호만 입력해주세요.)</span> -->
										</td>
										<th scope="row">예금주명</th>
										<td>${sessionScope.member.name }</td>
									</tr>
								</form>
								</tbody>
							</table>
							<div class="btns_submit search">
								<input type="button" class="btn_common mid" value="취소"> 
								<input type="button" class="btn_common mid blu" value="등록" id="submit">
							</div>
							<script>
								$(function() {
									var withDraw = $("#withDraw_form");
									var submit = $("#submit");
									
									submit.click(function(){
										withDraw.submit();
									});
								});
							</script>
						</div>
					</div>
					<div class="box_process box_process_vertical">
						<ul>
							<li class="step1"><strong>1.신청중</strong><span>예치금
									출금신청 완료</span></li>
							<li class="step2"><strong>2.처리중</strong><span>관리자
									접수완료(처리중)</span></li>
							<li class="step3"><strong>3.예치금 조정</strong><span>사용불가설정(출금신청액,수수료)</span></li>
							<li class="step4"><strong>4.환불완료</strong><span>이체오류시
									예치금으로 반환</span></li>
						</ul>
					</div>

					<form name="frm" id="frm" method="post"
						action="/userSsl.do?method=refundList&amp;searchStartDate=20190729&amp;searchEndDate=20190729"
						target="balanceList">
						<input type="hidden" name="nowPage" id="nowPage" value="1">
						<input type="hidden" name="searchStartDate" id="searchStartDate"
							value="20190729"> <input type="hidden"
							name="searchEndDate" id="searchEndDate" value="20190729">
					</form>
					<div class="group_content search_widthdraw chgcsw">
						<div class="group_title">
							<h4 class="title">출금신청 내역 조회</h4>
						</div>
						<table class="tbl_data tbl_form">
							<caption>출금신청 내역 조회를 위해 조회 기간을 입력합니다.</caption>
							<colgroup>
								<col style="width: 140px">
								<col>
								<col style="width: 150px">
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
										alt="조회 종료날짜 선택" title="조회 종료날짜 선택"><span class="period">
											<button class="btn_common form" onclick="changeTerm(0);">1일</button>
											<button class="btn_common form" onclick="changeTerm(6);">1주일</button>
											<button class="btn_common form" onclick="changeTerm(30);">1개월</button>
											<button class="btn_common form" onclick="changeTerm(90);">3개월</button>
									</span></td>
									<td class="ta_right submit"><button
											class="btn_common form blu" id="submit_btn">조회</button></td>
								</tr>
							</tbody>
						</table>
						<div id="refundListDiv">
							<!--내용-->
							<table class="tbl_data tbl_data_col">

								<caption>출금요청일, 은행, 출금계좌번호, 출금액, 상태 등 예치금 출금신청 내역 조회
									결과입니다.</caption>
								<colgroup>
									<col style="width: 140px">
									<col style="width: 140px">
									<col>
									<col>
									<col style="width: 140px">
								</colgroup>

								<thead>
									<tr>
										<th scope="col">출금요청일</th>
										<th scope="col">은행</th>
										<th scope="col">출금계좌번호</th>

										<th scope="col">출금액</th>
										<th scope="col">상태</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${not empty withDrawList }">
											<c:forEach var="withDraw" items="${withDrawList }">
												<tr>
													<fmt:formatDate var="date" value="${withDraw.date }" pattern="yyyy-MM-dd" />
													<td>${date}</td>
													<td>${withDraw.bank }</td>
													<td>${withDraw.account }</td>
													<td>${withDraw.price }</td>
													<td>출금완료</td>
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td class="nodata" colspan="5">데이터가 없습니다.</td>
											</tr>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
							<div class="paginate_common" id="page_box">
								<form name="sendComSearchForm" method="post">
									<input type="hidden" name="kind" value=""> <input
										type="hidden" name="keyword" value=""> <input
										type="hidden" name="startDate" value=""> <input
										type="hidden" name="endDate" value=""> <input
										type="hidden" name="searchDate" value=""> <input
										type="hidden" name="search" value=""> <input
										type="hidden" name="contentsCode" value=""> <input
										type="hidden" name="olddate" value="0"> <input
										type="hidden" name="lottoId" value="null"> <input
										type="hidden" name="pop" value=""> <input
										type="hidden" name="userId2" value="null"> <input
										type="hidden" name="cooperationId" value="null"> <input
										type="hidden" name="statusCode" value=""> <input
										type="hidden" name="lottoRound" value=""> <input
										type="hidden" name="sttDrwNo" value=""> <input
										type="hidden" name="edDrwNo" value=""> <input
										type="hidden" name="addr1" value=""> <input
										type="hidden" name="addr2" value=""> <input
										type="hidden" name="keyword1" value=""> <input
										type="hidden" name="keyword2" value=""> <input
										type="hidden" name="keyword3" value=""> <input
										type="hidden" name="keyword4" value=""> <input
										type="hidden" name="keyword5" value=""> <input
										type="hidden" name="appType" value=""> <input
										type="hidden" name="etcTxt1" value="">
								</form>
								<script>function goComSearchForm(boardUrl) {
                                                document.sendComSearchForm.action = boardUrl;
                                                document.sendComSearchForm.submit();
                                            }</script>

							</div>
							<!-- Paging BEGIN -->

							<!-- Paging END -->
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