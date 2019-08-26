<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<main>
<div id="article" class="contentsArticle">
	<div class="header_article">
		<h3 class="sub_title">자주 묻는 질문</h3>
	</div>
	<div>
		<div class="content_wrap">
			<!-- -------------------------------------------------------------------------------------- -->
			<div class="tab_article tab_size6">
				<ul>
					<li class="active"><strong>전체</strong><span
						class="accessibility">현재 선택됨</span></li>
					<li><a href="/counsel.do?method=faq&amp;tabGbn=1">로또6/45</a></li>
					<li><a href="/counsel.do?method=faq&amp;tabGbn=2">연금복권520</a></li>					
					<li><a href="/counsel.do?method=faq&amp;tabGbn=99">기타</a></li>
				</ul>
			</div>
			<div class="search_data">
				<div class="inner">
					<form name="searchfrm" id="searchfrm" method="post"
						onsubmit="false">
						<input type="hidden" id="tabGbn" name="tabGbn" value=""> <select
							id="kind" name="kind" title="조회 옵션 선택">
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
				<c:forEach var="list" items="${list }">
				<li id="seqQa_11" tabindex="" class="">
					<div class="question">
						<div class="inner">
							<span class="q"><span>질문</span></span>
							<p>
								<a href="#divQuestion11" id="a_11">${list.question }</a>
							</p>
						</div>
					</div>
					<div id="divQuestion11" class="answer" style="display: none;">
						<span class="a">답변</span>
						<div class="answer_content">${list.answer }</div>
					</div>
				</li>
				</c:forEach>
			</ul>
			<div class="paginate_common" id="page_box">
				<a href="#" class="current" title="현재 위치"><strong>1</strong></a> <a
					href="javascript:selfSubmit('2')">2</a> <a
					href="javascript:selfSubmit('3')">3</a>
			</div>
			<form name="cntFrm" id="cntFrm" method="post">
				<input type="hidden" id="txtNo" name="txtNo" value="">
			</form>
			<iframe name="faqList" id="faqList" width="0" height="0"
				title="빈 프레임"></iframe>
		</div>
	</div>
</div>
</main>