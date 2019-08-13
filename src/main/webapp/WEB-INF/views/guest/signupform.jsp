<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="body">
	<div class="containerWrap">
		<section class="contentSection">
			<div id="article" class="contentsArticle">
				<div class="header_article">
					<h3 class="sub_title">회원정보입력</h3>
					<p class="location">
						<a class="home" href="/"> Home </a><span class="gt">&gt;</span><a
							href="/user.do?method=login">회원서비스</a><span class="gt">&gt;</span><a
							href="/loginJoin.do?method=joinFormAgree">회원가입</a>
					</p>
				</div>
				<!-- 
		<ul class="step" device="phone">
			<li>[STEP 1] 약관동의</li>
			<li>[STEP 2] 본인인증</li>
			<li class="selected">[STEP 3] 회원정보 입력</li>
			<li>[STEP 4] 회원가입 완료</li>
		</ul>
		 -->
				<div>
					<div class="content_wrap content_join_form">
						<!-- -------------------------------------------------------------------------------------- -->

						<!-- 회원가입 Param BEGIN -->
						<!-- 본인인증 후 결과 처리 Form -->
						<!-- 테그의 네임과 ibatis의 프로퍼티 값이 같아야 한다.	기존 소스의 성격을 최대 한 수정 하지 않고 하기 위해 이름이 추가 된 것 -->
						<form method="post">



							<!-- 회원가입 Param END -->

							<!-- 개인정보 입력 start -->
							<div class="group_content">
								<div class="group_title">
									<h4 class="title">개인정보</h4>
									<p class="note_req">
										<span class="req">*<span class="accessibility">별표</span></span>
										는 필수입력 사항입니다.
									</p>
								</div>
								<table class="tbl_form_write">
									<caption>아이디, 비밀번호, 생년월일, 휴대폰번호, 이메일 주소, 주소 등 정보를
										입력합니다.</caption>

									<colgroup>
										<col style="width: 125px">
										<col>
									</colgroup>

									<tbody>
										<tr class="id">
											<th scope="row">
												아이디<span class="req">*<span class="accessibility">별표</span></span>
											</th>
											<td>
												<input type="text" name="id" value="" maxlength="14"> 
												<span id="check-id" value="not"></span>
											</td>
										</tr>
										<tr class="pass">
											<th scope="row">
												비밀번호<span class="req">*<span class="accessibility">별표</span></span></th>
											<td>
												<input type="password" name="pwd" id="pwd" maxlength="20" autocomplete="off">
												<span id="check-pwd"></span>
											</td>
										</tr>
										<tr class="pass2">
											<th scope="row">비밀번호 확인<span class="req">*<span class="accessibility">별표</span></span></th>
											<td>
												<input type="password" name="pwd2" id="pwd2" maxlength="20" autocomplete="off"> 
												<span id="check-pwd2"></span>
											</td>
										</tr>

										<script>
											window.addEventListener("load", function () {
													var section = document.querySelector("tbody");

													var id = section.querySelector("input[name=id]");
													var checkid = section.querySelector("#check-id");

													var pwd = section.querySelector("input[name=pwd]");
													var pwd2 = section.querySelector("input[name=pwd2]");
													var check = section.querySelector("#check-pwd");
													var pwdcheck = section.querySelector("#check-pwd2");

													var submit = section.querySelector("#id_auth_btn");



													pwd.oninput = function () {
														if (pwd.value.includes(" ")) {
															check.innerText = "공백은 포함될 수 없습니다.";
															check.style.color = "red";
															check.value = "not";
															pwd.style.border = "2px solid orangered";

														} else {
															check.innerText = "";
															check.value = "ok";
															pwd.style.border = "2px solid green";
														}
													}
													pwd2.oninput = function () {
														if (pwd.value == pwd2.value) {
															pwdcheck.innerText = "일치합니다."
															pwdcheck.style.color = "green";
															pwd.style.border = "2px solid green";
															pwd2.style.border = "2px solid green";
															pwdcheck.value = "ok";
														} else {
															pwdcheck.innerText = "불일치합니다."
															pwdcheck.style.color = "red";
															pwd2.style.border = "2px solid orangered";
															pwdcheck.value = "not";
														}
													};

													submit.onclick = function (e) {

														if (checkid.value != "ok") {
															alert("아이디 중복확인을 눌러주세요.");
															e.preventDefault();
															return;
														}
														if (check.value != "ok" || pwdcheck.value != "ok") {
															alert("비밀번호를 다시 확인하십시오.");
															e.preventDefault();
															return;
														}

													};

													checkid.onclick = function() {
														alert("클릭은 됫음");
														var userid = id.value;
														if (userid == "" || userid == null || userid.includes(" ")) {
															alert("공백 는(은) 사용할 수 없습니다.");
															id.style.border = "2px solid orangered";
															exist.value = "not";
															return;
														}

														

														var request = new XMLHttpRequest();
														request.open("GET", "${pageContext.request.contextPath}/guest/ajax?id=" + userid, false);
														request.send();
														var json = JSON.parse(request.responseText);

														if (json["usedId"] == true) {
															alert(userid + "는(은) 사용할 수 없습니다.");

															id.style.border = "2px solid orangered";
															exist.value = "not";
															return;
														} else {
															alert(userid + "는(은) 사용 가능 합니다.");
															id.style.border = "2px solid green";
															exist.value = "ok";
														}
													};
												});
										</script>

										<tr class="name">
											<th scope="row">
												이름<span class="req">*<span class="accessibility">별표</span></span>
											</th>
											<td>
												<input type="text" name="name">
											</td>
										</tr>

										<tr class="birth">
											<th scope="row">
												생년월일<span class="req">*<span class="accessibility">별표</span></span>
											</th>
											<td>
												<input type="date" name="birthday" maxlength="">
											</td>
										</tr>

										<tr class="hp">
											<th scope="row">
												휴대폰번호<span class="req">*<span class="accessibility">별표</span></span>
											</th>
											<td>
												<select id="mobile1" name="tel1">
													<option value="010">010</option>
													<option value="011">011</option>
													<option value="016">016</option>
													<option value="017">017</option>
													<option value="018">018</option>
													<option value="019">019</option>
												</select>

												<span class="unit">-</span>

												<input id="mobile2" name="tel2" type="text" maxlength="4">

												<span class="unit">-</span> 

												<input id="mobile3" name="tel3" type="text" maxlength="4"> 
												<span class="check-hp"></span>
											</td>
										</tr>

										<tr class="email">
											<th scope="row">
												이메일주소<span class="req">*<span class="accessibility">별표</span></span>
											</th>
											<td>
												<input id="email_id" type="text" name="email1" value=""> 

												<span class="unit">@</span> 

												<input id="email_domain" type="text" name="email2" value=""> 
												
												<select name="email_domain_sel" id="email_domain_sel">
													<option value="">직접입력</option>
													<option value="naver.com">naver.com</option>
													<option value="nate.com">nate.com</option>
													<option value="empal.com">empal.com</option>
													<option value="hotmail.com">hotmail.com</option>
													<option value="lycos.co.kr">lycos.co.kr</option>
													<option value="msn.com">msn.com</option>
													<option value="hanmail.net">hanmail.net</option>
													<option value="yahoo.com">yahoo.com</option>
													<option value="korea.com">korea.com</option>
													<option value="kornet.net">kornet.net</option>
													<option value="yahoo.co.kr">yahoo.co.kr</option>
													<option value="kebi.com">kebi.com</option>
													<option value="orgio.net">orgio.net</option>
													<option value="paran.com">paran.com</option>
													<option value="gmail.com">gmail.com</option>
												</select>
											</td>
										</tr>

										<tr class="addr">
											<th scope="row">주소</th>
											<td>
												<div class="brk">
													<input id="zipCode" name="zipCode" type="text" readonly="readonly">
													<a class="btn_common form" href="#">우편번호 찾기</a>
												</div>
												<div class="brk">
													<input type="text" size="30" name="addr1" id="addr1" maxlength="40" readonly=""> 
													<input type="text" size="30" name="addr2" id="addr2" maxlength="40">
												</div>
												<p class="comt_valid">이벤트 당첨 시 경품제공을 위한 주소정보입니다.</p>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- 개인정보 입력 end -->
							<!-- 정보수신여부 및 관심항목 설정 start -->
							<div class="group_content">
								<div class="group_title">
									<h4 class="title">정보수신여부 및 관심항목 설정</h4>
								</div>
								<table class="tbl_form_write">
									<caption>SMS, 이메일, 판매원 모집 등 정보수신여부 설정</caption>

									<colgroup>
										<col style="width: 125px">
										<col style="width: 325px">
										<col style="width: 125px">
										<col>
									</colgroup>

									<tbody>
										<tr>
											<th scope="row">SMS수신여부</th>
											<td>
												<input type="radio" name="checkSms" id="smsFlagY" value="1" checked="">
												<label for="smsFlagY">예</label>
												<input type="radio" name="checkSms" id="smsFlagN" value="0">
												<label for="smsFlagN">아니오</label>
											</td>

											<th scope="row">이메일 수신여부</th>
											<td>
												<input type="radio" name="checkEmail" id="emailFlagY" value="1" checked="">
												<label for="emailFlagY">예</label> 
												<input type="radio" name="checkEmail" id="emailFlagN" value="0">
												<label for="emailFlagN">아니오</label>
											</td>
										</tr>
										<tr>
											<th scope="row">판매원모집 <br>SMS 수신여부</th>
											<td colspan="3">
												<input type="radio" name="checkSales" id="intJoinSmsY" value="1">
												<label for="intJoinSmsY">예</label>
												<input type="radio" name="checkSales" id="intJoinSmsN" value="0" checked="">
												<label for="intJoinSmsN">아니오</label>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- 정보수신여부 및 관심항목 설정 end -->
							<div class="btns_submit">
									<input type="button" class="btn_common lrg" onclick="mainForm.reset()" value="초기화"> 
									<input type="submit" class="btn_common lrg blu" value="회원가입">
							</div>
						</form>

						

						<!-- mainForm END -->

						<iframe name="proIframe" id="proIframe" width="0" height="0"
							title="proJoin"></iframe>


						<!-- -------------------------------------------------------------------------------------- -->
					</div>
				</div>
			</div>
		</section>
	</div>
</div>