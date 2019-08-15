<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<section class="contentSection">

	<div class="article" class="contentsArticle">
		<div>
			<div class="content_wrap content_seller_info content_seller_645">


				<div class="wrap_option wrap_option1">
					<div class="box_option box_option1">
						<h4>
							<strong>지역</strong>으로 검색
						</h4>
						<div class="forms">
							<form id="frmSrch1" name="frmSrch1" method="post">
								<input type="hidden" name="searchType" value="1"> <input
									type="hidden" id="nowPage1" name="nowPage" value="1"> <select
									id="sltSIDO" name="sltSIDO" title="시/도 선택">
									<option value="">시/도 선택</option>
									<option value="경기">경기</option>
									<option value="인천">인천</option>
									<option value="강원">강원</option>
									<option value="충북">충북</option>
									<option value="충남">충남</option>
									<option value="경북">경북</option>
									<option value="경남">경남</option>
									<option value="울산">울산</option>
									<option value="전북">전북</option>
									<option value="전남">전남</option>
									<option value="제주">제주</option>
									<option value="서울">서울</option>
									<option value="대전">대전</option>
									<option value="대구">대구</option>
									<option value="부산">부산</option>
									<option value="광주">광주</option>
									<option value="세종">세종</option>
								</select> <select name="sltGUGUN" id="sltGUGUN" title="구/군 선택">
									<option value="">구/군를 선택해 주세요.</option>
									<option value="강남구">강남구</option>
									<option value="강동구">강동구</option>
									<option value="강북구">강북구</option>
									<option value="강서구">강서구</option>
									<option value="관악구">관악구</option>
									<option value="광진구">광진구</option>
									<option value="구로구">구로구</option>
									<option value="금천구">금천구</option>
									<option value="노원구">노원구</option>
									<option value="도봉구">도봉구</option>
									<option value="동대문구">동대문구</option>
									<option value="동작구">동작구</option>
									<option value="마포구">마포구</option>
									<option value="서대문구">서대문구</option>
									<option value="서초구">서초구</option>
									<option value="성동구">성동구</option>
									<option value="성북구">성북구</option>
									<option value="송파구">송파구</option>
									<option value="양천구">양천구</option>
									<option value="영등포구">영등포구</option>
									<option value="용산구">용산구</option>
									<option value="은평구">은평구</option>
									<option value="종로구">종로구</option>
									<option value="중구">중구</option>
									<option value="중랑구">중랑구</option>
								</select> <a class="btn_common form blu" href="#none" id="searchBtn1">조회</a>
							</form>
						</div>
					</div>
					<div class="box_option box_option2">
						<h4>
							<strong>상호/지역(읍/면/동)</strong>으로 검색
						</h4>
						<div class="forms">
							<form id="frmSrch2" name="frmSrch2" method="post"
								onsubmit="false">
								<input type="hidden" name="searchType" value="2"> <input
									type="hidden" id="nowPage2" name="nowPage"> <select
									id="kind" name="kind" title="상호/지역(읍/면/동) 선택">
									<option value="0">상호</option>
									<option value="1">지역(읍/면/동)</option>
								</select> <input type="text" name="srchVal" id="srchVal" maxlength="20"
									value="" onkeydown="" onchange="clearSlt()"
									title="상호/지역(읍/면/동) 입력"> <a class="btn_common form blu"
									href="#none" id="searchBtn2">조회</a>
							</form>
						</div>
					</div>
				</div>
				<form id="frmSrch3" name="frmSrch3" method="post">
					<input type="hidden" name="searchType" value="3"> <input
						type="hidden" id="nowPage3" name="nowPage"> <input
						type="hidden" id="sltSIDO2" name="sltSIDO2" value=""> <input
						type="hidden" id="sltGUGUN2" name="sltGUGUN2" value="">
				</form>
				<div class="wrap_option wrap_option2">
					<div class="box_option box_option1">
						<div class="head">
							<h4>
								<strong>행정구역</strong>으로 검색
							</h4>
							<h5>지역 선택</h5>
						</div>
						<div id="mainMenuArea" class="area">
							<!-- <span title="현재 선택된 행정구역" tabindex="0" id="sidoIdx_0">서울</<span> -->
							<c:forEach var="a" items="${addr}">
								<a href="#">${fn:substring(a.sido,0,2)}</a>

							</c:forEach>
						</div>
					</div>
					<div class="box_option box_option2">
						<div class="head">
							<h5>구선택</h5>
						</div>
						<div id="subMenu" class="area">
							<script>
								$(function() {
									var subMenu = $("#subMenu");
									var sido = $("#mainMenuArea a");

									sido.on("click", function() {
										//alert($(this).text());
										var sido2 = $(this).text();

										$.getJSON(
												"${pageContext.request.contextPath}/ajax_addr_gu?sido="
														+ sido2,
												function(data) {
													jQuery.each(data, function(
															index, q) {
														var a = "<a>" + q.gu
																+ "</a>";
														subMenu.append(a);
													});
												});

										subMenu.html("");

										<%--$.getJSON("${pageContext.request.contextPath}/ajax_addr_gu?sido=" + sido2, function (data) {
											jQuery.each(data, function (index, q) {
												var a = "<a>" + q.gu + "</a>";
												subMenu.append(a);
											});
										}); --%>

									});
								});
							</script>
						</div>
					</div>
				</div>

				<div class="group_content group_data_search">

					<form action="" id="radio">
						<input type="hidden" id="radio_select" name="radio_select"
							value="${radio_select}" /> <input type="radio" name="open&close"
							value="all" ${radio_select eq 'all' ? "checked" : " "} /> 전체 <input
							type="radio" name="open&close" value="open"
							${radio_select eq 'open' ? "checked" : " "} /> 안폐점 <input
							type="radio" name="open&close" value="close"
							${radio_select eq 'close' ? "checked" : " "} /> 폐점
					</form>

					<script>
						$(document).ready(
								function() {
									$("input[name='open&close']:radio").change(
											function() {
												var radio_select = $(this).val();
												console.log(radio_select);
												$('#radio_select').val(radio_select);
												$('#radio').attr('action','1.do');
												$('#radio').submit();
											});
								});
					</script>
					
					<!-- selectBox 데이터 값 가져오는 애 -->
					<input type="hidden" id="storeEnable" value="${storeEnable}" /> 
					<input type="hidden" id="storeAbleGames" value="${storeAbleGames}" /> 
					<input type="hidden" id="storeIndex" value="${storeIndex}" /> 
					<input type="hidden" id="storeName" value="${storeName}" /> 
					<input type="hidden" id="storeAddr" value="${storeAddr}" /> 
					<input type="hidden" id="storeTel" value="${storeTel}" />


					<script>
						$(function() {
							var tbody = $("#tbody");
							var searchBtn3 = $("#searchBtn3");
							var rtlrSttus = $("#rtlrSttus");
							
							
							searchBtn3.on("click", function() {
							 var storeAbleGames = rtlrSttus.val();
							 var close = "<img src='${pageContext.request.contextPath}/resources/images/common/ico_closed_store.png' alt='폐점' />";
							 var lotto645 = "<img src='${pageContext.request.contextPath}/resources/images/store/ico_seller_645.png' alt='lotto645'>";
							 var pension520 = "<img src='${pageContext.request.contextPath}/resources/images/store/ico_seller_520.png' alt='연금복권520'>"
							 //0이면 폐점 1이면 안폐점
							 var storeEnable = $("#storeEnable"); 
							 //위치보는 돋보기 태그
										 
							
							$.getJSON("${pageContext.request.contextPath}/store/ajax_select?storeAbleGames=" + storeAbleGames, function(data) {
								
											
								jQuery.each(data, function(index, q) {
									
										<%-- var location_map = "<a class='btn_search' id='location_map onclick='window.open('1detail?storeIndex="+q.storeIndex+
											 "','a','resizable=no width=700 height=800');return false' href='1detail?storeIndex="+q.storeIndex+"title='새창'>위치보기</a>" --%>
									     tbody.html("");
										var row = '';	
													
										row += '<tr>';
										 
										
											 if(q.storeEnable == 0)
											 {
												 row += '<td>'+q.storeName + close+'</td>';
												 row += '<td>'+q.storeTel+'</td>';	
												 row += '<td>'+q.storeAddr+'</td>';	
												 row += '<td>'+'<a class="btn_search" id="location_map"'+
													'onclick="window.open("1detail?storeIndex='+q.storeIndex+'"'+
															',"a","resizable=no width=700 height=800");return false"'+
														'href="1detail?storeIndex='+q.storeIndex+'" title="새창">위치보기</a>'+'<td>'
												<%-- row += '<td>'+q.location_map+'</td>';	--%>	
											 }
											 else if(q.storeEnable == 1){
												 row += '<td>'+q.storeName+'</td>';
												 row += '<td>'+q.storeTel+'</td>';
												 row += '<td class="ta_left">'+q.storeAddr+'</td>';
												 row += '<td>'+'<a class="btn_search" id="location_map"'+
													'onclick="window.open("1detail?storeIndex='+q.storeIndex+'"'+
															',"a","resizable=no width=700 height=800");return false"'+
														'href="1detail?storeIndex='+q.storeIndex+'" title="새창">위치보기</a>'+'<td>'
												 	
											 }
											 else{
												 row += '<td>'+q.storeName+'</td>';
												 row += '<td>'+q.storeTel+'</td>';
												 row += '<td class="ta_left">'+q.storeAddr+'</td>';
												 row += '<td>'+'<a class="btn_search" id="location_map"'+
													'onclick="window.open("1detail?storeIndex='+q.storeIndex+'"'+
															',"a","resizable=no width=700 height=800");return false"'+
														'href="1detail?storeIndex='+q.storeIndex+'" title="새창">위치보기</a>'+'<td>'
											 }
											 
											 
											 if(q.storeAbleGames == 1){
												 row += '<td class="ta_left">' + lotto645 + '</td>';
											 }
											 else if(q.storeAbleGames == 2){
												 row += '<td class="ta_left">' + pension520 + '</td>';
											 }
											 else if(q.storeAbleGames == 3){
												 row += '<td class="ta_left">' + lotto645 + pension520 + '</td>';
											
											 }
											 else{
												 row += '<td class="ta_left"></td>';
											 }
										 
											 row += '</tr>'; 
											 
											 tbody.append(row);
									}); 
									
								}); 
							});
						});
					</script>

					<div class="group_title">
						<h4 class="title">
							검색결과 : <span class="color_key3" id="searchResult">서울 강남구</span>
						</h4>
						<div class="action">
							<div class="search">


								<form id="frmSrch4" name="frmSrch4" method="get" action="1.do">
									<select name="lotto_pension"
										onChange="change(this.options[this.selectedIndex].value)"
										id="rtlrSttus" name="rtlrSttus" title="조회옵션 선택">
										<option value="3">전체</option>
										<option value="1">로또 6/45</option>
										<option value="2">연금 520</option>
									</select> <a id="searchBtn3" class="btn_common form blu" href="#">조회</a>
								</form>


							</div>
							<div class="btn">
								<a id="exceldw" class="btn_common form" href="#">엑셀다운로드</a>
							</div>
						</div>
					</div>
				</div>
				<table class="tbl_data tbl_data_col" id="resultTable">
					<caption>상호명, 전화번호, 소재지, 위치 등 로또6/45 판매점 조회 결과</caption>
					<colgroup>
						<col style="width: 210px;">
						<col style="width: 120px;">
						<col>
						<col style="width: 80px;">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">상호명</th>
							<th scope="col">전화번호</th>
							<th scope="col">소재지</th>
							<th scope="col">위치보기</th>
							<th scope="col">취급복권</th>
						</tr>
					</thead>
					<tbody id="tbody">
						<c:forEach var="list" items="${list}">
							<tr>
								<c:choose>
									<c:when test="${list.storeEnable == 0}">
										<!-- 0이면 폐점 -->
										<td class="ta_left">${list.storeName}<img
											src="${pageContext.request.contextPath}/resources/images/common/ico_closed_store.png"
											alt="폐점" /></td>
									</c:when>
									<c:otherwise>
										<td class="ta_left">${list.storeName}</td>
									</c:otherwise>
								</c:choose>

								<td>${list.storeTel}</td>
								<td class="ta_left">${list.storeAddr}</td>
								<td><a class="btn_search" id="location_map"
									onclick="window.open('1detail?storeIndex=${list.storeIndex}','a','resizable=no width=700 height=800');return false"
									href="1detail?storeIndex=${list.storeIndex}" title="새창">위치보기</a></td>


								<c:choose>
									<c:when test="${list.storeAbleGames == 1}">
										<!-- 1이면 lotto -->
										<td class="ta_left"><img
											src="${pageContext.request.contextPath}/resources/images/store/ico_seller_645.png"
											alt="lotto645"></td>
									</c:when>

									<c:when test="${list.storeAbleGames == 2}">
										<!-- 2이면 pension -->
										<td class="ta_left"><img
											src="${pageContext.request.contextPath}/resources/images/store/ico_seller_520.png"
											alt="연금복권520"></td>
									</c:when>

									<c:when test="${list.storeAbleGames == 3}">
										<!-- 3이면 all -->
										<td class="ta_left"><img
											src="${pageContext.request.contextPath}/resources/images/store/ico-seller_645.png"
											alt="lotto645"> <img
											src="${pageContext.request.contextPath}/resources/images/store/ico-seller_520.png"
											alt="연금복권520"></td>
									</c:when>

									<c:otherwise>
										<td class="ta_left"></td>
									</c:otherwise>

								</c:choose>

								<!-- 로또, 연금 판매 알림 -->
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="btn_common form write">
					<a
						onclick="window.open('1insertform','a', 'resizable=no width=700 height=800');return false"
						title="새창">글쓰기</a>

				</div>
				<p class="note_result_search bottom">
					<img
						src="${pageContext.request.contextPath}/resources/images/common/ico_closed_store.png"
						alt="폐점"> 폐점된 판매점입니다.
				</p>


				<!-- 페이징 시작 -->

				<div class="page-display">
					<div class="paginate_common" id="page_box">
						<ul class="pagination">
							<c:choose>
								<c:when test="${startPageNum ne 1 }">
									<li><a
										href="1.do?pageNum=${startPageNum-1 }&searchType=${searchType }&searchRadioOptions=${searchRadioOptions}">
											&laquo; </a></li>
								</c:when>
								<c:otherwise>
									<li class="disabled"><a href="javascript:">&laquo;</a></li>
								</c:otherwise>
							</c:choose>
							<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }"
								step="1">
								<c:choose>
									<c:when test="${i eq pageNum }">
										<li class="active"><a
											href="1.do?pageNum=${i }&radio_select=${radio_select }&open_close=${open_close}">${i }</a></li>
									</c:when>
									<c:otherwise>
										<li><a
											href="1.do?pageNum=${i }&radio_select=${radio_select }&open_close=${open_close}">${i }</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>

							<c:choose>
								<c:when test="${endPageNum lt totalPageCount }">
									<li><a
										href="1.do?pageNum=${endPageNum+1 }&radio_select=${radio_select }&open_close=${open_close}">
											&raquo; </a></li>
								</c:when>
								<c:otherwise>
									<li class="disabled"><a href="javascript:">&raquo;</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
				</div>

				<!-- 페이징 종료 -->

			</div>
		</div>
		<div id="test"></div>
		<!-- private int STORE_INDEX;
	private int STORE_ABLE_GAMES;
	private int STORE_ENABLE;
	private String STORE_NAME;
	private String STORE_TEL;
	private String STORE_ADDR; -->
		<script>
			$(function() {
				var tbody = $("#resultTable tbody");
				$
						.getJSON(
								"${pageContext.request.contextPath}/store/ajax",
								function(data) {
									var a = "<tr><td class='ta_left'>"
											+ data.storeName
											+ "</td><td>"
											+ data.storeTel
											+ "</td><td class='ta_left'>"
											+ data.storeAddr
											+ "</td><td><a class='btn_search' href='#' title='새창'>위치보기</a></td></tr>"

									tbody.append(a);
								});

			});
		</script>
	</div>
	<!-- 메인컨텐츠 끝 -->
	<!-- -------------------------------------- -->
</section>