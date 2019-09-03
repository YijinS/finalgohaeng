<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
.content_seller_info .wrap_option2 .box_option {
    float: left;
    width: 45.5%;
    height: 220px;
    padding-bottom: 0;
    margin: 0 -1px 0 0;
}

.content_seller_info .wrap_option1 .box_option .forms select + input[type="text"], 
.content_seller_info .wrap_option1 .box_option .forms select + .btn_common, 
.content_seller_info .wrap_option1 .box_option .forms select + select {
    margin-left: 5px;
    height: 34px;
}

.content_seller_info .wrap_option2 .box_option {
    float: left;
    width: 48.5%;
    height: 220px;
    padding-bottom: 0;
    margin: 0 -1px 0 0;
}

.content_seller_info .wrap_option1 .box_option .forms input[type="text"] + .btn_common {
    margin-left: -1px;
    margin-top: 10px;
}

.content_seller_info .note_result_search.bottom {
    height: 3px;
    margin-top: 5px;
}

</style>


	<div class="body">
		<div class="containerWrap">
			<section class="contentSection">
				<!-- ----------왼쪽메뉴---------- 영역 -->
				<nav class="lnbNav">
					<!-- left menu include -------------->
					<div id="snb" class="lnb">
						<h2 id="04" class="lnb_title">판매점</h2>
						<ul id="lnb" class="lnb_dep1">
							<li id="04-01" class="active"><a
								href="#" class="menuLnb"><span>구입처
										안내</span></a>
								<ul class="lnb_dep2" style="display: block;">
									<li id="04-01-01" class="active"><a
										href="#"><span>
												로또6/45, 연금520 판매점 조회</span></a></li>
								</ul></li>
							<li id="04-02"><a
								href="#"
								class="menuLnb"><span>당첨 판매점</span></a>
								<ul class="lnb_dep2" style="display: none;">
									<li id="04-02-01"><a
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
						<h3 class="sub_title">로또6/45, 연금520 판매점 조회</h3>
						<p class="location">
							<a class="home" href="/"> Home </a><span class="gt">&gt;</span><a
								href="#">판매점</a><span class="gt">&gt;</span><a
								href="#"><span>구입처 안내</span></a><span
								class="gt">&gt;</span><a href="#">
								로또6/45판매점 조회</a>
						</p>
					</div>
					<div>
	
			<div class="content_wrap content_seller_info content_seller_645">


				<div class="wrap_option wrap_option1">
					
					<div class="box_option box_option1">
						<h4>
							<strong>상호</strong>로 검색
						</h4>
						<div class="forms">
						<!-- 상호 검색  -->
							<form id="frmSrch2" name="frmSrch2" method="get" action="1.do">
								<input type="hidden" name="searchType" value="2"> 
								<input type="hidden" id="nowPage2" name="nowPage" placeholder="상호명을 입력해주세요."> 
								<select id="kind" name="kind" title="상호 선택">
									<option value="0">상호</option>
								</select> 
								<input type="text" name="srchVal" id="srchVal" maxlength="20" autocomplete=off title="상호 입력">
							    <a class="btn_common form blu" href="#" id="searchBtn2" onclick="sanho(this)" >조회</a>
							</form>
						</div>

						<script>
						function sanho(e){
							 var tbody = $("#tbody");
							 var title = $(".color_key3");
							 
							 var rtlrSttus = $("#rtlrSttus");
							 var storeAbleGames = rtlrSttus.val(); // select box의 option - value 숫자가 들어온다. 로또1 연금2
							 var close = "<img src='${pageContext.request.contextPath}/resources/images/common/ico_closed_store.png' alt='폐점' />";
							 var lotto645_two = "<img src='${pageContext.request.contextPath}/resources/images/store/ico_seller_645.png' alt='lotto645'>";
							 var pension520_two = "<img src='${pageContext.request.contextPath}/resources/images/store/ico_seller_520.png' alt='연금복권520'>";
						     var storeEnable = $("#storeEnable"); //0이면 폐점 1이면 안폐점
						     var srchVal = $("#srchVal").val();
							var list = '';
							console.log("sanho(e)" + srchVal);

								tbody.html("");
								title.html("");
								
								$.ajax(
								{
								  url : "${pageContext.request.contextPath}" + "/user/store/ajax/selectStoreName?storeName="+srchVal,
								  dataType: 'html',
								  data: {storeName:list},	  
								  success: function(data){			 
									  $("#guResultDiv").html(data);
									  
								  },
								  error : function(e){
									  console.log("상호 데이터 가져오기 에러");
								  }
								}	
								);	    
						}
						
							
						function clickSanhoPage(storeName, pageNum, openClose){ <%-- 상호명 페이지번호 눌렀을떄 --%>
							
							var pageNum = pageNum;
							var open_close = openClose;
							
							var list = '';	

							var tbody = $("#tbody");
							var kind = $("#kind"); <%-- option값--%>
							var srchVal = $("#srchVal").val();
							var rtlrSttus = $("#rtlrSttus");
						
							$.ajax(
							{
							  url : "${pageContext.request.contextPath}" + "/user/store/ajax/selectStoreName?storeName="+srchVal,
							  dataType: 'html',
							  data: {storeName:list, pageNum:pageNum, open_close:open_close},	  
							  success: function(data){			 
								  $("#guResultDiv").html(data);
								  
							  },
							  error : function(e){
								  console.log("상호 데이터 가져오기 에러");
							  }
							}	
						    );
								 	
							
						}
						</script>
					</div>
				</div>
				
				<form id="frmSrch3" name="frmSrch3" method="post">
					<input type="hidden" name="searchType" value="3"> 
					<input type="hidden" id="nowPage3" name="nowPage"> 
					<input type="hidden" id="sltSIDO2" name="sltSIDO2" value=""> 
					<input type="hidden" id="sltGUGUN2" name="sltGUGUN2" value="">
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
								
									//시도에 맞는 구를 출력
									sido.on("click", function() {
										var sido2 = $(this).text();
										
										$.getJSON("${pageContext.request.contextPath}/user/store/ajax_addr_gu?sido="+ sido2, function(data) {
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
					</div>  <!-- subMenu 끝 -->
				</div>

				<div class="group_content group_data_search">

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
							var searchResult = $(".searchResult");
						
							searchBtn3.on("click",function() { //조회 버튼을 클릭했을 때 
												var storeAbleGames = rtlrSttus.val(); // select box의 option - value 숫자가 들어온다. 로또1 연금2
												var close = "<img src='${pageContext.request.contextPath}/resources/images/common/ico_closed_store.png' alt='폐점' />";
												var lotto645 = "<img src='${pageContext.request.contextPath}/resources/images/store/ico_seller_645.png' alt='lotto645'>";
												var pension520 = "<img src='${pageContext.request.contextPath}/resources/images/store/ico_seller_520.png' alt='연금복권520'>"

												var storeEnable = $("#storeEnable"); //0이면 폐점 1이면 안폐점

												tbody.html("");
												searchResult.html("");
												$.getJSON("${pageContext.request.contextPath}/user/store/ajax_select?storeAbleGames="+ storeAbleGames,function(data) {
													jQuery.each(data, function(index, q) {
																						// each(): 매개 변수로 받은 것을 사용해 for in 반복문과 같이 배열이나 객체의 요소를 검사할 수 있는 메서드
																						//index는 배열의 인덱스 또는 객체의 키
																						// q는 해당 인덱스나 키가 가진 값

																						var row = '';
																						var open = '"1detail?storeIndex='+ q.storeIndex + '","a","resizable=no width=700 height=800"';

																						row += '<tr>';
																						if (q.storeEnable == 0) {
																							row += '<td>'
																									+ q.storeName
																									+ close
																									+ '</td>';
																							row += '<td>'
																									+ q.storeTel
																									+ '</td>';
																							row += '<td>'
																									+ q.storeAddr
																									+ '</td>';
																							row += '<td>';
																							row += "<a class='btn_search' id='location_map' onclick='window.open("
																									+ open
																									+ "); return false'	href='1detail?storeIndex="
																									+ q.storeIndex
																									+ "'	title='새창'>위치보기</a>";
																							row += '</td>';

																						} else if (q.storeEnable == 1) {
																							row += '<td>'
																									+ q.storeName
																									+ '</td>';
																							row += '<td>'
																									+ q.storeTel
																									+ '</td>';
																							row += '<td class="ta_left">'
																									+ q.storeAddr
																									+ '</td>';
																							row += '<td>';
																							row += "<a class='btn_search' id='location_map' onclick='window.open("
																									+ open
																									+ "); return false'	href='1detail?storeIndex="
																									+ q.storeIndex
																									+ "'	title='새창'>위치보기</a>";
																							row += '</td>';

																						} else {
																							row += '<td>'
																									+ q.storeName
																									+ '</td>';
																							row += '<td>'
																									+ q.storeTel
																									+ '</td>';
																							row += '<td class="ta_left">'
																									+ q.storeAddr
																									+ '</td>';
																							row += '<td>';
																							row += "<a class='btn_search' id='location_map' onclick='window.open("
																									+ open
																									+ "); return false'	href='1detail?storeIndex="
																									+ q.storeIndex
																									+ "'	title='새창'>위치보기</a>";
																							row += '</td>';
																						}

																						if (q.storeAbleGames == 1) {
																							row += '<td class="ta_left">'+ lotto645 + '</td>';
																						} else if (q.storeAbleGames == 2) {
																							row += '<td class="ta_left">'+ pension520 + '</td>';
																						} else if (q.storeAbleGames == 3) {
																							row += '<td class="ta_left">' + lotto645 + pension520 + '</td>';

																						} else {
																							row += '<td class="ta_left"></td>';
																						}

																						var aa = '<span class="color_key3" id="searchResult">'+q.storeAbleGames+'</span>';
																						row += '</tr>';
																						tbody.append(row);
																						
																					});
																});
											});
						});
					</script>

					<div class="group_title">
					<%-- 	
						<h4 class="searchResult">
							검색결과 : <span class="color_key3" id="searchResult">${storeAddr}</span> 
						</h4> --%>
						<p class="note_result_search bottom">
							<img
								src="${pageContext.request.contextPath}/resources/images/common/ico_closed_store.png"
								alt="폐점"> 폐점된 판매점입니다.
						</p>
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
				<div id="guResultDiv">
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

								<!-- 로또, 연금 판매 알림 -->
							</tr>
						</c:forEach>						
					</tbody>
				</table>
				<!-- 페이징 시작 -->
				<div class="page-display">
					<div class="paginate_common" id="page_box">
						<ul class="pagination">
							<c:choose>
								<c:when test="${startPageNum ne 1 }">
									<li><a
										href="1?pageNum=${startPageNum-1 }&searchType=${searchType }">
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
											href="1?pageNum=${i }&open_close=${open_close}">${i }</a></li>
									</c:when>
									<c:otherwise>
										<li><a
											href="1?pageNum=${i }&open_close=${open_close}">${i }</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>

							<c:choose>
								<c:when test="${endPageNum lt totalPageCount }">
									<li><a
										href="1?pageNum=${endPageNum+1 }&open_close=${open_close}">
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
				<%-- <p class="note_result_search bottom">
					<img
						src="${pageContext.request.contextPath}/resources/images/common/ico_closed_store.png"
						alt="폐점"> 폐점된 판매점입니다.
				</p>

 --%>

			</div>
		</div>
	</div>
	<!-- 메인컨텐츠 끝 -->
	<!-- -------------------------------------- -->
<input type="hidden" id="guInfo" value="" />
</section>
</div>
</div>
<script>
function clickGu(e){
	 var tbody = $("#tbody");
	 var title = $(".color_key3");
	 
	 var rtlrSttus = $("#rtlrSttus");
	 var storeAbleGames = rtlrSttus.val(); // select box의 option - value 숫자가 들어온다. 로또1 연금2
	 var close = "<img src='${pageContext.request.contextPath}/resources/images/common/ico_closed_store.png' alt='폐점' />";
	 var lotto645_two = "<img src='${pageContext.request.contextPath}/resources/images/store/ico_seller_645.png' alt='lotto645'>";
	 var pension520_two = "<img src='${pageContext.request.contextPath}/resources/images/store/ico_seller_520.png' alt='연금복권520'>";
     var storeEnable = $("#storeEnable"); //0이면 폐점 1이면 안폐점

	var list = '';
	
	
	
	var guList = e.text;
	$("#guInfo").val(guList); // 추후 페이지네이션을 위해 hidden값에 저장
	var start = guList.indexOf(/(\s*)/g,"");
	var gugu = "구";

	 
	if(guList.indexOf(gugu) != -1){  //가져온 주소에 '구'라는 문자가 있다면
		var findGu = guList.indexOf("구",start+1); //경기도 일산동구 일때 '구'가 있는 곳부터 출력하기 
		list = guList.substring(start+1, findGu);
	}
	else if(guList.indexOf(gugu) == -1){  //가져온 주소에 '구'라는 문자가 없다면
		var findSi = guList.indexOf("시",start+1); //강원도 춘천시 일때 '시'가 있는 곳부터 출력하기
		list = guList.substring(start+1, findSi);
	}
	else if(guList.indexOf(gugu) == -1){  //가져온 주소에 '구'라는 문자가 없다면
		var findgun = guList.indexOf("군",start+1); //강원도 춘천시 일때 '시'가 있는 곳부터 출력하기
		list = guList.substring(start+1, findgun);
	}
	

		tbody.html("");
		title.html("");
		
		$.ajax(
		{
		  url : "${pageContext.request.contextPath}" + "/user/store/ajax/selectGulist",
		  dataType: 'html',
		  data: {storeAddr:list},	  
		  success: function(data){			 
			  $("#guResultDiv").html(data);
			  
		  },
		  error : function(e){
			  console.log("구 데이터 가져오기 에러");
		  }
		}	
		);	    
}

function clickGuPage(pageNum, openClose){
	
	
	
	var pageNum = pageNum;
	var open_close = openClose;
	
	var list = '';	
	
	var guList = $("#guInfo").val();
	var start = guList.indexOf(/(\s*)/g,"");
	var gugu = "구";

	 
	if(guList.indexOf(gugu) != -1){  //가져온 주소에 '구'라는 문자가 있다면
		var findGu = guList.indexOf("구",start+1); //경기도 일산동구 일때 '구'가 있는 곳부터 출력하기 
		list = guList.substring(start+1, findGu);
	}
	else if(guList.indexOf(gugu) == -1){  //가져온 주소에 '구'라는 문자가 없다면
		var findSi = guList.indexOf("시",start+1); //강원도 춘천시 일때 '시'가 있는 곳부터 출력하기
		list = guList.substring(start+1, findSi);
	}
	else if(guList.indexOf(gugu) == -1){  //가져온 주소에 '구'라는 문자가 없다면
		var findGun = guList.indexOf("군",start+1); //강원도 춘천시 일때 '시'가 있는 곳부터 출력하기
		list = guList.substring(start+1, findGun);
	}
	
	$.ajax(
	{
	  url : "${pageContext.request.contextPath}" + "/user/store/ajax/selectGulist",
	  dataType: 'html',
	  data: {storeAddr:list, pageNum:pageNum, open_close:open_close},	  
	  success: function(data){			 
		  $("#guResultDiv").html(data);
		  
	  },
	  error : function(e){
		  console.log("구 데이터 가져오기 에러");
	  }
	}	
    );
		 	
	
}
</script>