<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="header">

	<div class="header">
		<h1 class="logo">
			<a href="${pageContext.request.contextPath }/admin/"> <img
				src="${pageContext.request.contextPath }/resources/images/index/logo-footer-w.png"
				alt="고행복권"
				style="vertical-align: middle; width: 98px; margin-top: -39px; margin-left: 35px; border: 0px;">
			</a>
		</h1>
		<ul class="util" id="gnb">
			<li class="shop"><a href="${pageContext.request.contextPath}/">고행 홉페이지</a></li>
		</ul>
		<div class="member ec-influencer-gnb-member">
		<c:choose>
                  <c:when test="${empty sessionScope.member }">
                      <script>location.href = "${pageContext.request.contextPath}/"; </script>
	                  <ul class="util" id="gnb">
	                     <li class="shop"><a href="${pageContext.request.contextPath }/guest/login">로그인</a></li>
	                  </ul>                  
                  </c:when>
                  <c:otherwise>
                  <ul class="util" id="gnb">
                     <c:choose>
                        <c:when test="${sessionScope.member.id eq 'ADMIN' }">
                           <strong class="setting"><span class="icoUser"></span>관리자님</strong>
                    	   <li class="setting"><a href="${pageContext.request.contextPath }/guest/logout">로그아웃</a></li>
                        </c:when>
                        <c:when test="${sessionScope.member.id ne 'ADMIN'}">
                        	<script>alert('ADMIN 계정이 아닙니다. 다시 로그인해주세요');</script>
                        	<% session.invalidate(); %> 
                        	<script>location.href = "${pageContext.request.contextPath}/"; </script>
                        </c:when>
                     </c:choose>
                  </ul>
               </c:otherwise>
			</c:choose>
			
		</div>
	</div>

</div>