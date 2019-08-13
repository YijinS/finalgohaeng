<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="body">
	<div class="containerWrap">
		<section class="contentSection">
			<!-- ----------왼쪽메뉴---------- 영역 -->
			<nav class="lnbNav">
				<div id="snb" class="lnb">
					<h2 id="05" class="lnb_title">이벤트</h2>
					<ul id="lnb" class="lnb_dep1">
						<li id="05-01" class="active"><a
							href="/event.do?method=Eventend" class="menuLnb"><span>이벤트</span></a>
						</li>
					</ul>
				</div>
			</nav>
			<!-- -------------------------------------- -->
			<!-- ----------메인컨텐츠---------- 영역 -->
			<main id="article" class="contentsArticle">
				<div class="header_article">
					<h3 class="sub_title">이벤트</h3>
					<p class="location">
						<a class="home" href="/"> Home </a><span class="gt">&gt;</span><a
							href="/event/list">이벤트</a><span class="gt">&gt;</span><a
							href="/event/list">이벤트</a>
					</p>
				</div>
				<div>
					<div class="content_wrap">
						<!-- --------------------------------------- 컨텐트 시작 ----------------------------------------------- -->

						<form name="letGoBoardDetail" method="post" action="">
							<input type="hidden" name="currentPage" value="0"> <input
								type="hidden" name="startPage" value="0"> <input
								type="hidden" name="endPage" value="0"> <input
								type="hidden" name="kind" value=""> <input type="hidden"
								name="keyword" value="">
						</form>
						<div class="search_data">
							<div class="inner">
								<form id="searchfrm" name="searchfrm" method="post">
									<input type="hidden" name="kind" value="total"> <input
										type="text" id="keyword" name="keyword" value=""
										placeholder="이벤트명을 입력해 주세요." maxlength="500" title="검색어 입력">
									<a class="btn_common form blu" id="gosearch" href="#">조회</a>
								</form>
							</div>
						</div>

						<div class="list_pic_summ list_event">
							<ul>
								<li>
									<a class="pic"
									href="javascript:showBoardDetail('/event.do?method=EventendDetail&amp;txtNo=129');">
										<img src="/img/event/2_1564471100886.jpg"
										alt="가상계좌 입금수수료 보상 이벤트 썸네일">
									</a>
									<div class="top">
										<p class="subject">
											<span class="label ing"> 진행중 </span> <a
												href="javascript:showBoardDetail('/event.do?method=EventendDetail&amp;txtNo=129');">가상계좌
												입금수수료 보상 이벤트</a>
										</p>
										<p class="summary"></p>
									</div>
									<div class="bottom">
										<p class="information">
											<strong>이벤트 기간 : </strong><span>2019-08-01 ~
												2019-10-31</span><br> <strong>당첨자 발표일 : </strong><span>2019-11-01</span>
										</p>
									</div>
								</li>
							</ul>
						</div>
						<div class="paginate_common" id="page_box">
							<a href="#none" class="current" title="현재 위치"><strong>1</strong></a>
							<a
								href="javascript:goComSearchForm('/event.do?method=Eventend&amp;startPage=1&amp;endPage=6&amp;currentPage=2')">2</a>
							<a
								href="javascript:goComSearchForm('/event.do?method=Eventend&amp;startPage=1&amp;endPage=6&amp;currentPage=3')">3</a>
							<a
								href="javascript:goComSearchForm('/event.do?method=Eventend&amp;startPage=1&amp;endPage=6&amp;currentPage=4')">4</a>
							<a
								href="javascript:goComSearchForm('/event.do?method=Eventend&amp;startPage=1&amp;endPage=6&amp;currentPage=5')">5</a>
							<a
								href="javascript:goComSearchForm('/event.do?method=Eventend&amp;startPage=1&amp;endPage=6&amp;currentPage=6')">6</a>
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
									type="hidden" name="pop" value=""> <input type="hidden"
									name="userId2" value="null"> <input type="hidden"
									name="cooperationId" value="null"> <input type="hidden"
									name="statusCode" value=""> <input type="hidden"
									name="lottoRound" value=""> <input type="hidden"
									name="sttDrwNo" value=""> <input type="hidden"
									name="edDrwNo" value=""> <input type="hidden"
									name="addr1" value=""> <input type="hidden"
									name="addr2" value=""> <input type="hidden"
									name="keyword1" value=""> <input type="hidden"
									name="keyword2" value=""> <input type="hidden"
									name="keyword3" value=""> <input type="hidden"
									name="keyword4" value=""> <input type="hidden"
									name="keyword5" value=""> <input type="hidden"
									name="appType" value=""> <input type="hidden"
									name="etcTxt1" value="">
							</form>
							<script>function goComSearchForm(boardUrl){
								document.sendComSearchForm.action=boardUrl;
								document.sendComSearchForm.submit();}</script>

						</div>
						<!-- --------------------------------------------컨텐트 끝 ------------------------------------------ -->
					</div>
				</div>
			</main>
			<!-- -------------------------------------- -->
		</section>
	</div>
</div>
<!-- ----------------------------------------------------- -->