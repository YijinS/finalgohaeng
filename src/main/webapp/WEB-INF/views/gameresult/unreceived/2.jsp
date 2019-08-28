<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



	<div class="body">
		<div class="containerWrap">
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
							<li id="03-05"><a href="${pageContext.request.contextPath }/gameresult/lottostat/1" class="menuLnb"><span>로또6/45
										당첨통계</span></a>
								<ul class="lnb_dep2" style="display: none;">
									<li id="03-05-01" class="active"><a href="${pageContext.request.contextPath }/gameresult/lottostat/1"><span>
												당첨통계</span></a></li>
									<li id="03-05-02"><a href="${pageContext.request.contextPath }/gameresult/lottostat/2"><span> 번호별 통계</span></a></li>
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
							<li id="03-08" class="active"><a href="${pageContext.request.contextPath }/gameresult/unreceived/1" class="menuLnb"><span>미수령
										당첨금</span></a>
								<ul class="lnb_dep2" style="display: block;">
									<li id="03-08-01"><a href="${pageContext.request.contextPath }/gameresult/unreceived/1"><span> 로또6/45</span></a></li>
									<li id="03-08-02" class="active"><a href="${pageContext.request.contextPath }/gameresult/unreceived/2"><span> 연금복권520</span></a></li>
								</ul></li>
						</ul>
					</div>
				</nav>
				<!-- -------------------------------------- -->
				<!-- ----------메인컨텐츠---------- 영역 -->
				<div id="article" class="contentsArticle">
					<div class="header_article">
						<h3 class="sub_title">연금복권520</h3>
						<p class="location">
							<a class="home" href="/"> Home </a><span class="gt">&gt;</span><a
								href="#">당첨결과</a><span class="gt">&gt;</span><a
								href="#"><span>미수령
									당첨금</span></a><span class="gt">&gt;</span><a
								href="#"> 연금복권520</a>
						</p>
					</div>
					<div>
						<div class="content_wrap content_result_notreceive_520">
							<!-- -------------------------------------------------------------------------------------- -->

							<div class="group_content">
								<div class="group_title">
									<h4 class="title">지급만료기한</h4>
								</div>
								<div class="group_inner">
									<ul class="list_text_common">
										<li>당첨복권의 <strong>지급만료기한은 지급개시일로부터 1년 이내</strong>입니다.
										</li>
										<li>지급기한을 넘긴 당첨금은 복권기금으로 귀속됩니다.</li>
										<li>복권을 구입하시면 티켓 뒷면에 미리 서명하시고, 추첨일 이후 반드시 <strong>본인이
												구입한 티켓 당첨번호를 확인하는 습관</strong>을 가지세요.
										</li>
									</ul>
								</div>
							</div>
							<div class="group_content group_data_search">
								<div class="group_title">
									<span class="title">전체게시물 :<strong> 9 ( 1 / 1 )</strong></span>
									<div class="action">
										<div class="search">
											<form name="searchfrm" id="searchfrm" method="post">
												<input type="hidden" id="txtNo" name="txtNo"> <input
													type="hidden" id="dtaFileUrl" name="dtaFileUrl"> <select
													id="kind" name="kind" title="조회 옵션 선택">
													<option value="2">전체</option>
													<option value="1">제목</option>
													<option value="3">내용</option>
												</select> <input type="text" id="keyword" name="keyword"
													onkeydown=""
													value="" title="검색어 입력"> <a id="gosearch"
													class="btn_common form blu" href="#">조회</a>
											</form>
										</div>
									</div>
								</div>
								<table class="tbl_data tbl_data_col">
									<caption>번호, 제목, 첨부파일, 등록일 등 연금복권520 미지급 당첨금 기금귀속 안내</caption>
									<colgroup>
										<col style="width: 85px">
										<col>
										<col style="width: 110px">
										<col style="width: 130px">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">번호</th>
											<th scope="col">제목</th>
											<th scope="col">첨부파일</th>
											<th scope="col">등록일</th>
										</tr>
									</thead>
									<tbody>


										<tr>
											<td>9</td>
											<td class="ta_left"><a href="#"
												onclick="">연금복권520 미지급
													당첨금 기금 귀속 안내(2019년 7월) </a></td>

											<td><a class="btn_attach" href="#none"
												onclick="">첨부파일</a></td>
											<td>2019-06-28</td>
										</tr>

										<tr>
											<td>8</td>
											<td class="ta_left"><a href="#"
												onclick="">연금복권520 미지급
													당첨금 기금 귀속 안내(2019년 6월) </a></td>

											<td><a class="btn_attach" href="#none"
												onclick="">첨부파일</a></td>
											<td>2019-06-19</td>
										</tr>

										<tr>
											<td>7</td>
											<td class="ta_left"><a href="#"
												onclick="">연금복권520 미지급
													당첨금 기금 귀속 안내(2019년 5월) </a></td>

											<td><a class="btn_attach" href="#none"
												onclick="">첨부파일</a></td>
											<td>2019-04-18</td>
										</tr>

										<tr>
											<td>6</td>
											<td class="ta_left"><a href="#"
												onclick="">연금복권520 미지급
													당첨금 기금 귀속 안내(2019년 4월) </a></td>

											<td><a class="btn_attach" href="#none"
												onclick="">첨부파일</a></td>
											<td>2019-03-22</td>
										</tr>

										<tr>
											<td>5</td>
											<td class="ta_left"><a href="#"
												onclick="">연금복권520 미지급
													당첨금 기금 귀속 안내(2019년 3월)</a></td>

											<td><a class="btn_attach" href="#none"
												onclick="">첨부파일</a></td>
											<td>2019-02-20</td>
										</tr>

										<tr>
											<td>4</td>
											<td class="ta_left"><a href="#"
												onclick="">연금복권520 미지급
													당첨금 기금 귀속 안내(2019년 2월)</a></td>

											<td><a class="btn_attach" href="#none"
												onclick="">첨부파일</a></td>
											<td>2019-01-18</td>
										</tr>

										<tr>
											<td>3</td>
											<td class="ta_left"><a href="#"
												onclick="">연금복권520 미지급
													당첨금 기금 귀속 안내(2018년 11월)</a></td>

											<td><a class="btn_attach" href="#none"
												onclick="">첨부파일</a></td>
											<td>2018-11-05</td>
										</tr>

										<tr>
											<td>2</td>
											<td class="ta_left"><a href="#"
												onclick="">연금복권520 미지급
													당첨금 기금 귀속 안내(2018년 12월)</a></td>

											<td><a class="btn_attach" href="#none"
												onclick="">첨부파일</a></td>
											<td>2018-11-05</td>
										</tr>

										<tr>
											<td>1</td>
											<td class="ta_left"><a href="#"
												onclick="">연금복권520 미지급
													당첨금 기금 귀속 안내(2019년 1월)</a></td>

											<td><a class="btn_attach" href="#none"
												onclick="">첨부파일</a></td>
											<td>2018-11-05</td>
										</tr>

									</tbody>
								</table>
								<div class="wrap_paginate">
									<div class="paginate_common" id="page_box">
										<a href="#none" class="current" title="현재 위치"><strong>1</strong></a>
										<form name="sendComSearchForm" method="post">
											<input type="hidden" name="kind" value=""> <input
												type="hidden" name="keyword" value=""> <input
												type="hidden" name="startDate" value=""> <input
												type="hidden" name="endDate" value=""> <input
												type="hidden" name="searchDate" value=""> <input
												type="hidden" name="search" value=""> <input
												type="hidden" name="contentsCode" value=""> <input
												type="hidden" name="olddate" value="0"> <input
												type="hidden" name="lottoId" value="null"> <input
												type="hidden" name="pop" value=""> <input
												type="hidden" name="userId2" value="null"> <input
												type="hidden" name="cooperationId" value="null"> <input
												type="hidden" name="statusCode" value=""> <input
												type="hidden" name="lottoRound" value=""> <input
												type="hidden" name="sttDrwNo" value=""> <input
												type="hidden" name="edDrwNo" value=""> <input
												type="hidden" name="addr1" value=""> <input
												type="hidden" name="addr2" value=""> <input
												type="hidden" name="keyword1" value=""> <input
												type="hidden" name="keyword2" value=""> <input
												type="hidden" name="keyword3" value=""> <input
												type="hidden" name="keyword4" value=""> <input
												type="hidden" name="keyword5" value=""> <input
												type="hidden" name="appType" value=""> <input
												type="hidden" name="etcTxt1" value="">
										</form>
										<!-- <script>
											function goComSearchForm(boardUrl) {
												document.sendComSearchForm.action = boardUrl;
												document.sendComSearchForm
														.submit();
											}
										</script> -->
									</div>
								</div>
							</div>


							<!-- -------------------------------------------------------------------------------------- -->

						</div>
					</div>
				</div>

		<!-- 메인컨텐츠 끝 -->
				<!-- -------------------------------------- -->
				
			</section>
		</div>
	</div>
	