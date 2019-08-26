<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="body">
	<div class="containerWrap">
		<section class="contentSection">
			<nav class="lnbNav">
				<div id="snb" class="lnb">
					<h2 id="09" class="lnb_title">회원서비스</h2>
					<ul id="lnb" class="lnb_dep1">
						<li id="09-01"><a href="/user.do?method=login"
							class="menuLnb"><span>로그인</span></a></li>
						<li id="09-02" class="active"><a
							href="/customer.do?method=findIdPw" class="menuLnb"><span>아이디/비밀번호
									찾기</span></a></li>
						<li id="09-03"><a href="/loginJoin.do?method=joinFormAgree"
							class="menuLnb"><span>회원가입</span></a></li>
					</ul>
				</div>

			</nav>
			<!-- 컨텐츠 영역 -->
			<div id="article" class="contentsArticle">
				<div class="header_article">
					<h3 class="sub_title">아이디/비밀번호 찾기</h3>
					<p class="location">
						<a class="home" href="/"> Home </a><span class="gt">&gt;</span><a
							href="/user.do?method=login">회원서비스</a><span class="gt">&gt;</span><a
							href="/customer.do?method=findIdPw">아이디/비밀번호 찾기</a>
					</p>
				</div>
				<div>
					<div class="content_wrap content_find_idpass">
						<div class="box_result_find">
							<c:choose>
								<c:when test="${id ne 'none'}">
									<div class="print">
										<p>
											${name}님의 아이디는 <strong>${id}</strong> 입니다.
										</p>
									</div>
								</c:when>
								<c:otherwise>
									<div class="print">
										<p>
										회원정보가<strong>존재하지않습니다.</strong>
										</p>
									</div>
								</c:otherwise>
							</c:choose>
							<p class="copy">복권은 우리모두의 행복후원권 입니다. 건전한 복권 즐기기를 생활화 하세요.</p>
							<div class="btns">
								<a class="btn_common lrg"
									href="${pageContext.request.contextPath }/guest/login">로그인페이지
									이동</a> <a class="btn_common lrg"
									href="${pageContext.request.contextPath }/guest/findidpw">비밀번호
									찾기</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
</div>