<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
						<li id="03-01"><a
							href="${pageContext.request.contextPath }/gameresult/lotto645/1"
							class="menuLnb"><span>로또6/45</span></a>
							<ul class="lnb_dep2" style="display: none;">
								<li id="03-01-01"><a
									href="${pageContext.request.contextPath }/gameresult/lotto645/1"><span>
											회차별 당첨번호</span></a></li>
								<li id="03-01-02"><a
									href="${pageContext.request.contextPath }/gameresult/lotto645/2"><span>
											내번호 당첨확인</span></a></li>
								<li id="03-01-03"><a
									href="${pageContext.request.contextPath }/gameresult/lotto645/3"><span>
											당첨내역</span></a></li>
								<li id="03-01-04"><a
									href="${pageContext.request.contextPath }/gameresult/lotto645/4"><span>
											당첨금 지급안내</span></a></li>
								<li id="03-01-05"><a
									href="${pageContext.request.contextPath }/gameresult/lotto645/5"><span>
											추첨방송 다시보기</span></a></li>
								<li id="03-01-06"><a
									href="${pageContext.request.contextPath }/gameresult/lotto645/6"><span>
											추첨방송 참관신청</span></a></li>
							</ul></li>
						<li id="03-02"><a
							href="${pageContext.request.contextPath }/gameresult/pension520/1"
							class="menuLnb"><span>연금복권520</span></a>
							<ul class="lnb_dep2" style="display: none;">
								<li id="03-02-01"><a
									href="${pageContext.request.contextPath }/gameresult/pension520/1"><span>
											회차별 당첨번호</span></a></li>
								<li id="03-02-02"><a
									href="${pageContext.request.contextPath }/gameresult/pension520/2"><span>
											내번호 당첨확인</span></a></li>
								<li id="03-02-03"><a
									href="${pageContext.request.contextPath }/gameresult/pension520/3"><span>
											당첨내역</span></a></li>
								<li id="03-02-04"><a
									href="${pageContext.request.contextPath }/gameresult/pension520/4"><span>
											당첨금 지급안내</span></a></li>
								<li id="03-02-05"><a
									href="${pageContext.request.contextPath }/gameresult/pension520/5"><span>
											추첨방송 다시보기</span></a></li>
								<li id="03-02-06"><a
									href="${pageContext.request.contextPath }/gameresult/pension520/6"><span>
											추첨방송 참관신청</span></a></li>
							</ul></li>
						<li id="03-05"><a
							href="${pageContext.request.contextPath }/gameresult/lottostat/1"
							class="menuLnb"><span>로또6/45 당첨통계</span></a>
							<ul class="lnb_dep2" style="display: none;">
								<li id="03-05-01" class="active"><a
									href="${pageContext.request.contextPath }/gameresult/lottostat/1"><span>
											당첨통계</span></a></li>
								<li id="03-05-02"><a
									href="${pageContext.request.contextPath }/gameresult/lottostat/2"><span>
											번호별 통계</span></a></li>
								<li id="03-05-03"><a
									href="${pageContext.request.contextPath }/gameresult/lottostat/3"><span>
											색상 통계</span></a></li>
								<li id="03-05-04"><a
									href="${pageContext.request.contextPath }/gameresult/lottostat/4"><span>
											구간별 출현횟수</span></a></li>
							</ul></li>
						<li id="03-06"><a
							href="${pageContext.request.contextPath }/gameresult/pensionstat/1"
							class="menuLnb"><span style="letter-spacing: -1px;">연금복권520
									당첨통계</span></a></li>
						<li id="03-07" class="active"><a
							href="${pageContext.request.contextPath }/gameresult/winningnews/1"
							class="menuLnb"><span>당첨소식</span></a>
							<ul class="lnb_dep2" style="display: block;">
								<li id="03-07-01" class="active"><a
									href="${pageContext.request.contextPath }/gameresult/winningnews/1"><span>
											당첨자 인터뷰</span></a></li>
								<li id="03-07-02"><a
									href="${pageContext.request.contextPath }/gameresult/winningnews/2"><span>
											당첨 소감 게시판</span></a></li>
							</ul></li>
						<li id="03-08"><a
							href="${pageContext.request.contextPath }/gameresult/unreceived/1"
							class="menuLnb"><span>미수령 당첨금</span></a>
							<ul class="lnb_dep2" style="display: none;">
								<li id="03-08-01"><a
									href="${pageContext.request.contextPath }/gameresult/unreceived/1"><span>
											로또6/45</span></a></li>
								<li id="03-08-02"><a
									href="${pageContext.request.contextPath }/gameresult/unreceived/2"><span>
											연금복권520</span></a></li>
							</ul></li>
					</ul>
				</div>
			</nav>

			<!-- -------------------------------------- -->
			<!-- ----------메인컨텐츠---------- 영역 -->
			<div id="article" class="contentsArticle">
				<div class="header_article">
					<h3 class="sub_title">당첨자 인터뷰</h3>
					<p class="location">
						<a class="home" href="/"> Home </a><span class="gt">&gt;</span><a
							href="#">당첨결과</a><span class="gt">&gt;</span><a href="#"><span>당첨소식</span></a><span
							class="gt">&gt;</span><a href="#"> 당첨자 인터뷰</a>
					</p>
				</div>
				<div>
					<div class="content_wrap content_interview_winner">

						<form name="frm" id="frm">
							<input type="hidden" name="txtNo" id="txtNo">
						</form>
						<div class="list_pic_summ list_winner">
							<ul>
								<c:forEach var="list" items="${list}">


									<li><c:choose>
											<c:when test="${list.wiCategory eq 1}">
												<span class="pic"> <img
													src="${pageContext.request.contextPath}/resources/images/store/ico_seller_645.png"
													alt="lotto645">
												</span>
											</c:when>
											<c:when test="${list.wiCategory eq 2}">
												<span class="pic"> <img
													src="${pageContext.request.contextPath}/resources/images/store/ico_seller_520.png"
													alt="연금복권520">
												</span>
											</c:when>
											<c:otherwise>
												<span class="pic"> <img
													src="${pageContext.request.contextPath}/resources/images/store/ico_seller_645.png"
													alt="스피또1000">
												</span>
											</c:otherwise>
										</c:choose> <!-- 카테고리 1이면 로또 2면 연금  -->
										<div class="summary">
											<strong class="game">${list.wiIndex}</strong> <a
												href="1detail?wiIndex=${list.wiIndex}">${list.wiTitle}</a> <br>
											<span class="date"><strong>작성일: </strong> <fmt:formatDate
													value="${list.wiRegDate}" pattern="yyyy-MM-dd" /></span> <br>
											<p class="comment">
												<strong>소감한마디 : </strong><span></span>
											</p>
										</div>
										<div class="action">
											<a class="btn_common mid"
												href="1detail?wiIndex=${list.wiIndex}">${list.memberId}
												인터뷰 보기</a>
										</div></li>


								</c:forEach>
							</ul>
						</div>
						<div class="paginate_common" id="page_box">
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
										<c:forEach var="i" begin="${startPageNum }"
											end="${endPageNum }" step="1">
											<c:choose>
												<c:when test="${i eq pageNum }">
													<li class="active"><a
														href="1?pageNum=${i }&open_close=${open_close}">${i }</a></li>
												</c:when>
												<c:otherwise>
													<li><a href="1?pageNum=${i }&open_close=${open_close}">${i }</a></li>
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




					</div>
				</div>
			</div>
		</section>
	</div>
</div>
