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
			<a href="${pageContext.request.contextPath }/admin/index"> 
			<img src="${pageContext.request.contextPath }/resources/images/index/logo-footer-w.png" alt="고행복권"
				style="width: 98px; margin-top: -19px; margin-left: 35px; border: 0px;">
			</a>
		</h1>
		<ul class="util" id="gnb">

			<li class="shop"><a href="#none">메뉴1</a> </li>

			<li class="setting"><a href="/disp/admin/shop1/Mode/Setting">메뉴2</a></li>
		</ul>
		<div class="member ec-influencer-gnb-member">
			<strong class="name"><span class="icoUser"></span>관리자님</strong>
			<button type="button" class="btnMore eClick">회원정보 보기</button>
			<div class="dropLayer ec-influencer-gnb-member-info"
				style="display: none">
				<div class="userInfo">
					<span class="icoUser"></span> <strong class="mall">GoHaeng</strong>
					<span class="user">관리자님</span>
				</div>
				<div class="button">
					<a href="/disp/admin/shop1/Mode/SettingStore">내쇼핑몰정보</a> <a
						href="/admin/php/shop1/log_out.php">로그아웃</a>
				</div>
				<button type="button" class="btnClose eClose">닫기</button>
			</div>
		</div>
		<div class="add ec-influencer-gnb-add-menu-area">
			<button type="button"
				class="btnMore eClick ec-influencer-gnb-more-view">더보기</button>
			<div class="dropLayer ec-influencer-gnb-add-menu"
				style="display: none">
				<div class="divide">
					<strong class="title">바로가기</strong>
					<ul class="link">
						<li><a href="https://ecsupport.cafe24.com/" target="_blank">자주
								묻는 질문</a></li>
						<li><a
							href="https://service-api.echosting.cafe24.com/Shopboard/index.php?bbs_no=5&amp;country_code=KR"
							target="_blank">공지사항</a></li>
						<li><a
							href="/admin/php/shop1/AutoLogin/request.php?uri=https%3A%2F%2Fechosting.cafe24.com%2FCs%2F%3Furl%3DCsboard%26userid%3Dneomart%26loginid%3Dneomart"
							target="_blank">1:1 문의</a></li>
						<li><a
							href="https://store.cafe24.com/common/auth?mall_id=neomart&amp;menu_id=1&amp;language=ko"
							target="_blank">앱스토어</a></li>
						<li><a
							href="/admin/php/shop1/AutoLogin/request.php?uri=https%3A%2F%2Fechosting.cafe24.com%2F"
							target="_blank">쇼핑몰센터</a></li>
						<li><a
							href="/admin/php/shop1/AutoLogin/request.php?menu_code=9&amp;uri=http://cmc.cafe24.com"
							target="_blank">마케팅센터</a></li>
						<li><a href="http://edu.cafe24.com" target="_blank">교육센터</a></li>
						<li><a href="https://d.cafe24.com/home/home_main.php"
							target="_blank">디자인센터</a></li>
					</ul>
				</div>
				<div class="divide">
					<strong class="title">편의기능</strong>
					<ul class="link">
						<li><a href="#none" class="link" onclick="addFavorite();">즐겨찾기 추가</a></li>
						<li><a href="#none" class="link" onclick="shop_admin_icon();">바탕화면 추가</a></li>
					</ul>
				</div>
			</div>
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