<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
						<li id="07-02"><a href="#" class="menuLnb"><span>구매/당첨</span></a>
							<ul class="lnb_dep2" style="display: none;">
								<li id="07-02-01"><a href="#"><span> 구매당첨내역</span></a></li>
								<li id="07-02-02"><a href="#"><span> 미확인복권내역</span></a></li>
								<li id="07-02-03"><a href="#"><span> 고액당첨내역</span></a></li>
							</ul></li>
						<li id="07-03"><a href="#" class="menuLnb"><span>구매현황분석</span></a></li>
						<li id="07-04"><a href="#" class="menuLnb"><span>건전구매
									프로그램</span></a>
							<ul class="lnb_dep2" style="display: none;"">
								<li id="07-04-01"><a href="#" class="menuLnb"><span>건전구매
											프로그램 홈</span></a></li>
								<li id="07-04-02"><a href="#"><span>
											셀프진단평가 </span></a></li>
								<li id="07-04-03"><a href="#"><span> 셀프구매계획 </span></a></li>
								<li id="07-04-04"><a href="#"><span> 셀프휴식계획 </span></a></li>
							</ul></li>
						<li id="07-05" class="active"><a href="${pageContext.request.contextPath }/mypage/deposit/1" class="menuLnb"><span>예치금</span></a>
							<ul class="lnb_dep2">
								<li id="07-05-01"><a href="${pageContext.request.contextPath }/mypage/deposit/1"><span> 예치금 충전 내역</span></a></li>
								<li id="07-05-02" class="active"><a href="${pageContext.request.contextPath }/mypage/deposit/2"><span> 충전하기</span></a></li>
								<li id="07-05-03"><a href="${pageContext.request.contextPath }/mypage/deposit/3"><span> 출금 신청</span></a></li>
							</ul></li>
						<li id="07-06"><a href="#" class="menuLnb"><span>행복더하기
									신청</span></a></li>
						<li id="07-07"><a href="#" class="menuLnb"><span>개인정보</span></a>
							<ul class="lnb_dep2" style="display: none;">
								<li id="07-07-01"><a href="#"><span> 개인정보변경</span></a></li>
								<li id="07-07-02"><a href="#"><span> 비밀번호변경</span></a></li>
								<li id="07-07-03"><a href="#"><span> 회원탈퇴 </span></a></li>
							</ul></li>
					</ul>
				</div>

			</nav>
			<!-- -------------------------------------- -->
			<!-- ----------메인컨텐츠---------- 영역 -->
			<main id="article" class="contentsArticle">
				<div class="header_article">
					<h3 class="sub_title">충전하기</h3>
					<p class="location"><a class="home" href="/"> Home </a><span class="gt">&gt;</span><a
							href="#">마이페이지</a><span class="gt">&gt;</span><a
							href="#"><span>예치금</span></a><span class="gt">&gt;</span><a
							href="#"> 충전하기</a></p>
				</div>
				<div>
					<div class="content_wrap content_balance_charge_once">

						<div class="group_content">
							<div class="group_title">
								<h4 class="title">가상계좌(1회성) 입금</h4>
							</div>

							<form id="payment_form" method="post">

								<table class="tbl_data tbl_form">
									<caption>가상계좌 입금을 위한 금액, 이름 등 정보를 입력합니다.</caption>
									<colgroup>
										<col style="width:180px">
										<col>
									</colgroup>
									<tbody>
										<tr>
											<th scope="row">결제내역</th>
											<td>복권 예치금</td>
										</tr>
										<tr>
											<th scope="row">금액</th>
											<td>
												<select id="Amt" name="amt" title="예치금 충전 금액 선택">
													<option value="5000">5,000원</option>
													<option value="10000">10,000원</option>
													<option value="20000" selected="">20,000원</option>
													<option value="30000">30,000원</option>
													<option value="50000">50,000원</option>
													<option value="100000">100,000원</option>
													<option value="200000">200,000원</option>
													<option value="300000">300,000원</option>
												</select>
											</td>
										</tr>
										<tr>
											<th scope="row">이름</th>
											<td><input name="BuyerName" type="text" maxlength="20" value="${sessionScope.member.name }" readonly="readonly"></td>
										</tr>
									</tbody>
								</table>

							</form>
						</div>
						<div id="btn2" class="btns_submit">
							<a class="btn_common mid" href="#">취소</a>
							<button id="payment"class="btn_common mid blu">결제하기</button>
							<script>
								$(function(){
									var paymentform = $("#payment_form");
									var button = $("#payment");
									button.click(function(){
										paymentform.submit();
									});					
								});
							</script>
						</div>
						<div id="btn1" class="ing_payment" style="display:none">
							<p><strong>결제가 진행 중 입니다.</strong><br>결제 중 취소를 하셨을 경우 새로고침 후 다시 결제 신청하시기 바랍니다.</p>
						</div>
						<ul class="list_text_common">
							<li>1회성 입금계좌이며, 케이뱅크의 가상계좌가 발급됩니다.</li>
							<li>발급된 계좌번호로 입금확인이 완료되면 예치금으로 충전됩니다.</li>
							<li>예금주는 <strong>주식회사 동행복권</strong> 입니다.</li>
							<li>가상계좌로 입금 후 <strong>예치금 확인까지는 최대 5분 정도 소요</strong>될 수 있습니다.</li>
							<li>입금계좌는 케이뱅크의 가상계좌가 제공됩니다. (<strong>케이뱅크 고객은 이체 수수료가 무료</strong>입니다.)</li>
						</ul>
						<div class="box_process box_process_vertical">
							<ul>
								<li class="step1"><strong>1.에스크로 약관동의<br>에스크로 거래시</strong></li>
								<li class="step2"><strong>2.입금은행 선택</strong></li>
								<li class="step3"><strong>3.가상계좌번호 확인</strong></li>
								<li class="step4"><strong>4.은행입금</strong></li>
								<li class="step5"><strong>5.결제완료</strong></li>
							</ul>
						</div>
						<p class="prgrp_common">회원님이 입금할 은행을 선택하면 가상의 계좌가 발급되며, 할당된 계좌번호로 입금확인이 완료되면 예치금으로 충전됩니다.</p>

						<iframe name="payIframe" src="" width="0" height="0" title="result"></iframe>

					</div>
					<!-- 지정계좌 입금 end -->
				</div>
			</main>
			<!-- -------------------------------------- -->
		</section>
	</div>
</div>
<!-- ----------------------------------------------------- -->