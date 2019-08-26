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
						<li id="07-01"><a href="#" class="menuLnb"><span>마이페이지
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
							<ul class="lnb_dep2" style="display: none;">
								<li id="07-04-01"><a href="#" class="menuLnb"><span>건전구매
											프로그램 홈</span></a></li>
								<li id="07-04-02"><a href="#"><span>
											셀프진단평가 </span></a></li>
								<li id="07-04-03"><a href="#"><span> 셀프구매계획 </span></a></li>
								<li id="07-04-04"><a href="#"><span> 셀프휴식계획 </span></a></li>
							</ul></li>
						<li id="07-05"><a href="#" class="menuLnb"><span>예치금</span></a>
							<ul class="lnb_dep2" style="display: none;">
								<li id="07-05-01"><a href="#"><span> 예치금 충전 내역</span></a></li>
								<li id="07-05-02"><a href="#"><span> 충전하기</span></a></li>
								<li id="07-05-03"><a href="#"><span> 출금 신청</span></a></li>
							</ul></li>
						<li id="07-06"><a href="#" class="menuLnb"><span>행복더하기
									신청</span></a></li>
						<li id="07-07" class="active"><a href="${pageContext.request.contextPath }/mypage/personaldata/modifylogin" class="menuLnb"><span>개인정보</span></a>
							<ul class="lnb_dep2" style="">
								<li id="07-07-01" class="active"><a href="${pageContext.request.contextPath }/mypage/personaldata/1"><span> 개인정보변경</span></a></li>
								<li id="07-07-02"><a href="${pageContext.request.contextPath }/mypage/personaldata/changepwd"><span> 비밀번호변경</span></a></li>
								<li id="07-07-03"><a href="${pageContext.request.contextPath }/mypage/personaldata/3"><span> 회원탈퇴 </span></a></li>
							</ul></li>
					</ul>
				</div>

			</nav>
			<!-- -------------------------------------- -->
			<!-- ----------메인컨텐츠---------- 영역 -->
			<main id="article" class="contentsArticle">
			<div class="header_article">
				<h3 class="sub_title">비밀번호 확인</h3>
				<p class="location">
					<a class="home" href="/"> Home </a><span class="gt">&gt;</span><a
						href="#">마이페이지</a><span class="gt">&gt;</span><a href="#"><span>개인정보</span></a><span
						class="gt">&gt;</span><a href="#"> 개인정보변경</a>
				</p>
			</div>
			<div>
				<div class="content_wrap content_login_modify">
					<div class="box_login_modify">
						<form name="frm" id="frm" method="post" action="modifylogin1">
							<p class="copy">
								정보를 안전하게 보호하기 위해 <br>
								<strong>비밀번호를 다시 한번 확인</strong>합니다.
							</p>
							<p class="note">비밀번호는 항상 타인에게 노출되지 않도록 주의하시기 바랍니다.</p>
							<table class="tbl_form_write">
								<caption>비밀번호 확인</caption>
								<colgroup>
									<col style="width: 120px">
									<col>
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">아이디</th>
										<td>${sessionScope.member.id}</td>
									</tr>
									<tr>
										<th scope="row">비밀번호</th>
										<td><input type="password" name="pwd"
											title="비밀번호 입력"
											onkeydown="$.enterCheck(window.event.keyCode);"
											autocomplete="off"></td>
									</tr>
								</tbody>
							</table>
							<div class="btns_submit">
								<input type="hidden" name="url" value="${url }" />
								<a class="btn_common lrg" href="history.back(-1);">취소</a> 
								<button class="btn_common lrg blu" id="submit">확인</button>>
							</div>
						</form>
						<script>
						window.addEventListener("load", function () {
							var tbody = document.querySelector("tbody");
							
							var pwd = tbody.querySelector("input[name=pwd]");
							var submit = document.querySelector("#submit");
							
							submit.onclick = function (e) {	
								
								if(pwd.value == null || pwd.value==""){
									alert("비밀번호를 입력하세요.");
									e.preventDefault();
									return;
								}
								 else
									submit(); 
							};
							
						});
						</script>
					</div>
				</div>
			</div>
			</main>
			<!-- -------------------------------------- -->
		</section>
	</div>
</div>
<!-- ----------------------------------------------------- -->