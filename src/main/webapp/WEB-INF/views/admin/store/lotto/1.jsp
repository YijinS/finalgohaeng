<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<section class="contentSection">

	<div class="article" class="contentsArticle">
		<div>
			<div class="content_wrap content_seller_info content_seller_645">


				<div class="wrap_option wrap_option1">

						
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
											</select> <input type="text" name="srchVal" id="srchVal"
												maxlength="20" value="" onkeydown="" onchange="clearSlt()"
												title="상호/지역(읍/면/동) 입력"> <a
												class="btn_common form blu" href="#none" id="searchBtn2">조회</a>
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
											<a href="#">서울</a>
											<a href="#">경기</a>
											<a href="#">부산</a>
											<a href="#">대구</a>
											<a href="#">인천</a>
											<a href="#">대전</a>
											<a href="#">울산</a>
											<a href="#">강원</a>
											<a href="#">충북</a>
											<a href="#">충남</a>
											<a href="#">광주</a>
											<a href="#">전북</a>
											<a href="#">전남</a>
											<a href="#">경북</a>
											<a href="#">경남</a>
											<a href="#">제주</a>
											<a href="#">세종</a>
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
								
									//시도에 맞는 구를 출력
									sido.on("click", function() {
										var sido2 = $(this).text();
										
										$.getJSON("${pageContext.request.contextPath}/ajax_addr_gu?sido="+ sido2, function(data) {
													jQuery.each(data, function(index, q) {
														var a = "<a href='#' id='select_gu' onclick='clickGu(this);' >"+q.gu+"</a>";
														subMenu.append(a);
													});
												});
										subMenu.html("");
										
									}); //sido.on end
									
								   
								});
							
							</script>
									</div>
								</div>
							</div>

							<div class="group_content group_data_search">
							
								<form action="" id="radio"> <!--  라디오 박스 -->
									<input type="hidden" id="radio_select" name="radio_select" value="${radio_select}" /> 
									<input type="radio" name="open&close" value="all" ${radio_select eq 'all' ? "checked" : " "} /> 전체 
									<input type="radio" name="open&close" value="open" ${radio_select eq 'open' ? "checked" : " "} /> 안폐점 
									<input type="radio" name="open&close" value="close" ${radio_select eq 'close' ? "checked" : " "} /> 폐점
								</form>
								
							 <script>
							$(document).ready(  /* 폐점 유무 그냥 클릭했을때  */
										function() {
											$("input[name='open&close']:radio").change(
												function() {
													var tbody = $("#tbody");
													var radio_select = $(this).val();
													var sido = $("#mainMenuArea a");
													console.log(radio_select);
													/* $('#radio_select').val(radio_select);
													$('#radio').attr('action','1.do');  //.attr( attributeName, value )
													$('#radio').submit(); */
													
													//시도에 맞는 구를 출력
													sido.on("click", function() {
														var sido2 = $(this).text();
														var append = '';
														$.getJSON("${pageContext.request.contextPath}/ajax_addr?sido="+sido2, function(data) {
																	jQuery.each(data, function(index, q) {
																		if(radio_select.equals("open") && q.storeEnable ==0){
																			append += '<tr>';
																			append += '<td>없어 </td>';
																			append += '</tr>';
																			tbody.append(append);
																		}
																		
																	});
																});
														tbody.html("");
														
													}); //sido.on end
															});
												}); 
							        
												
								</script> 
								
								<div class="group_title">
									<h4 class="title">
										검색결과 : <span class="color_key3" id="searchResult">서울 강남구</span>
									</h4>
									<div class="action">
										<div class="search">
											<form id="frmSrch4" name="frmSrch4" action="exeldown" method="post">
												<input type="hidden" name="searchType" value="4"> 
												<input type="hidden" id="nowPage4" name="nowPage"> 
												<select id="rtlrSttus" name="rtlrSttus" title="조회옵션 선택">
													<option value="">전체</option>
													<option value="001">판매점</option>
													<option value="002">폐점</option>
												</select> <a id="searchBtn3" class="btn_common form blu" href="#">조회</a>
											</form>
										</div>
										<div class="btn">
											<a id="exelBtn" class="btn_common form" href="#">엑셀다운로드</a>
										</div>
										<script>
											$(function(){
												var exelBtn = $("#exelBtn");
												var exelForm = $("#frmSrch4");
												
												exelBtn.click(function(){
													exelForm.submit();
												});
											});
										</script>
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
								<tbody>
									<c:forEach var="list" items="${list}">
									<tr>
									<c:choose>
									  <c:when test="${list.storeEnable == 0}">
												<!-- 0이면 폐점 -->
										<td class="ta_left">${list.storeName}
										   <img src="${pageContext.request.contextPath}/resources/images/common/ico_closed_store.png" alt="폐점" />
										</td>
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
										<td class="ta_left">
										<img src='${pageContext.request.contextPath}/resources/images/store/ico_seller_645.png' alt='lotto645'></td>
									</c:when>

									<c:when test="${list.storeAbleGames == 2}">
										<!-- 2이면 pension -->
										<td class="ta_left">
										<img src="${pageContext.request.contextPath}/resources/images/store/ico_seller_520.png" alt="연금복권520"></td>
									</c:when>

									<c:when test="${list.storeAbleGames == 3}">
										<!-- 3이면 all -->
										<td class="ta_left">
										<img src="${pageContext.request.contextPath}/resources/images/store/ico_seller_645.png" alt="lotto645"> 
										<img src="${pageContext.request.contextPath}/resources/images/store/ico_seller_520.png" alt="연금복권520"></td>
									</c:when>

									<c:otherwise>
										<td class="ta_left"></td>
									</c:otherwise>

								</c:choose>
									
									</tr>
									</c:forEach>
								</tbody>
							</table>
							<p class="note_result_search bottom">
								<img
									src="${pageContext.request.contextPath}/resources/images/common/ico_closed_store.png"
									alt="폐점"> 폐점된 판매점입니다.
							</p>
							<div class="paginate_common" id="pagingView">
								
							</div>


						</div>
					</div>

					<!-- 페이징 종료 -->
				</div>
	
	<!-- 메인컨텐츠 끝 -->
	<!-- -------------------------------------- -->
</section>
