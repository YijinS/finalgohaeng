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

				<!-- ----------------------------- -->
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
						<!-- -------------------------------------------------------------------------------------- -->


						<div class="box_result_find">
							<c:choose>
								<c:when test="${not empty dto}">
									<div class="print">
										<p>
											${email}로 <strong>임시 비밀번호가 발급</strong>됩니다.
										</p>
									</div>

									<p class="copy">
										발급 받으신 임시 비밀번호로 로그인한 후 반드시<br> <strong>[마이페이지&gt;개인정보&gt;비밀번호
											변경]</strong>에서 비밀번호를 변경하시기 바랍니다.
									</p>
								</c:when>
								<c:otherwise>
									<div class="print">
										<p>
											아이디 또는 이메일이<strong>존재하지않습니다.</strong>
										</p>
									</div>

									<p class="copy">회원가입시 입력한 아이디와 이메일을 입력해주세요.</p>
								</c:otherwise>
							</c:choose>
							<div class="btns">
								<a class="btn_common lrg"
									href="${pageContext.request.contextPath }/guest/login">로그인페이지
									이동</a> <a class="btn_common lrg"
									href="${pageContext.request.contextPath }/guest/findidpw">아이디
									찾기</a>
							</div>
						</div>
						<p class="prgrp_common prgrp_note">비밀번호 재발급을 받지 못하신 경우에는
							고객센터(1588-6450)로 문의하여 주시기 바랍니다.</p>

						<!-- -------------------------------------------------------------------------------------- -->
					</div>
				</div>
			</div>
		</section>
	</div>
</div>