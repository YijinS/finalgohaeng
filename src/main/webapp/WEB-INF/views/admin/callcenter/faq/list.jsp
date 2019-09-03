<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<aside>
   <div id="sidebar">

      <!-- LNB Start -->
      <div class="snbArea">
         <ul id="snb">
            <li class="depth1 ">
                  <a id="QA_Lnb_Menu2486" href="${pageContext.request.contextPath}/admin/notice/list" menuno="2486" treeno="2703" class="product"> 공지사항</a>
            </li>
           
            <li class="depth1 collapsable">
               <a id="QA_Lnb_Menu2487" href="${pageContext.request.contextPath}/admin/callcenter/qna/list" menuno="2487" treeno="2707" class="member" style="color: black;font-weight: bold;"> 고객센터 </a>
                   <ul> 
                     <li><a id="QA_Lnb_Menu74"  href="${pageContext.request.contextPath}/admin/callcenter/qna/list" menuno="74"  treeno="2708" class=""> 1:1상담 </a>
                     </li>
                     <li><a id="QA_Lnb_Menu71"  href="${pageContext.request.contextPath}/callcenter/faq/all" menuno="71" treeno="2709" class=""> 자주묻는질문 </a>
                     </li>
                  </ul>
            </li>
            <li class="depth1">
                  <a id="QA_Lnb_Menu2488" href="${pageContext.request.contextPath}/admin/winner_interview/1" menuno="2488" treeno="2711" class="member"> 당첨자인터뷰 </a>
            </li>
               
            <li class="depth1">
               <a id="QA_Lnb_Menu2489" href="${pageContext.request.contextPath}/admin/store/1" menuno="2489" treeno="2712" class="board"> 판매점 </a>
            </li>
            <li class="depth1">
                <a id="QA_Lnb_Menu2488" href="${pageContext.request.contextPath}/admin/event/list" menuno="2488" treeno="2711" class="member"> 이벤트 </a>
            </li>
               
                <li class="depth1">
                   <a id="QA_Lnb_Menu2488" href="${pageContext.request.contextPath}/admin/drawshow/lotto/list" menuno="2488" treeno="2711" class="member"> 참관신청 </a>
               </li>
         </ul>
  
         <div class="ftp ">
            <a href="#">
               <img src="${pageContext.request.contextPath }/resources/images/index/logo-header.png" alt="고행복권" style="margin-left: -6px;" >
            </a>
         </div>
      </div>
      <!-- LNB End -->

   </div>
</aside>

<div class="body">
	<div class="containerWrap">
		<!--내용-->
		<section class="contentSection">
			<!--왼쪽-->
			<nav class="lnbNav">
				<!-- left menu include -------------->
				<div id="snb" class="lnb">
					<h2 id="08" class="lnb_title">고객센터</h2>
					<ul id="lnb" class="lnb_dep1">
						<li id="08-01"><a href="/counsel.do?method=callCenter"
							class="menuLnb"><span>고객센터 안내</span></a></li>
						<li id="08-02" class="active"><a
							href="/counsel.do?method=faq" class="menuLnb"><span>자주
									묻는 질문</span></a></li>
						<li id="08-03"><a href="/counsel.do?method=myCounselList"
							class="menuLnb"><span>1:1상담</span></a></li>
						<li id="08-06"><a href="/counsel.do?method=mobileLotto"
							class="menuLnb"><span>모바일 동행복권 </span></a></li>
						<li id="08-04"><a href="/counsel.do?method=winnerGuide"
							class="menuLnb"><span>사용자 가이드</span></a>
							<ul class="lnb_dep2" style="display: none;">
								<li id="08-04-01"><a href="/counsel.do?method=winnerGuide"><span>당첨자
											가이드 </span></a></li>
								<li id="08-04-02"><a href="/counsel.do?method=playerGuide"><span>이용자
											가이드 </span></a></li>
								<!-- <li id="08-04-03"><a href="/counsel.do?method=movieGuide"><span>이용안내 동영상 </span></a></li> -->
							</ul></li>
						<!-- 		<li id="08-05"><a href="/counsel.do?method=knowledge" class="menuLnb"><span>자료실</span></a> -->
						<!-- 			<ul class="lnb_dep2"> -->
						<!-- 				<li id="08-05-01"><a href="/counsel.do?method=knowledge"><span>복권바로알기 </span></a></li> -->
						<!-- 			</ul> -->
						<!-- 		</li> -->
					</ul>
				</div>

				<!-- ----------------------------- -->
			</nav>
			<!-- 컨텐츠 영역 -->
			<div id="article" class="contentsArticle">
				<div class="header_article">
					<h3 class="sub_title">자주 묻는 질문</h3>
					<p class="location">
						<a class="home" href="/"> Home </a><span class="gt">&gt;</span><a
							href="/counsel.do?method=callCenter">고객센터</a><span class="gt">&gt;</span><a
							href="/counsel.do?method=faq">자주 묻는 질문</a>
					</p>
				</div>
				<div>
					<div class="content_wrap">
						<!-- -------------------------------------------------------------------------------------- -->


						<div class="tab_article tab_size6">
							<ul>
								<li><a href="/counsel.do?method=faq&amp;tabGbn=">전체</a></li>
								<li class="active"><strong>로또6/45</strong><span
									class="accessibility">현재 선택됨</span></li>
								<li><a href="/counsel.do?method=faq&amp;tabGbn=2">연금복권520</a></li>
								<li><a href="/counsel.do?method=faq&amp;tabGbn=99">기타</a></li>
							</ul>
						</div>
						<div class="search_data">
							<div class="inner">
								<form name="searchfrm" id="searchfrm" method="post"
									onsubmit="false">
									<input type="hidden" id="tabGbn" name="tabGbn" value="1">
									<select id="kind" name="kind" title="조회 옵션 선택">
										<option value="2" selected="SELECTED">전체</option>
										<option value="1">제목</option>
										<option value="3">내용</option>
									</select> <input type="text" id="keyword" name="keyword" value=""
										maxlength="300"
										onkeydown="return $.enterCheck(window.event.keyCode);"
										title="검색어 입력"> <a class="btn_common form blu"
										href="javascript:void(0);" id="gosearch">조회</a>
								</form>
							</div>
						</div>
						<ul class="list_faq">
							<c:forEach var="list" items="${list}">
								<li id="seqQa_3" tabindex="" class="">
									<div class="question">
										<div class="inner">
											<span class="q"><span>질문</span></span>
											<p>
												<a href="#divQuestion3" id="a_3">${list.question}</a>
											</p>
										</div>
									</div>
									<div id="divQuestion3" class="answer" style="display: none;">
										<span class="a">답변</span>
										<div class="answer_content">
											<div>${list.answer}</div>
										</div>
									</div>
								</li>
							</c:forEach>
						</ul>
						<div class="paginate_common" id="page_box">
							<a href="#" class="current" title="현재 위치"><strong>1</strong></a>
						</div>
						<form name="cntFrm" id="cntFrm" method="post">
							<input type="hidden" id="txtNo" name="txtNo" value="">
						</form>
						<iframe name="faqList" id="faqList" width="0" height="0"
							title="빈 프레임"></iframe>
					</div>
				</div>
			</div>
		</section>
	</div>
</div>