<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="body">
	<div class="containerWrap">
		<section class="contentSection">
			<!-- ----------왼쪽메뉴---------- 영역 -->
			<nav class="lnbNav">

				<div id="snb" class="lnb">
					<h2 id="08" class="lnb_title">고객센터</h2>
					<ul id="lnb" class="lnb_dep1">
						<li id="08-01" class="active"><a href="${pageContext.request.contextPath }/callcenter/info" class="menuLnb"><span>고객센터 안내</span></a></li>
						<li id="08-02"><a href="${pageContext.request.contextPath }/callcenter/faq/all" class="menuLnb"><span>자주 묻는 질문</span></a></li>
						<li id="08-03"><a href="${pageContext.request.contextPath }/callcenter/qna/list" class="menuLnb"><span>1:1상담</span></a></li>
						<li id="08-06"><a href="${pageContext.request.contextPath }/callcenter/mobilelotto" class="menuLnb"><span>모바일 동행복권 </span></a></li>
						<li id="08-04"><a href="${pageContext.request.contextPath }/callcenter/userguide/winner" class="menuLnb"><span>사용자 가이드</span></a>
							<ul class="lnb_dep2" style="display: none;">
								<li id="08-04-01"><a href="#"><span>당첨자 가이드 </span></a></li>
								<li id="08-04-02"><a href="#"><span>이용자 가이드 </span></a></li>
							</ul></li>
					</ul>
				</div>

			</nav>
			<!-- -------------------------------------- -->
			<!-- ----------메인컨텐츠---------- 영역 -->
			<main id="article" class="contentsArticle">
			<div class="header_article">
				<h3 class="sub_title">자주 묻는 질문</h3>
				<p class="location">
					<a class="home" href="/"> Home </a><span class="gt">&gt;</span>
					<a href="${pageContext.request.contextPath }/callcenter/info">고객센터</a><span class="gt">&gt;</span><a href="${pageContext.request.contextPath }/callcenter/faq/list">자주 묻는 질문</a>
				</p>
			</div>
			<div>
				<div class="content_wrap">
					<!-- -------------------------------------------------------------------------------------- -->


					<div class="tab_article tab_size6">
						<ul>
							<li><a href="all?">전체</a></li>
							<li class="active"><strong>로또6/45</strong><span class="accessibility">현재 선택됨</span></li>
							<li><a href="pension">연금복권520</a></li>
							<li><a href="etc">기타</a></li>
						</ul>
					</div>
					<div class="search_data">
						<div class="inner">
							<form name="searchfrm" id="searchfrm" method="post"
								onsubmit="false">
								<input type="hidden" id="tabGbn" name="tabGbn" value="">
								
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
						<c:forEach var="list" items="${list }">
							<input type="hidden" id="category" name="category" value="${list.category }">
					<%-- 		 <c:choose>
								<c:when test="${list.category == 1}">  <!-- 카테고리 1 = 로또  -->  --%>
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
								<%-- </c:when>
							</c:choose>  --%>
						</c:forEach>
					</ul>
					<script>
					var faqList= $(".list_faq");
					faqList.find("> li .question .inner p a").click(function(event){
						event.preventDefault();
						faqList.find("> li").attr("tabindex","");  
						/* 
						tabindex: 속성 값이 0인 경우는 탭을 눌렀을 때 포커스가 가지 않는 엘리먼트에게 포커스를 줄 수 있다. -1은 포커스 ㄴㄴ
						예를 들어, div영역에도 포커스를 줄 수 있다는 의미이다. */

						var pli = $(this).parents("li");
						if(pli.hasClass("open")){
							pli.find(".answer").stop().slideUp(150);
							pli.removeClass("open");
						}else{
							faqList.find("li.open .answer").stop().slideUp(150,function(){
								$(this).parent("li").removeClass("open");
							});
							pli.find(".answer").stop().slideDown(150);
							pli.addClass("open");
						}
					});
				
					</script>
						<!-- 페이징 시작 -->

				<div class="page-display">
                        <div class="paginate_common" id="page_box">
                           <ul class="pagination">
                              <c:choose>
                                 <c:when test="${startPageNum ne 1 }">
                                    <li><a href="lotto?pageNum=${startPageNum-1 }">&laquo; </a></li>
                                 </c:when>
                                 <c:otherwise>
                                    <li class="disabled"><a href="javascript:">&laquo;</a></li>
                                 </c:otherwise>
                              </c:choose>
                              <c:forEach var="i" begin="${startPageNum }" end="${endPageNum }" step="1">
                                 <c:choose>
                                    <c:when test="${i eq pageNum }">
                                       <li class="active"><a
                                          href="lotto?pageNum=${i }">${i }</a></li>
                                    </c:when>
                                    <c:otherwise>
                                       <li><a href="lotto?pageNum=${i }">${i }</a></li>
                                    </c:otherwise>
                                 </c:choose>
                              </c:forEach>

                              <c:choose>
                                 <c:when test="${endPageNum lt totalPageCount }">
                                    <li><a href="lotto?pageNum=${endPageNum+1 }">&raquo; </a></li>
                                 </c:when>
                                 <c:otherwise>
                                    <li class="disabled"><a href="javascript:">&raquo;</a></li>
                                 </c:otherwise>
                              </c:choose>
                           </ul>
                        </div>
                     </div>

				<!-- 페이징 종료 -->
					<form name="cntFrm" id="cntFrm" method="post">
						<input type="hidden" id="txtNo" name="txtNo" value="">
					</form>
					<iframe name="faqList" id="faqList" width="0" height="0"
						title="빈 프레임"></iframe>
				</div>
			</div>
			</main>
			<!-- -------------------------------------- -->
		</section>
	</div>
</div>
<!-- ----------------------------------------------------- -->