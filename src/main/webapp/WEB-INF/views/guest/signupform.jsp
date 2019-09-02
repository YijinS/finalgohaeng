<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- 다음 주소  -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>

<!-- 다음 주소 끝 -->
<div class="body">
	<div class="containerWrap">
		<section class="contentSection">

			<!-- ----------왼쪽메뉴---------- 영역 -->
			<nav class="lnbNav">

				<div id="snb" class="lnb">
					<h2 id="09" class="lnb_title">회원서비스</h2>
					<ul id="lnb" class="lnb_dep1">
						<li id="09-01"><a href="${pageContext.request.contextPath }/guest/login" class="menuLnb"><span>로그인</span></a></li>
						<li id="09-02"><a href="#" class="menuLnb"><span>아이디/비밀번호
									찾기</span></a></li>
						<li id="09-03" class="active"><a href="${pageContext.request.contextPath }/guest/signup" class="menuLnb"><span>회원가입</span></a></li>
					</ul>
				</div>

			</nav>
			<!-- -------------------------------------- -->
			<div id="article" class="contentsArticle">
				<div class="header_article">
					<h3 class="sub_title">회원정보입력</h3>
					<p class="location">
						<a class="${pageContext.request.contextPath }/home" href="/"> Home </a><span class="gt">&gt;</span><a
							href="${pageContext.request.contextPath }/guest/login">회원서비스</a><span class="gt">&gt;</span><a
							href="${pageContext.request.contextPath }/guest/signup">회원가입</a>
					</p>
				</div>

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
												<input type="date" name="birthday" id="birth" maxlength="">
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
												<input type="email" id="email" name="email" >
												<%--<a href="emailAuth.do"><input type="button" id="certification" value="이메일 인증"/></a>
												 <input type="hidden" id="pInput" value="${authkey}">
												<input type="text" id="prcheck" value="인증미확인"/> --%>

												<!-- 잠시 보류
												
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
												</select> -->
											</td>
										</tr>

										<tr class="addr">
											<th scope="row">주소</th>
											<td>
												<div class="brk">
													<input type="text" name="zipCode" id="sample6_postcode" placeholder="우편번호">
													<input class="btn_common form" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
												</div>
												<input type="text" size="30" name="addr1" id="sample6_address" placeholder="주소"><br>
												<input type="text" size="30" name="addr2" id="sample6_extraAddress" placeholder="참고항목">
												<input type="text" id="sample6_detailAddress" placeholder="상세주소">
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
									<input type="submit" id="submit_btn" class="btn_common lrg blu" value="회원가입">
							</div>
						</form>
						<script>
							$(function(){
								var btn = $("#submit_btn");
								
								
								btn.click(function(e){
									var birth = new Date($("#birth").val());
									var nowYear = new Date(Date.now());
									var age = nowYear.getFullYear() - birth.getFullYear();
									if(age < 19){
										e.preventDefault();
										alert("20살 미만은 가입이 불가능 합니다.");
									}
								});
									
								
							});
						</script>
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