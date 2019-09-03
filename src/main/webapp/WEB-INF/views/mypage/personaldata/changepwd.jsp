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
						<li id="07-01"><a
							href="${pageContext.request.contextPath }/mypage/home"
							class="menuLnb"><span>마이페이지 홈</span></a></li>
						<li id="07-02"><a href="#" class="menuLnb"><span>구매/당첨</span></a>
						<li id="07-03"><a href="#" class="menuLnb"><span>구매현황분석</span></a></li>
						<li id="07-04"><a href="#" class="menuLnb"><span>건전구매
									프로그램</span></a></li>
						<li id="07-05"><a href="#" class="menuLnb"><span>예치금</span></a></li>
						<li id="07-06"><a href="#" class="menuLnb"><span>행복더하기
									신청</span></a></li>
						<li id="07-07" class="active"><a
							href="${pageContext.request.contextPath }/mypage/personaldata/editData"
							class="menuLnb"><span>개인정보</span></a>
							<ul class="lnb_dep2" style="display: block;">
								<li id="07-07-01"><a
									href="${pageContext.request.contextPath }/mypage/personaldata/editData"><span>
											개인정보변경</span></a></li>
								<li id="07-07-02" class="active"><a
									href="${pageContext.request.contextPath }/mypage/personaldata/changepwd"><span>
											비밀번호변경</span></a></li>
								<li id="07-07-03"><a href="${pageContext.request.contextPath }/guest/withdrawform"><span> 회원탈퇴 </span></a></li>
							</ul></li>
					</ul>
				</div>

			</nav>
			<!-- -------------------------------------- -->
			<!-- ----------메인컨텐츠---------- 영역 -->
			<main id="article" class="contentsArticle">
			<div class="header_article">
				<h3 class="sub_title">비밀번호변경</h3>
				<p class="location">
					<a class="home" href="/"> Home </a><span class="gt">&gt;</span><a
						href="#">마이페이지</a><span class="gt">&gt;</span><a href="#"><span>개인정보</span></a><span
						class="gt">&gt;</span><a href="#"> 비밀번호변경</a>
				</p>
			</div>
			<div>
				<div class="content_wrap content_change_password">
					<div class="group_content">
						<div class="group_title">
							<h4 class="title">비밀번호변경</h4>
							<p class="note_req">
								<span class="req">*</span> 는 필수입력 사항입니다.
							</p>
						</div>
						<form method="post" name="userIdCheckForm" action="changepwdupdate">
							<table class="tbl_form_write">
								<caption>비밀번호 변경 정보 입력 테이블</caption>
								<colgroup>
									<col style="width: 125px">
									<col>
								</colgroup>
								<tbody>
									<tr>
										<th>현재 비밀번호<span class="req">*</span></th>
										<td><input type="password" name="pwd"
											title="현재 비밀번호" autocomplete="off"></td>
									</tr>
									<tr>
										<th>변경할 비밀번호<span class="req">*</span></th>
										<td>
											<input type="password" id="newpwd" name="newpwd" title="새 비밀번호" autocomplete="off"> 
											<span id="check-pwd"></span>
										</td>
									</tr>
									<tr>
										<th>변경할 비밀번호<span class="req">*</span></th>
										<td>
											<input type="password" id="newpwd2" name="newpwd2" title="새 비밀번호 확인" autocomplete="off"> 
											<span id="check-pwd2" >*패스워드를 한번 더 입력하시기 바랍니다.</span>
										</td>
									</tr>
								</tbody>
							</table>
							<div class="btns_submit">
								<a class="btn_common lrg" href="#">취소</a>
								<button id="submit" class="btn_common lrg blu">변경</button>								
							</div>
						</form>
						<script>
						window.addEventListener("load", function () {
							var tbody = document.querySelector("tbody");
							
							var pwd = tbody.querySelector("input[name=pwd]");
							var newpwd = tbody.querySelector("input[name=newpwd]");
							var newpwd2 = tbody.querySelector("input[name=newpwd2]");
							var check = tbody.querySelector("#check-pwd");
							var pwdcheck = tbody.querySelector("#check-pwd2");

							var submit = document.querySelector("#submit");
							
							newpwd.oninput = function () {
								if (newpwd.value.includes(" ")) {
									check.innerText = "공백은 포함될 수 없습니다.";
									check.style.color = "red";
									check.value = "not";
									newpwd.style.border = "2px solid orangered";

								} else {
									check.innerText = "";
									check.value = "ok";
									newpwd.style.border = "2px solid green";
								}
							}
							
							newpwd2.oninput = function () {
								if (newpwd.value == newpwd2.value) {
									pwdcheck.innerText = "일치합니다."
									pwdcheck.style.color = "green";
									newpwd.style.border = "2px solid green";
									newpwd2.style.border = "2px solid green";
									pwdcheck.value = "ok";
								} else {
									pwdcheck.innerText = "불일치합니다."
									pwdcheck.style.color = "red";
									newpwd2.style.border = "2px solid orangered";
									pwdcheck.value = "not";
								}
							};
							
							submit.onclick = function (e) {	
								if (check.value != "ok" || pwdcheck.value != "ok") {
									alert("비밀번호를 다시 확인하십시오.");
									e.preventDefault();
									return;
								}
								else if(pwd.value == null || pwd.value==""){
									alert("현재비밀번호를 다시 확인하십시오.");
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