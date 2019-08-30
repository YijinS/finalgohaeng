<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="body">
	<div class="containerWrap">
		<!-- pc일 경우 컨텐츠 영역 감싸는 마크업 추가  -->
		<!--내용-->
		<section class="contentSection">
			<!--왼쪽-->
			<nav class="lnbNav">
				<!-- left menu include -------------->
				<div id="snb" class="lnb">
					<h2 id="03" class="lnb_title">당첨결과</h2>
					<ul id="lnb" class="lnb_dep1">
						<li id="03-01"><a href="${pageContext.request.contextPath }/gameresult/lotto645/1" class="menuLnb"><span>로또6/45</span></a>
							<ul class="lnb_dep2" style="display: none;">
								<li id="03-01-01"><a href="${pageContext.request.contextPath }/gameresult/lotto645/1"><span> 회차별 당첨번호</span></a></li>
								<li id="03-01-02"><a href="${pageContext.request.contextPath }/gameresult/lotto645/2"><span> 내번호 당첨확인</span></a></li>
								<li id="03-01-03"><a href="${pageContext.request.contextPath }/gameresult/lotto645/3"><span> 당첨내역</span></a></li>
								<li id="03-01-04"><a href="${pageContext.request.contextPath }/gameresult/lotto645/4"><span> 당첨금 지급안내</span></a></li>
								<li id="03-01-05"><a href="${pageContext.request.contextPath }/gameresult/lotto645/5"><span> 추첨방송 다시보기</span></a></li>
								<li id="03-01-06"><a href="${pageContext.request.contextPath }/gameresult/lotto645/6"><span> 추첨방송 참관신청</span></a></li>
							</ul></li>
						<li id="03-02"><a href="${pageContext.request.contextPath }/gameresult/pension520/1" class="menuLnb"><span>연금복권520</span></a>
							<ul class="lnb_dep2" style="display: none;">
								<li id="03-02-01"><a href="${pageContext.request.contextPath }/gameresult/pension520/1"><span> 회차별 당첨번호</span></a></li>
								<li id="03-02-02"><a href="${pageContext.request.contextPath }/gameresult/pension520/2"><span> 내번호 당첨확인</span></a></li>
								<li id="03-02-03"><a href="${pageContext.request.contextPath }/gameresult/pension520/3"><span> 당첨내역</span></a></li>
								<li id="03-02-04"><a href="${pageContext.request.contextPath }/gameresult/pension520/4"><span> 당첨금 지급안내</span></a></li>
								<li id="03-02-05"><a href="${pageContext.request.contextPath }/gameresult/pension520/5"><span> 추첨방송 다시보기</span></a></li>
								<li id="03-02-06"><a href="${pageContext.request.contextPath }/gameresult/pension520/6"><span> 추첨방송 참관신청</span></a></li>
							</ul></li>
						<li id="03-05" class="active"><a href="${pageContext.request.contextPath }/gameresult/lottostat/1" class="menuLnb"><span>로또6/45
									당첨통계</span></a>
							<ul class="lnb_dep2" style="display: block;">
								<li id="03-05-01"><a href="${pageContext.request.contextPath }/gameresult/lottostat/1"><span>
											당첨통계</span></a></li>
								<li id="03-05-02" class="active"><a href="${pageContext.request.contextPath }/gameresult/lottostat/2"><span> 번호별 통계</span></a></li>
								<li id="03-05-03"><a href="${pageContext.request.contextPath }/gameresult/lottostat/3"><span> 색상 통계</span></a></li>
								<li id="03-05-04"><a href="${pageContext.request.contextPath }/gameresult/lottostat/4"><span> 구간별 출현횟수</span></a></li>
							</ul></li>
						<li id="03-06"><a href="${pageContext.request.contextPath }/gameresult/pensionstat/1" class="menuLnb"><span
								style="letter-spacing: -1px;">연금복권520 당첨통계</span></a></li>
						<li id="03-07"><a href="${pageContext.request.contextPath }/gameresult/winningnews/1" class="menuLnb"><span>당첨소식</span></a>
							<ul class="lnb_dep2" style="display: none;">
								<li id="03-07-01"><a href="${pageContext.request.contextPath }/gameresult/winningnews/1"><span> 당첨자 인터뷰</span></a></li>
								<li id="03-07-02"><a href="${pageContext.request.contextPath }/gameresult/winningnews/2"><span> 당첨 소감 게시판</span></a></li>
							</ul></li>
						<li id="03-08"><a href="${pageContext.request.contextPath }/gameresult/unreceived/1" class="menuLnb"><span>미수령
									당첨금</span></a>
							<ul class="lnb_dep2" style="display: none;">
								<li id="03-08-01"><a href="${pageContext.request.contextPath }/gameresult/unreceived/1"><span> 로또6/45</span></a></li>
								<li id="03-08-02"><a href="${pageContext.request.contextPath }/gameresult/unreceived/2"><span> 연금복권520</span></a></li>
							</ul></li>
					</ul>
				</div>
			</nav>

			<!-- -------------------------------------- -->
			<!-- ----------메인컨텐츠---------- 영역 -->
			<div id="article" class="contentsArticle">
				<div class="header_article">
					<h3 class="sub_title">번호별 통계</h3>
					<p class="location">
						<a class="home" href="/"> Home </a><span class="gt">&gt;</span><a
							href="#">당첨결과</a><span class="gt">&gt;</span><a href="#"><span>로또6/45
								당첨통계</span></a><span class="gt">&gt;</span><a href="#"> 번호별 통계</a>
					</p>
				</div>
				<div>
					<div class="content_wrap content_stat645_number">
						<!-- -------------------------------------------------------------------------------------- -->

						<div class="tab_article tab_size2">
							<ul>
								<li class="active"><strong>번호순</strong><span
									class="accessibility">현재 선택됨</span></li>
								<li class=""><a href="#" onclick="$.searchData('dir')">당첨횟수순</a>
								</li>
							</ul>
						</div>
						<form id="frm" name="frm" method="post">
							<input type="hidden" name="sortOrder" value="DESC"> <input
								type="hidden" id="srchType" name="srchType" value="list">
							<table class="tbl_data tbl_form">
								<caption>보너스번호 포함여부, 회차 등 조회 옵션 선택</caption>
								<colgroup>
									<col style="width: 130px">
									<col>
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">보너스번호</th>
										<td><select id="sltBonus" name="bonus"
											title="보너스번호 포함 여부 선택">
												<option value="1" ${save.bonus == 1 ?'selected="selected"':''} >포함</option>
												<option value="0" ${save.bonus == 0 ?'selected="selected"':''} >미포함</option>
										</select></td>
									</tr>
									<tr>
										<th scope="row">회차선택</th>
										<td>
											<select id="sttDrwNo" name="start" title="조회 시작회차 선택">
												<c:forEach var="game" items="${games }" varStatus="vs">
													<c:choose>
														<c:when test="${save.start ne 0 and save.start eq game}">
															<option value="${game }" selected="selected">${game }</option>
														</c:when>
														<c:when test="${save.start eq 0 and vs.last }">
															<option value="${game }" selected="selected">${game }</option>
														</c:when>
														<c:otherwise>
															<option value="${game }" >${game }</option>
														</c:otherwise>
													</c:choose>
												</c:forEach>
											</select>
											<span class="unit">~</span>
											
											<select id="edDrwNo" name="end" title="조회 종료회차 선택">
												<c:forEach var="game" items="${games }" varStatus="vs">
													<c:choose>
														<c:when test="${save.end ne 0 and save.end eq game}">
															<option value="${game }" selected="selected">${game }</option>
														</c:when>
														<c:when test="${save.end eq 0 and vs.first }">
															<option value="${game }" selected="selected">${game }</option>
														</c:when>
														<c:otherwise>
															<option value="${game }" >${game }</option>
														</c:otherwise>
													</c:choose>
												</c:forEach>
											</select>
										</td>
									</tr>
								</tbody>
							</table>
						</form>
						<div class="btns_submit search">
							<a id="search_btn" class="btn_common mid blu" href="#">조회</a>
						</div>
						<script>
							$(function(){
								var form = $("#frm");
								var btn = $("#search_btn");
								
								btn.click(function(){
									form.submit();
								});
							});
						</script>
						
						<table class="tbl_data tbl_data_col" id="printTarget">
							<caption>나눔로또 복권을 번호별 통계로 확인해 보실 수 있습니다.</caption>
							<colgroup>
								<col style="width: 105px">
								<col>
								<col style="width: 130px">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">번호</th>
									<th scope="col">그래프</th>
									<th scope="col">당첨횟수</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="qty" items="${list.nums }" varStatus="vs">
									<tr>
										<c:choose>
											<c:when test="${vs.count lt 11 }">
												<c:set var="percent" value="${qty/list.max * 100 }" />
												<td>
													<span class="ball_645 sml ball1">${vs.count }</span>
												</td>
												<td class="graph">
												<div class="graph_bar no_note">
													<span class="bar color1" style="width: ${percent }%">${percent }%</span>
												</div>
												</td>
											</c:when>
											
											<c:when test="${vs.count lt 21 }">
												<c:set var="percent" value="${qty/list.max * 100 }" />
												<td>
													<span class="ball_645 sml ball2">${vs.count }</span>
												</td>
												<td class="graph">
												<div class="graph_bar no_note">
													<span class="bar color2" style="width: ${percent }%">${percent }%</span>
												</div>
												</td>
											</c:when>
											
											<c:when test="${vs.count lt 31 }">
												<c:set var="percent" value="${qty/list.max * 100 }" />
												<td>
													<span class="ball_645 sml ball3">${vs.count }</span>
												</td>
												<td class="graph">
												<div class="graph_bar no_note">
													<span class="bar color3" style="width: ${percent }%">${percent }%</span>
												</div>
												</td>
											</c:when>
											
											<c:when test="${vs.count lt 41 }">
												<c:set var="percent" value="${qty/list.max * 100 }" />
												<td>
													<span class="ball_645 sml ball4">${vs.count }</span>
												</td>
												<td class="graph">
												<div class="graph_bar no_note">
													<span class="bar color4" style="width: ${percent }%">${percent }%</span>
												</div>
												</td>
											</c:when>
											
											<c:otherwise>
												<c:set var="percent" value="${qty/list.max * 100 }" />
												<td>
													<span class="ball_645 sml ball5">${vs.count }</span>
												</td>
												<td class="graph">
												<div class="graph_bar no_note">
													<span class="bar color5" style="width: ${percent }%">${percent }%</span>
												</div>
												</td>
												
											</c:otherwise>
										</c:choose>
										<td>${qty }</td>
									</tr>
									
								</c:forEach>
							</tbody>
						</table>
						<div class="btns_function bottom">
							<div class="left">
								<p class="">
									<span class="color_key1">*</span> 로또6/45의 당첨번호는 (주)동행복권 공식홈페이지,
									ARS전화 등을 통해 확인하실 수 있습니다.
								</p>
							</div>
							<div class="right">
								<a class="btn_common sml" id="printBtn" href="#" title="새창 열림">인쇄하기</a>
							</div>
						</div>

						<!-- 		                 인쇄팝업에사 사용 -->
						<input type="hidden" id="popupYn" name="popupYn" value="list">
						<input type="hidden" id="srchTypePop" name="srchTypePop"
							value="list"> <input type="hidden" id="sltBonusPop"
							name="sltBonusPop" value="1"> <input type="hidden"
							id="sttDrwNoPop" name="sttDrwNoPop" value="1"> <input
							type="hidden" id="edDrwNoPop" name="edDrwNoPop" value="868">
						<input type="hidden" id="maxDrwtNo" name="maxDrwtNo" value="160">

						<!-- -------------------------------------------------------------------------------------- -->
					</div>
				</div>
			</div>
		</section>
	</div>
</div>