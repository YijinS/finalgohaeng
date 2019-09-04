<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="body">
	<div class="containerWrap">
		<!-- pc일 경우 컨텐츠 영역 감싸는 마크업 추가  -->




		<!--내용-->
		<section class="contentSection">
			<!--왼쪽-->
			<nav class="lnbNav">
				<div id="snb" class="lnb">
					<h2 id="08" class="lnb_title">고객센터</h2>
					<ul id="lnb" class="lnb_dep1">
						<li id="08-01"><a href="${pageContext.request.contextPath }/callcenter/info" class="menuLnb"><span>고객센터 안내</span></a></li>
						<li id="08-02"><a href="${pageContext.request.contextPath }/callcenter/faq/all" class="menuLnb"><span>자주 묻는 질문</span></a></li>
						<li id="08-03" class="active"><a href="${pageContext.request.contextPath }/callcenter/qna/list" class="menuLnb"><span>1:1상담</span></a></li>
						<li id="08-06"><a href="${pageContext.request.contextPath }/callcenter/mobilelotto" class="menuLnb"><span>모바일 동행복권 </span></a></li>
						<li id="08-04"><a href="${pageContext.request.contextPath }/callcenter/userguide/winner" class="menuLnb"><span>사용자 가이드</span></a>
							<ul class="lnb_dep2" style="display: none;">
								<li id="08-04-01"><a href="#"><span>당첨자 가이드 </span></a></li>
								<li id="08-04-02"><a href="#"><span>이용자 가이드 </span></a></li>
							</ul></li>
					</ul>
				</div>
			</nav>
			<!-- 컨텐츠 영역 -->
			<div id="article" class="contentsArticle">
				<div class="header_article">
					<h3 class="sub_title">1:1 상담</h3>
					<p class="location">
						<a class="home" href="/"> Home </a><span class="gt">&gt;</span><a
							href="/counsel.do?method=callCenter">고객센터</a><span class="gt">&gt;</span><a
							href="/counsel.do?method=myCounselList">1:1상담</a>
					</p>
				</div>
				<div>
					<div class="content_wrap content_1on1_counsel">
						<!-- -------------------------------------------------------------------------------------- -->
						<form id="Frm" name="Frm" method="post" action="delete">
							<input type="hidden" id="inq_seq" name="inq_seq" value="56872">
							<table class="tbl_data">
								<caption>내 상담 내용과 답변 내용을 확인합니다.</caption>
								<colgroup>
									<col style="width: 110px">
									<col>
								</colgroup>
								<thead>
									<tr>
										<th scope="row">분류</th>
										<td>${dto.category}</td>
									</tr>
									<tr>
										<th scope="row">처리현황</th>
										<c:choose>
											<c:when test="${not empty dto.reply}">
												<td>답변완료</td>
											</c:when>
											<c:when test="${empty dto.reply}">
												<td>답변대기</td>
											</c:when>
										</c:choose>
									</tr>
									<tr>
										<th scope="row">제목</th>
										<td>${dto.title}</td>
									</tr>
									<tr>
										<th scope="row">내용</th>
										<td>${dto.content}</td>
									</tr>
									<c:if test="${not empty dto.reply}">
										<tr>
											<th scope="row">답변내용</th>
											<td>${dto.reply}</td>
										</tr>
									</c:if>
								</thead>
							</table>
						</form>
						<div class="btns_submit search">
							<c:if test="${empty dto.reply}">
								<a class="btn_common mid blu" href="update?index=${dto.index}">수정</a>
							</c:if>
							<a class="btn_common mid" onclick="Del();"
								href="delete?index=${dto.index}">삭제</a> <a
								href="${pageContext.request.contextPath}/callcenter/qna/list"
								class="btn_common mid">내 상담목록</a>
						</div>

						<script>
							function Del() {
								if (!confirm("해당내용을 삭제하겠습니까?")) {
									return;
								}
							}
						</script>
						<!-- -------------------------------------------------------------------------------------- -->
					</div>
				</div>
			</div>
	</div>
</div>