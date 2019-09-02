<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/reset.css?ver=1" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/purchase.css?ver=1" />
<div class="body">
	<div class="containerWrap">
		<section class="contentSection">
			<!-- ----------왼쪽메뉴---------- 영역 -->
			<nav class="lnbNav">

				<div id="snb" class="lnb">
					<h2 id="01" class="lnb_title">복권구매</h2>
					<ul id="lnb" class="lnb_dep1">
						<li id="01-01" class="active"><a href="#" class="menuLnb"><span>로또
									6/45 구매</span></a></li>
						<li id="01-02"><a href="#" class="menuLnb"><span>연금복권
									520 구매</span></a></li>
					</ul>
				</div>

			</nav>
			<!-- -------------------------------------- -->
			<!-- ----------메인컨텐츠---------- 영역 -->
			<main id="article" class="contentsArticle" style="font-family: 'Roboto', 'Noto Sans KR', sans-serif;">
			<div class="game-645-wrap">
				<div class="game-645-header">
					<div class="current">
						<div class="now">
							<h2>
								<span>제</span><strong id="curRound">${lastGame.games+1}</strong><span>회</span>
							</h2>
							<p>
								<fmt:formatDate var="drawDate" value="${lastGame.drawDate}"
									pattern="yy-MM-dd" />
								<span>추첨일</span><strong id="countTime">${drawDate}</strong>
							</p>
						</div>
						<ul class="prize_and">
							<li><span>1등 예상 총 당첨금액</span><strong>85,120,015</strong></li>
							<li>&nbsp;</li>

						</ul>
					</div>
					<div class="past">
						<h3 style="color:white;">
							<strong>${lastGame.games}</strong>회 당첨결과
						</h3>
						<p>
							<c:forEach begin="0" end="5" varStatus="vs" step="1">
								<fmt:parseNumber var="num"
									value="${fn:substring(lastGame.winningNum,vs.index*2,vs.count*2) }" />
								<c:choose>
									<c:when test="${num lt 11 }">
										<span class="ball color1"><span>${num }</span></span>
									</c:when>
									<c:when test="${num lt 21 }">
										<span class="ball color2"><span>${num }</span></span>
									</c:when>
									<c:when test="${num lt 31 }">
										<span class="ball color3"><span>${num }</span></span>
									</c:when>
									<c:when test="${num lt 41 }">
										<span class="ball color4"><span>${num }</span></span>
									</c:when>
									<c:otherwise>
										<span class="ball color5"><span>${num }</span></span>
									</c:otherwise>
								</c:choose>
							</c:forEach>

							<span class="ext">보너스번호</span>
							<c:choose>
								<c:when test="${lastGame.bonusNum lt 11 }">
									<span class="ball color1"><span>${lastGame.bonusNum }</span></span>
								</c:when>
								<c:when test="${lastGame.bonusNum lt 21 }">
									<span class="ball color2"><span>${lastGame.bonusNum }</span></span>
								</c:when>
								<c:when test="${lastGame.bonusNum lt 31 }">
									<span class="ball color3"><span>${lastGame.bonusNum }</span></span>
								</c:when>
								<c:when test="${lastGame.bonusNum lt 41 }">
									<span class="ball color4"><span>${lastGame.bonusNum }</span></span>
								</c:when>
								<c:otherwise>
									<span class="ball color5"><span>${lastGame.bonusNum }</span></span>
								</c:otherwise>
							</c:choose>
						</p>
						<a class="watch" href="#" onclick="javascript:guide05();">추첨방송보기</a>
					</div>
				</div>
				<div class="game-645-content">
					<!-- 번호선택 -->
					<div class="select-number">
						<div class="header">
							<h3>로또 구매방법 선택</h3>
							<ul id="tabWay2Buy">
								<li class="active">
									<a href="#" id="mix" ><strong>혼합선택</strong><span>원하시는
											번호를 직접입력 또는 자동으로 구매할 수 있습니다.</span></a>
								</li>
								<li>
									<a href="#" id="auto" ><strong>자동번호발급</strong><span>구매
											수량 전체를 자동번호로 발급 받을 수 있습니다.</span></a>
								</li>
								
							</ul>
							
							<input type="hidden" id="selectedTab" name="selectedTab"
								value="0"> <input type="hidden" id="ROUND_DRAW_DATE"
								name="ROUND_DRAW_DATE" value="2019/08/24"> <input
								type="hidden" id="WAMT_PAY_TLMT_END_DT"
								name="WAMT_PAY_TLMT_END_DT" value="2020/08/25">
						</div>
						<div class="ways">
							<!-- 번호선택/자동번호발급 -->
							<div id="divWay2Buy1" class="way way1" style="display: block">
								<div class="paper">
									<div class="top">
										<strong id="textPaperInt"></strong> <span><span
											id="textPaperPmt">1,000</span><span>원</span></span>
									</div>
									<!-- input[type="checkbox"]#check645num$[name="check645num"][onchange="checkLength645($(this))"][value="$"]+label[for="check645num$"]{$} -->
									<div id="checkNumGroup" class="check">
										<input type="hidden" id="activeGbn" name="activeGbn">

										<c:forEach var="number" begin="1" end="45" step="1">

											<input type="checkbox" id="check645num${number }"
												name="check645num" value="${number }">
											<label for="check645num${number }" style="padding-left: 0px;">${number }</label>
										</c:forEach>

											<div id="coverPaper" class="box-autoselect" style="display: none;">
												<div class="inner">
													<div class="inner2">
														<p>구매하기 완료 시 <br>로또번호가 자동으로 <br>발급됩니다.</p>
													</div>
												</div>
											</div>
										<script>
											$(function(){
												// 왼쪽버튼
												var leftBtn = $("#tabWay2Buy li");
												var leftvalue;
												var cover = $("#coverPaper");
												leftBtn.click(function(){
													
													leftBtn.removeClass("active");
													$(this).addClass("active");
												
													leftvalue = $(this).find('a').attr('id');
													
													if(leftvalue == 'auto')
														cover.css('display','');
													else
														cover.css('display','none');

												});

												var check = $("#checkNumGroup input[type=checkbox]");
												check.click(function(e){
													// checked 갯수
													var checked = $("#checkNumGroup input:checked");
													var leng = checked.length;
													// 6개 이상 체크방지
													if(leng > 6){
														alert("6개넘음");
														$(this).prop('checked', false);
													}
													
												});

												var reset = $("#select_reset");
												reset.click(function(){
													check.prop("checked",false);
												});


												var alphabet = ['A','B','C','D','E'];
												var a = 0;
												var selectBtn = $("#btnSelectNum");
												//테스트
												var del = $("#delA");
												del.click(function(){
													var a = $("input[name=methodA]");
													alert("method : "+a.val());
												});
												selectBtn.click(function () {

													//var auto = $("#select_auto");
													var checked = $("#checkNumGroup input:checked");
													var amt = parseInt($("#amoundApply option:selected").val());
													console.log("amt : "+amt);
													console.log("시작 a : "+a);
													console.log("a+amt : "+(a+amt));
													
													if(a+amt > 5){
														alert("최대 5장 구매 가능합니다.");
														return;
													}
													

													for(var j=0;j<amt;j++){
														var methodlabel = $("#method"+alphabet[a]);
														var method_ = "input[name=method"+alphabet[a]+"]";
														console.log(method_);
														var method = $(method_);
														console.log("method.val() = "+method.val());

														if(leftvalue == 'auto'){
															methodlabel.text("자동");
															method.val(1);
															console.log("입력후 method : "+method.val());
															for(var i=0;i<6;i++){
																var id = "#num"+(i+1)+alphabet[a];
																var span = $(id);
																span.addClass("ball");
																span.text("0");
															}
														}
														else{
															methodlabel.text("수동");
															method.val(2);
															console.log("입력후 method : "+method.val());
															checked.each(function (i, data) {
																var id = "#num"+(i+1)+alphabet[a];
																var span = $(id);
																var num = data.value;

																if(num < 11)
																	span.addClass("color1");
																else if(num < 21)
																	span.addClass("color2");
																else if(num < 31)
																	span.addClass("color3");
																else if(num < 41)
																	span.addClass("color4");
																else
																	span.addClass("color5");

																span.text(data.value);
																var inputNum = $("input[name=num"+(i+1)+alphabet[a]+"]");
																inputNum.val(data.value);
																console.log(inputNum.val());
															});
														}
														
														a++;
													}
													
													payAmt.text((a)*1000);
													console.log("끝 a : "+a);
												});
												var payAmt = $("#payAmt");
												var deposit = $("#myDeposit");

												var buyForm = $("#buyForm");

												var btnBuy = $("#btnBuy");
												btnBuy.click(function(e){
													e.preventDefault();
													console.log("payAmt : "+payAmt.text());
													console.log("deposit : "+deposit.text());
													if(parseInt(payAmt.text()) > parseInt(deposit.text()))
														alert("예치금이 부족합니다.");
													else
														buyForm.submit();
												})
											});
										</script>

										<div class="action">
											<span class="btn"><input type="button" id="select_reset" name="" value="초기화"></span>
											<input class="checkbox" type="checkbox" id="select_auto" name="checkAutoSelect">
											<label for="select_auto"><span>자동선택</span></label>
											<span class="btn"><input type="button"
												id="btnRegMyNumber" value="나의번호등록"></span>
										</div>
										<div id="coverPaper" class="box-autoselect"
											style="display: none">
											<div class="inner">
												<div class="inner2">
													<p>
														구매하기 완료 시 <br>로또번호가 자동으로 <br>발급됩니다.
													</p>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="amount">
									<label for="amoundApply">적용수량</label> 
									<select id="amoundApply" name="">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
									</select> 
									<input type="button" class="button lrg confirm" id="btnSelectNum" name="btnSelectNum" value="확인">
								</div>
							</div>
							<!-- //번호선택/자동번호발급 -->
							<!-- 직전회차번호 -->
							<div id="divWay2Buy2" class="way mynum way2"
								style="display: none">
								<h4>구매내역</h4>
								<div class="my-number">
									<ul id="preList">
										<!-- nodata -->
										<!-- 데이터 없을 경우 주석 풀어서 사용해주세요 <li class="nodata">
                                <p>구매 내역이 없습니다.</p>
                            </li> -->
										<!-- //nodata -->
										<!-- loop -->
									</ul>
								</div>
								<div class="btn">
									<input type="button" class="button confirm lrg"
										name="btnPreNumber" value="확인">
								</div>
							</div>
							<!-- //나의로또번호 -->
							<div id="divWay2Buy3" class="way mynum way3"
								style="display: none">
								<h4>내 로또번호</h4>
								<div class="my-number">
									<ul id="myList">
										<!-- nodata -->
										<!-- 데이터 없을 경우 주석 풀어서 사용해주세요 
                            <li class="nodata">
                                <p>저장된 번호가 없습니다.</p>
                            </li> -->
										<!-- //nodata -->
									</ul>
								</div>
								<div class="btn">
									<input type="button" class="button confirm lrg"
										name="btnMyNumber" value="확인"> <input type="button"
										class="button confirm lrg" id="btnDeleteMyNumber"
										name="btnDeleteMyNumber" value="삭제">
								</div>
							</div>
							<!-- //나의로또번호 -->
						</div>
					</div>
					<!-- //번호선택 -->
					<!-- 선택 확인 -->
					<div class="selected-games">
						<div class="header">
							<h3>선택번호 확인</h3>
							<input type="button" id="resetAllNum" name="resetAllNum"
								class="button confirm lrg" value="초기화">
						</div>
						<div class="game" id="selectRow">
							<ul>
								<form id="buyForm" method="post">
								<c:forTokens var="ch" items="A,B,C,D,E" delims=",">
									<li>
										<strong><span>${ch }</span><span id="method${ch }">미지정</span></strong>
										<input type="hidden" name="method${ch }" value="0" />
										<div class="nums">
											<c:forEach var="num" begin="1" end="6">
												<span id="num${num}${ch}"></span>
												<input type="hidden" name="num${num}${ch}" value="0" />
											</c:forEach>
										</div>
										<div class="btn">
											<input type="button" class="button mid" id="del${ch}" name="del${ch}" value="삭제">
										</div>
									</li>
								</c:forTokens>
								</form>
							</ul>
						</div>
						<div class="footer">
							<div class="set set1">
								<span>보유예치금</span> 
								<input type="button" class="button sml" id="depositlink" name="" value="충전">
								<script>
									$(function(){
										var btn = $("#depositlink");
										btn.click(function(){
											location.href = "${pageContext.request.contextPath}/mypage/deposit/2";
										});
									});
								</script> 
								<strong>
									<span id="myDeposit">${sessionScope.member.deposit }</span><span>원</span>
								</strong>
							</div>
							<div class="set set2">
								<span>결제금액</span> <strong><span id="payAmt">0</span><span>원</span></strong>
							</div>
							<input type="button" class="button buy" id="btnBuy" name="btnBuy"
								value="구매하기">
						</div>
					</div>
					<!-- //선택 확인 -->
				</div>


			</div>
			</main>
			<!-- -------------------------------------- -->

		</section>
	</div>
</div>