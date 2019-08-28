<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
								<li id="03-05-02"><a href="${pageContext.request.contextPath }/gameresult/lottostat/2"><span> 번호별 통계</span></a></li>
								<li id="03-05-03" class="active"><a href="${pageContext.request.contextPath }/gameresult/lottostat/3"><span> 색상 통계</span></a></li>
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
					<h3 class="sub_title">색상통계</h3>
					<p class="location">
						<a class="home" href="/"> Home </a><span class="gt">&gt;</span><a
							href="#">당첨결과</a><span class="gt">&gt;</span><a href="#"><span>로또6/45
								당첨통계</span></a><span class="gt">&gt;</span><a href="#"> 색상 통계</a>
					</p>
				</div>
				<div>
					<div class="content_wrap content_stat_color_645">
						<!-- -------------------------------------------------------------------------------------- -->

						<div class="search_data">
							<div class="inner">
								<form id="frm" name="frm" method="post">
									<input type="hidden" name="sortOrder" value="DESC"> 
									<span>
										<select id="sttDrwNo" name="startgames" title="조회 시작회차 선택">
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
										<select id="edDrwNo" name="endgames" title="조회 종료회차 선택">
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
									</span>
									<a id="search_btn" class="btn_common form blu" href="#">조회</a>
								</form>
								<script>
									$(function(){
										var form = $("#frm");
										var btn = $("#search_btn");
										
										btn.click(function(e){
											e.preventDefault();
											history.replaceState({},null,location.pathname);
											form.submit();
										});
									});
								</script>
							</div>
						</div>
						<div class="box_chart">
							<div id="piechart" class="chart" style="width:400px;height:400px">
							</div>
							<ul id="chartLegend1" class="legend_basic">
								<li><span class="color ball1"></span><span>1번~10번</span></li>
								<li><span class="color ball2"></span><span>11번~20번</span></li>
								<li><span class="color ball3"></span><span>21번~30번</span></li>
								<li><span class="color ball4"></span><span>31번~40번</span></li>
								<li><span class="color ball5"></span><span>41번~45번</span></li>
							</ul>
						</div>
						<input type="hidden" id="first" value="${list.first }" />
						<input type="hidden" id="second" value="${list.second }" />
						<input type="hidden" id="third" value="${list.third }" />
						<input type="hidden" id="fourth" value="${list.fourth }" />
						<input type="hidden" id="fifth" value="${list.fifth }" />

						<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
					    <script type="text/javascript">
					      google.charts.load('current', {'packages':['corechart']});
					      google.charts.setOnLoadCallback(drawChart);
					
					      function drawChart() {
					    	  var first = parseInt($("#first").val());
					    	  var second = parseInt($("#second").val());
					    	  var third = parseInt($("#third").val());
					    	  var fourth = parseInt($("#fourth").val());
					    	  var fifth = parseInt($("#fifth").val());
  
					        var data = google.visualization.arrayToDataTable([
					          ['번호', '당첨횟수'],
					          ['1~10번',first],
					          ['11~20번',second],
					          ['21~30번',third],
					          ['31~40번 ',fourth],
					          ['41~45번',fifth]
					        ]);
					
					        var options = {
					          'chartArea':{left:0,top:0,width:"100%",height:"100%"},
					          'height': 400,
					          'width': 400,
					          'legend' : 'none',
					          'fontSize' : 20,
					          'fontName' : 'Noto Sans KR',
					          'colors' : ['#fbc400','#69c8f2','#ff7272','#aaa','#b0d840']
					        };
					
					        var chart = new google.visualization.PieChart(document.getElementById('piechart'));
							
					        chart.draw(data, options);
					      }
					    </script>
						<table class="tbl_data tbl_data_col">
							<caption>회차별 당첨번호 및 보너스 번호 통계</caption>
							<colgroup>
								<col style="width: 145px">
								<col style="width: 190px">
								<col>
								<col style="width: 160px">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">회차</th>
									<th scope="col">당첨일자</th>
									<th scope="col">당첨번호</th>
									<th scope="col">보너스</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="tmp" items="${datas.list }">
								<fmt:formatDate var="drawDate" value="${tmp.drawDate }" pattern="yyyy-MM-dd"/>
									<tr>
										<td>${tmp.games }</td>
										<td>${drawDate }</td>
										<td>
											<c:forEach begin="0" end="5" varStatus="vs" step="1">

											<fmt:parseNumber var="num"
												value="${fn:substring(tmp.winningNum,vs.index*2,vs.count*2) }" />
											<c:choose>
												<c:when test="${num lt 11 }">
													<span class="ball_645 sml ball1">${num }</span>
												</c:when>
												<c:when test="${num lt 21 }">
													<span class="ball_645 sml ball2">${num }</span>
												</c:when>
												<c:when test="${num lt 31 }">
													<span class="ball_645 sml ball3">${num }</span>
												</c:when>
												<c:when test="${num lt 41 }">
													<span class="ball_645 sml ball4">${num }</span>
												</c:when>
												<c:otherwise>
													<span class="ball_645 sml ball5">${num }</span>
												</c:otherwise>
											</c:choose>
										</c:forEach>
										</td>
										<td>
											<c:choose>
												<c:when test="${tmp.bonusNum lt 11 }">
													<span class="ball_645 sml ball1">${tmp.bonusNum }</span>
												</c:when>
												<c:when test="${tmp.bonusNum lt 21 }">
													<span class="ball_645 sml ball2">${tmp.bonusNum }</span>
												</c:when>
												<c:when test="${tmp.bonusNum lt 31 }">
													<span class="ball_645 sml ball3">${tmp.bonusNum }</span>
												</c:when>
												<c:when test="${tmp.bonusNum lt 41 }">
													<span class="ball_645 sml ball4">${tmp.bonusNum }</span>
												</c:when>
												<c:otherwise>
													<span class="ball_645 sml ball5">${tmp.bonusNum }</span>
												</c:otherwise>
											</c:choose>
										</td>
									
									</tr>
								</c:forEach>

							</tbody>
						</table>
						<div class="paginate_common" id="page_box">
							<a class="go first" href="3?start=${save.start}&end=${save.end}">처음 페이지</a>
							<c:if test="${datas.startPageNum ne 1 }">
								<a class="go prev" href="3?page=${datas.startPageNum-1 }&start=${save.start}&end=${save.end}">
									이전 페이지
								</a>
							</c:if>
							<c:forEach var="i" begin="${datas.startPageNum }" end="${datas.endPageNum }" step="1">
								<c:choose>
									<c:when test="${i eq datas.pageNum }">
										<a class="current" title="현재 위치" href="3?page=${i }&start=${save.start}&end=${save.end}"><strong>${i }</strong></a>
									</c:when>
									<c:otherwise>
										<a href="3?page=${i }&start=${save.start}&end=${save.end }">${i }</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>

							<c:if test="${datas.endPageNum lt datas.totalPageCount }">
								<a class="go next" href="3?page=${datas.endPageNum+1 }&start=${save.start }&end=${save.end }">
									다음 페이지
								</a>
							</c:if>
							<a class="go end" href="3?page=${datas.totalPageCount }&start=${save.start }&end=${save.end }">
								끝 페이지
							</a>
						</div>
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
						<!-- -------------------------------------------------------------------------------------- -->
					</div>
				</div>
			</div>
		</section>
	</div>
</div>
