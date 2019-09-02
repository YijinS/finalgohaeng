<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="body">
	<div class="containerWrap">
		<section class="contentSection">
			<!-- ----------왼쪽메뉴---------- 영역 -->
			<nav class="lnbNav">
				<div id="snb" class="lnb">
					<h2 id="03" class="lnb_title">당첨결과</h2>
					<ul id="lnb" class="lnb_dep1">
						<li id="03-01" class="active"><a
								href="${pageContext.request.contextPath }/gameresult/lotto645/1"
								class="menuLnb"><span>로또6/45</span></a>
							<ul class="lnb_dep2">
								<li id="03-01-01" class="active"><a
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
						<li id="03-07"><a href="${pageContext.request.contextPath }/gameresult/winningnews/1" class="menuLnb">
							<span>당첨소식</span></a></li>
						<li id="03-08"><a href="${pageContext.request.contextPath }/gameresult/unreceived/1" class="menuLnb">
							<span>미수령 당첨금</span></a>
						</li>
					</ul>
				</div>
			</nav>
			<!-- -------------------------------------- -->
			<!-- ----------메인컨텐츠---------- 영역 -->
			<main id="article" class="contentsArticle">
				<div class="header_article">
					<h3 class="sub_title">회차별 당첨번호</h3>
					<p class="location">
						<a class="home" href="/"> Home </a><span class="gt">&gt;</span><a href="#">당첨결과</a><span
							class="gt">&gt;</span><a href="#"><span>로또6/45</span></a><span class="gt">&gt;</span><a
							href="#"> 회차별 당첨번호</a>
					</p>
				</div>
				<div>
					<div class="content_wrap content_winnum_645">

						<div class="search_data">
							<div class="inner">
								<form name="frm">
									<span class="unit label">회차 바로가기</span> <input type="hidden" name="drwNo"> <select
										id="dwrNoList" title="회차 선택">
										<c:forEach var="num" items="${games }">
											<option value="${num }">${num }</option>
										</c:forEach>
									</select> <a id="searchBtn" class="btn_common form blu"
										href="javascript:void(0)">조회</a>
								</form>
							</div>
						</div>
						<script>
							$(function () {
								var searchBtn = $("#searchBtn");
								searchBtn
									.click(function () {
										var games = $(
											"#dwrNoList option:selected")
											.val();
										$
											.getJSON(
												"${pageContext.request.contextPath}/gameresult/lotto645/ajax?games="
												+ games)
											.done(
												function (games) {
													var resultForm = $(".win_result");
													var resultNums = resultForm.find("#wns");
													var resultBonus = resultForm.find("#bns span");

													resultNums.html("");
													//resultBonus.html("");

													//<span class="ball_645 lrg ball1">${num }</span>
													var nums = games.winningNum;
													for (var i = 0; i < 6; i++) {
														var j = i + 1;
														//console.log(parseInt(nums.substring(i*2,j*2)));
														var num = parseInt(nums.substring(i * 2,j * 2));
														var element;
														if (num < 11)
															element = "<span class='ball_645 lrg ball1'>"
																+ num
																+ "</span>";
														else if (num < 21)
															element = "<span class='ball_645 lrg ball2'>"
																+ num
																+ "</span>";
														else if (num < 31)
															element = "<span class='ball_645 lrg ball3'>"
																+ num
																+ "</span>";
														else if (num < 41)
															element = "<span class='ball_645 lrg ball4'>"
																+ num
																+ "</span>";
														else
															element = "<span class='ball_645 lrg ball5'>"
																+ num
																+ "</span>";

														resultNums.append(element);

													}
													var bonus = parseInt(games.bonusNum);
													for (var i = 0; i < 5; i++) {
														var classname = "ball"
															+ (i + 1);
														resultBonus
															.removeClass(classname);
													}
													if (bonus < 11)
														resultBonus
															.addClass("ball1");
													else if (bonus < 21)
														resultBonus
															.addClass("ball2");
													else if (bonus < 31)
														resultBonus
															.addClass("ball3");
													else if (bonus < 41)
														resultBonus
															.addClass("ball4");
													else
														resultBonus
															.addClass("ball5");

													resultBonus
														.html(bonus);

													var inning = resultForm
														.find("h4 strong");
													var date = resultForm
														.find("#draw_date");

													// Date() 써서 잘라서 붙인거임
													var convert = new Date(games.drawDate);
													var asdf = "(" + convert.getFullYear()+"년 "+ ("0"+(convert.getMonth()+1)).slice(-2) + "월 " + ("0"+convert.getDate()).slice(-2)+"일 추첨)";
													console.log(asdf);
													inning
														.html(games.games
															+ "회");
													date
														.html(asdf);

													
												});

									});
							});
						</script>

						<div class="win_result">

							<h4>
								<strong>${lottoGames.games }회</strong> 당첨결과
							</h4>
							<fmt:formatDate var="drawDate" value="${lottoGames.drawDate }" pattern="(yyyy년 MM월 dd일 추첨)"/>
							<p id="draw_date" class="desc">${drawDate }</p>
							<div class="nums">
								<div class="num win">
									<strong>당첨번호</strong>
									<div id="wns">
										<c:forEach begin="0" end="5" varStatus="vs" step="1">

											<fmt:parseNumber var="num"
												value="${fn:substring(lottoGames.winningNum,vs.index*2,vs.count*2) }" />
											<c:choose>

												<c:when test="${num lt 11 }">
													<span class="ball_645 lrg ball1">${num }</span>
												</c:when>
												<c:when test="${num lt 21 }">
													<span class="ball_645 lrg ball2">${num }</span>
												</c:when>
												<c:when test="${num lt 31 }">
													<span class="ball_645 lrg ball3">${num }</span>
												</c:when>
												<c:when test="${num lt 41 }">
													<span class="ball_645 lrg ball4">${num }</span>
												</c:when>
												<c:otherwise>
													<span class="ball_645 lrg ball5">${num }</span>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</div>
								</div>
								<div class="num bonus">
									<strong>보너스</strong>
									<div id="bns">
										<c:choose>
											<c:when test="${lottoGames.bonusNum lt 11 }">
												<span class="ball_645 lrg ball1">${lottoGames.bonusNum }</span>
											</c:when>
											<c:when test="${lottoGames.bonusNum lt 21 }">
												<span class="ball_645 lrg ball2">${lottoGames.bonusNum }</span>
											</c:when>
											<c:when test="${lottoGames.bonusNum lt 31 }">
												<span class="ball_645 lrg ball3">${lottoGames.bonusNum }</span>
											</c:when>
											<c:when test="${lottoGames.bonusNum lt 41 }">
												<span class="ball_645 lrg ball4">${lottoGames.bonusNum }</span>
											</c:when>
											<c:otherwise>
												<span class="ball_645 lrg ball5">${lottoGames.bonusNum }</span>
											</c:otherwise>
										</c:choose>
									</div>

								</div>
							</div>
						</div>
						<table class="tbl_data tbl_data_col">
							<caption>869회 순위별 등위별 총 당첨금액, 당첨게임 수, 1게임당 당첨금액, 당첨기준,
								비고 안내</caption>
							<colgroup>
								<col style="width: 85px">
								<col style="width: 180px">
								<col style="width: 145px">
								<col style="width: 180px">
								<col>
								<col style="width: 110px">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">순위</th>
									<th scope="col">등위별 총 당첨금액</th>
									<th scope="col">당첨게임 수</th>
									<th scope="col">1게임당 당첨금액</th>
									<th scope="col">당첨기준</th>
									<th scope="col">비고</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1등</td>
									<td class="tar"><strong class="color_key1">19,225,825,880원</strong></td>
									<td>10</td>
									<td class="tar">1,922,582,588원</td>
									<td>당첨번호 <strong class="length">6개</strong> 숫자일치
									</td>
									<td rowspan="5">1등<br> 자동8<br> 수동2<br>



									</td>
								</tr>
								<tr>
									<td>2등</td>
									<td class="tar"><strong class="color_key1">3,204,304,320원</strong></td>
									<td>56</td>
									<td class="tar">57,219,720원</td>
									<td class="nobd_right">당첨번호 <strong class="length">5개</strong>
										숫자일치<br>+<strong class="length">보너스</strong> 숫자일치
									</td>
								</tr>
								<tr>
									<td>3등</td>
									<td class="tar"><strong class="color_key1">3,204,305,520원</strong></td>
									<td>2,210</td>
									<td class="tar">1,449,912원</td>
									<td class="nobd_right">당첨번호 <strong class="length">5개</strong>
										숫자일치
									</td>
								</tr>
								<tr>
									<td>4등</td>
									<td class="tar"><strong class="color_key1">5,428,100,000원</strong></td>
									<td>108,562</td>
									<td class="tar">50,000원</td>
									<td class="nobd_right">당첨번호 <strong class="length">4개</strong>
										숫자일치
									</td>
								</tr>
								<tr>
									<td>5등</td>
									<td class="tar"><strong class="color_key1">9,071,660,000원</strong></td>
									<td>1,814,332</td>
									<td class="tar">5,000원</td>
									<td class="nobd_right">당첨번호 <strong class="length">3개</strong>
										숫자일치
									</td>
								</tr>
							</tbody>
						</table>
						<ul class="list_text_common">
							<li>당첨금 지급기한 : 지급개시일로부터 1년 (휴일인 경우 익영업일)</li>
							<li>총판매금액 : <strong>80,268,389,000원</strong></li>
						</ul>
						<div class="btns_function bottom border">
							<div class="left mid">
								<a class="btn_common mid" href="/store.do?method=topStore&amp;pageGubun=L645">당첨판매점
									조회</a>
								<a class="btn_common mid" href="/gameResult.do?method=notReceiveInfo">미수령 당첨금 안내</a>
							</div>
							<div class="right">
								<form name="frm2" id="frm2" action="exeldown" method="post">
									<input type="hidden" name="nowPage" id="nowPage" value="">
									<select id="drwNoStart" name="start" title="출력,엑셀 다운 시작회차 선택">
										<c:forEach var="game" items="${games }" varStatus="vs">
											<c:choose>
												<c:when test="${vs.last }">
													<option value="${game }" selected="selected">${game }</option>
												</c:when>
												<c:otherwise>
													<option value="${game }" >${game }</option>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</select>
									
									<span class="unit">부터</span>
									
									<select id="drwNoEnd" name="end" title="출력,엑셀 다운 종료회차 선택">
										<c:forEach var="game" items="${games }" varStatus="vs">
											<c:choose>
												<c:when test="${vs.first }">
													<option value="${game }" selected="selected">${game }</option>
												</c:when>
												<c:otherwise>
													<option value="${game }" >${game }</option>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</select> 
									<span class="unit">까지</span>
								</form>
								<a class="btn_common form" id="printBtn" href="#"  title="새창 열림">인쇄하기</a>
								<a class="btn_common form" id="exelBtn" href="#">엑셀다운로드</a>
								<script>
					               $(function(){
					                  
					                  
					                  var printBtn = $("#printBtn");
					                  
					                  printBtn.click(function(e){
				                	  	 var start = $("#drwNoStart").val();
						                 var end = $("#drwNoEnd").val();
					                     e.preventDefault();
					                     window.open("${pageContext.request.contextPath}/gameresult/lotto645/print?start="+start+"&end="+end, "네이버새창", "width=800, height=700");
					                  });
					               });
					            </script>
								<script>
									$(function(){
										var exelBtn = $("#exelBtn");
										var exelForm = $("#frm2");
										
										exelBtn.click(function(){
											exelForm.submit();
										});
									});
								</script>
							</div>
						</div>

					</div>
				</div>
			</main>
			<!-- -------------------------------------- -->
		</section>
	</div>
</div>