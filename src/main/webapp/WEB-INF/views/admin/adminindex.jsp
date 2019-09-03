<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 인덱스 페이지</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/images/goheang_ico.ico" type="image/x-icon">
<link rel="icon" href="${pageContext.request.contextPath }/resources/images/goheang_ico.ico" type="image/x-icon">
<script src="<c:url value="/js/jquery-3.1.0.min.js"/>"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/common.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/contents.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/page.css" />

<style>
html, body { margin: 0px;padding: 0px;} 
body > div {position: relative;}
#menu-wrapper { display: flex; justify-content: center;}
.first-line{ margin-top: 100px; }

#header {position: static;}
.menu {

   	margin-left: 50px;
    margin: 10px;
    padding: 100px;
    padding-top: 50px;
    display: inline-block;
    width: 100px;
    height: 100px;
    border: 1px solid #afa2a2;
    background: white;
    
}

.menu:hover{
	box-shadow:inset 0 2px 45px #ddd;

}

img{
	display: inherit;
	width: 120%;
	float: left;
	/* heigth: 50%; */

}
</style>

</head>

<body>
<div>
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
                        <c:when test="${sessionScope.member.id ne 'ADMIN' || empty sessionScope.member}">
                        	<script>alert('ADMIN 계정이 아닙니다. 다시 로그인해주세요');</script>
                        	<% session.invalidate(); %> 
                        	  <script>location.href = "${pageContext.request.contextPath}/"; </script>
                        	 <li class="shop"><a href="${pageContext.request.contextPath }/guest/login">로그인</a></li>
                        </c:when>
                     </c:choose>
                  </ul>
               </c:otherwise>
			</c:choose>
			
		</div>
	</div>

</div>
<!-- --------------------------- header end  --------------------------------------------------------->
<!-- --------------------------- main  --------------------------------------------------------->
<div id="menu-wrapper">
	<div class="first-line">
		<a href="${pageContext.request.contextPath }/admin/notice/list">
		<div class="menu">
		<img src="https://image.flaticon.com/icons/svg/0/535.svg" alt=""/>
		<strong>공지사항</strong>
		</div>
		</a>
		
		<a href="${pageContext.request.contextPath }/admin/callcenter/qna/list">
		<div class="menu">
		<img src="https://image.flaticon.com/icons/svg/1987/1987915.svg" alt=""/>
		<strong>질문</strong>
		</div>
		</a>
		
		<a href="${pageContext.request.contextPath }/admin/event/list">
		<div class="menu">
		<img src="https://image.flaticon.com/icons/svg/839/839888.svg" alt=""/>
		<strong>이벤트</strong>
		</div>
		</a>
		
		<br>
		<a href="${pageContext.request.contextPath }/admin/winner_interview/1">
		<div class="menu">
		<img src="https://image.flaticon.com/icons/svg/942/942798.svg" alt=""/>
		<strong>당첨자 인터뷰</strong>
		</div>
		</a>
		
		<a href="${pageContext.request.contextPath }/admin/store/1">
		<div class="menu">
		<img src="https://image.flaticon.com/icons/svg/126/126122.svg" alt=""/>
		<strong>판매점</strong>
		</div>
		</a>
		
		<a href="${pageContext.request.contextPath }/admin/drawshow/lotto/list">
		<div class="menu">
		<img src="https://image.flaticon.com/icons/svg/1986/1986424.svg" alt=""/>
		<strong>참관신청</strong>
		</div>
		</a>
		
		
	</div>


</div>
</div>
</body>
</html>