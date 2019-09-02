<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<main>
<div id="article">
	<div class="content_wrap content_interview_winner">

		<form name="frm" id="frm">
			<input type="hidden" name="txtNo" id="txtNo">
		</form>
		<div class="list_pic_summ list_winner">
			<ul>
				<c:forEach var="list" items="${list}">
				<li>
					<c:choose>
						<c:when test="${list.wiCategory eq 1}">
							<span class="pic"> 
								<img src="${pageContext.request.contextPath}/resources/images/store/ico_seller_645.png" alt="lotto645">
							</span>
						</c:when>
						<c:when test="${list.wiCategory eq 2}">
							<span class="pic"> 
								<img src="${pageContext.request.contextPath}/resources/images/store/ico_seller_520.png" alt="연금복권520">
							</span>
						</c:when>
						<c:otherwise>
							<span class="pic"> 
							<img src="${pageContext.request.contextPath}/resources/images/store/ico_seller_645.png" alt="스피또1000">
						</span>
						</c:otherwise>
					</c:choose>
					 <!-- 카테고리 1이면 로또 2면 연금  -->
						<div class="summary">
							<strong class="game">${list.wiIndex}</strong> <a
								href="1detail?wiIndex=${list.wiIndex}">${list.wiTitle}</a> <br>
							<span class="date"><strong>작성일: </strong>
							<fmt:formatDate value="${list.wiRegDate}" pattern="yyyy-MM-dd" /></span>
							<br>
							<p class="comment">
								<strong>소감한마디 : </strong><span></span>
							</p>
						</div>
						<div class="action">
							<a class="btn_common mid" href="1detail?wiIndex=${list.wiIndex}">${list.memberId}
								인터뷰 보기</a>
						</div>
						</li>


				</c:forEach>
			</ul>
		</div>
		<div class="paginate_common" id="page_box">
			<div class="btn_common form write">
				<a
					href="${pageContext.request.contextPath }/admin/winner_interview/1insertform">글쓰기</a>
			</div>

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
</main>