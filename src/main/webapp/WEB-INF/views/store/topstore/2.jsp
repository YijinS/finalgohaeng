<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



	<div class="body">
		<div class="containerWrap">
			<section class="contentSection">
				<!-- ----------왼쪽메뉴---------- 영역 -->
				<nav class="lnbNav">
					<!-- left menu include -------------->
					<div id="snb" class="lnb">
						<h2 id="04" class="lnb_title">판매점</h2>
						<ul id="lnb" class="lnb_dep1">
							<li id="04-01"><a href="#"
								class="menuLnb"><span>구입처 안내</span></a>
								<ul class="lnb_dep2" style="display: none;">
									<li id="04-01-01"><a href="#"><span>
												로또6/45판매점 조회</span></a></li>
									<li id="04-01-02"><a
										href="#"><span> 즉석 및
												연금복권 판매점 조회</span></a></li>
								</ul></li>
							<li id="04-02" class="active"><a
								href="#"
								class="menuLnb"><span>당첨 판매점</span></a>
								<ul class="lnb_dep2" style="display: block;">
									<li id="04-02-01" class="active"><a
										href="#"><span>
												회차별</span></a></li>
									<li id="04-02-02"><a
										href="#"><span>
												1등 배출점</span></a></li>
									<li id="04-02-03"><a
										href="#"><span>
												2등 배출점</span></a></li>
								</ul></li>
						</ul>
					</div>
					<!-- ----------------------------- -->
				</nav>
				<!-- -------------------------------------- -->
				<!-- ----------메인컨텐츠---------- 영역 -->

				<div id="article" class="contentsArticle">
					<div class="header_article">
						<h3 class="sub_title">1등 배출점</h3>
						<p class="location">
							<a class="home" href="/"> Home </a><span class="gt">&gt;</span><a
								href="#">판매점</a><span class="gt">&gt;</span><a
								href="#"><span>당첨
									판매점</span></a><span class="gt">&gt;</span><a
								href="#">
								1등 배출점</a>
						</p>
					</div>
					<div>
						<div class="content_wrap content_store_win">
							<!-- -------------------------------------------------------------------------------------- -->


							<div class="tab_article tab_size5">



								<ul>
									<li class="active"><strong>로또6/45</strong><span
										class="accessibility">현재 선택됨</span></li>
									<li><a
										href="#">연금복권520</a></li>
									<li><a
										href="#">스피또2000</a></li>

									<li><a
										href="#">스피또1000</a></li>
									<li><a
										href="#">스피또500</a></li>

								</ul>
							</div>

							<div class="group_content group_data_search">
								<div class="group_title">
									<h4 class="title">제 262회차 부터 현재까지의 1등 당첨판매점 입니다.</h4>
									<div class="action">
										<div class="search">
											<form name="frm" id="frm" method="post"
												action="/lotto645Confirm.do">
												<input type="hidden" name="method" value="topStoreRank">
												<input type="hidden" name="nowPage" id="nowPage" value="1">
												<input type="hidden" name="rankNo" id="rankNo" value="1">
												<input type="hidden" name="gameNo" id="gameNo" value="5133">
												<select name="searchType" title="조회옵션 선택">
													<option value="all">전체</option>
													<option value="name">상호</option>
													<option value="addr">지역명</option>
												</select> <input type="text" id="keyWord" name="keyWord" value=""
													title="검색어 입력"> <a class="btn_common form blu"
													href="javascript:selfSubmit('1');">조회</a>
											</form>
										</div>
										<div class="btn">
											<a id="btnExcel" class="btn_common form" href="#">엑셀다운로드</a>
										</div>
									</div>
								</div>
								<table class="tbl_data tbl_data_col">
									<caption>상호명, 배출건수, 소재지, 위치 등 로또6/45 1등 배출점 정보 안내</caption>
									<colgroup>
										<col style="width: 60px">
										<col>
										<col style="width: 90px">
										<col style="width: 410px">
										<col style="width: 90px">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">번호</th>
											<th scope="col">상호명</th>
											<th scope="col">배출건수</th>
											<th scope="col">소재지</th>
											<th scope="col">위치보기</th>
										</tr>
									</thead>
									<tbody>


										<tr>
											<td>1</td>
											<td>부일카서비스</td>
											<td>34</td>
											<td>부산 동구 범일동 830-195번지</td>
											<td><a href="#" class="btn_search"
												onclick="javascript:showMapPage(12600054); return false;"
												title="새창 열림">부일카서비스 지도보기</a></td>
										</tr>

										<tr>
											<td>2</td>
											<td>스파</td>
											<td>33</td>
											<td>서울 노원구 상계동 666-3 주공10단지종합상가111</td>
											<td><a href="#" class="btn_search"
												onclick="javascript:showMapPage(11100773); return false;"
												title="새창 열림">스파 지도보기</a></td>
										</tr>

										<tr>
											<td>3</td>
											<td>일등복권편의점</td>
											<td>20</td>
											<td>대구 달서구 본리동 2-16번지 1층</td>
											<td><a href="#" class="btn_search"
												onclick="javascript:showMapPage(12710129); return false;"
												title="새창 열림">일등복권편의점 지도보기</a></td>
										</tr>

										<tr>
											<td>4</td>
											<td>로또휴게실</td>
											<td>14</td>
											<td>경기 용인시 기흥구 보라동 378-1</td>
											<td><a href="#" class="btn_search"
												onclick="javascript:showMapPage(14110105); return false;"
												title="새창 열림">로또휴게실 지도보기</a></td>
										</tr>

										<tr>
											<td>5</td>
											<td>세진전자통신</td>
											<td>14</td>
											<td>대구 서구 평리동 1094-4번지</td>
											<td><a href="#" class="btn_search"
												onclick="javascript:showMapPage(12700270); return false;"
												title="새창 열림">세진전자통신 지도보기</a></td>
										</tr>

										<tr>
											<td>6</td>
											<td>GS25(양산혜인점)</td>
											<td>11</td>
											<td>경남 양산시 평산동 31-5번지</td>
											<td><a href="#" class="btn_search"
												onclick="javascript:showMapPage(24800023); return false;"
												title="새창 열림">GS25(양산혜인점) 지도보기</a></td>
										</tr>

										<tr>
											<td>7</td>
											<td>로또명당인주점</td>
											<td>11</td>
											<td>충남 아산시 인주면 신성리 188-8</td>
											<td><a href="#" class="btn_search"
												onclick="javascript:showMapPage(14410015); return false;"
												title="새창 열림">로또명당인주점 지도보기</a></td>
										</tr>

										<tr>
											<td>8</td>
											<td>목화휴게소</td>
											<td>11</td>
											<td>경남 사천시 용현면 주문리 4</td>
											<td><a href="#" class="btn_search"
												onclick="javascript:showMapPage(14810122); return false;"
												title="새창 열림">목화휴게소 지도보기</a></td>
										</tr>

										<tr>
											<td>9</td>
											<td>잠실매점</td>
											<td>10</td>
											<td>서울 송파구 신천동 7-18번지 잠실역 8번출구 앞 가판</td>
											<td><a href="#" class="btn_search"
												onclick="javascript:showMapPage(11101248); return false;"
												title="새창 열림">잠실매점 지도보기</a></td>
										</tr>

										<tr>
											<td>10</td>
											<td>제이복권방</td>
											<td>10</td>
											<td>서울 종로구 종로5가 58번지 평창빌딩 1층 103호</td>
											<td><a href="#" class="btn_search"
												onclick="javascript:showMapPage(11190121); return false;"
												title="새창 열림">제이복권방 지도보기</a></td>
										</tr>

										<tr>
											<td>11</td>
											<td>갈렙분식한식</td>
											<td>9</td>
											<td>서울 중랑구 망우동 490-13번지</td>
											<td><a href="#" class="btn_search"
												onclick="javascript:showMapPage(11101524); return false;"
												title="새창 열림">갈렙분식한식 지도보기</a></td>
										</tr>

										<tr>
											<td>12</td>
											<td>버스판매소</td>
											<td>9</td>
											<td>서울 영등포구 영등포동4가 440번지 신세계앞</td>
											<td><a href="#" class="btn_search"
												onclick="javascript:showMapPage(11100959); return false;"
												title="새창 열림">버스판매소 지도보기</a></td>
										</tr>

										<tr>
											<td>13</td>
											<td>행운복권방</td>
											<td>9</td>
											<td>경기 포천시 소흘읍 송우리 128-2</td>
											<td><a href="#" class="btn_search"
												onclick="javascript:showMapPage(14190163); return false;"
												title="새창 열림">행운복권방 지도보기</a></td>
										</tr>

										<tr>
											<td>14</td>
											<td>CU노서점</td>
											<td>8</td>
											<td>경북 경주시 노서동 178-12 1층 CU 노서점 내</td>
											<td><a href="#" class="btn_search"
												onclick="javascript:showMapPage(14700041); return false;"
												title="새창 열림">CU노서점 지도보기</a></td>
										</tr>

										<tr>
											<td>15</td>
											<td>뉴빅마트</td>
											<td>8</td>
											<td>부산 기장군 정관읍 매학리 748-6번지 테라스상가1층119호</td>
											<td><a href="#" class="btn_search"
												onclick="javascript:showMapPage(12600128); return false;"
												title="새창 열림">뉴빅마트 지도보기</a></td>
										</tr>


									</tbody>
								</table>
								<div class="wrap_paginate">
									<p class="closed">
										<img src="${pageContext.request.contextPath}/resources/images/common/ico_closed_store.png" alt="폐점표시">
										폐점된 판매점입니다.
									</p>

									<div class="paginate_common" id="page_box">









										<a href="#" class="current" title="현재 위치"><strong>1</strong></a>







										<a href="javascript:selfSubmit('2')">2</a> <a
											href="javascript:selfSubmit('3')">3</a> <a
											href="javascript:selfSubmit('4')">4</a> <a
											href="javascript:selfSubmit('5')">5</a> <a
											href="javascript:selfSubmit('6')">6</a> <a
											href="javascript:selfSubmit('7')">7</a> <a
											href="javascript:selfSubmit('8')">8</a> <a
											href="javascript:selfSubmit('9')">9</a> <a
											href="javascript:selfSubmit('10')">10</a> <a class="go next"
											href="javascript:selfSubmit('11')">다음 페이지</a> <a
											class="go end" href="javascript:selfSubmit('182')">끝 페이지</a>




									</div>

								</div>
							</div>
							<!-- -------------------------------------------------------------------------------------- -->
						</div>
						<iframe name="ifExcel" id="ifExcel" width="0" height="0"
							title="excel"></iframe>
					</div>
				</div>
			</section>
		</div>
	</div>
	