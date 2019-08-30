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

			<li class="shop"><a href="#none">메뉴1</a> <!-- <div class="dropLayer">
                <div class="mall">
                    <a href="/admin/php/shop1/m/goto_front.php" target="_blank" class="btnPc">PC쇼핑몰 바로가기</a>
                    <a href="/admin/php/shop1/m/goto_front.php?type=mobile" target="_blank" class="btnMobile">모바일쇼핑몰 바로가기</a>
                </div>
            </div> --></li>

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
						<li><a
							href="https://service-api.echosting.cafe24.com/Shopboard/index.php?bbs_no=5&amp;country_code=KR"
							target="_blank">공지사항</a></li>
						<li><a
							href="/admin/php/shop1/AutoLogin/request.php?uri=https%3A%2F%2Fechosting.cafe24.com%2FCs%2F%3Furl%3DCsboard%26userid%3Dneomart%26loginid%3Dneomart"
							target="_blank">1:1 문의</a></li>
						<li><a href="https://ecsupport.cafe24.com/" target="_blank">자주 묻는 질문</a></li>
						<li><a href="https://store.cafe24.com/common/auth?mall_id=neomart&amp;menu_id=1&amp;language=ko"
							target="_blank">앱스토어</a></li>
						<li><a href="/admin/php/shop1/AutoLogin/request.php?uri=https%3A%2F%2Fechosting.cafe24.com%2F"
							target="_blank">쇼핑몰센터</a></li>
						<li><a shref="/admin/php/shop1/AutoLogin/request.php?menu_code=9&amp;uri=http://cmc.cafe24.com"
							target="_blank">마케팅센터</a></li>
						<li><a href="http://edu.cafe24.com" target="_blank">교육센터</a></li>
						<li><a href="https://d.cafe24.com/home/home_main.php"
							target="_blank">디자인센터</a></li>
					</ul>
				</div>
				<div class="divide">
					<strong class="title">편의기능</strong>
					<ul class="link">
						<li><a href="#none" class="link" onclick="addFavorite();">즐겨찾기
								추가</a></li>
						<li><a href="#none" class="link" onclick="shop_admin_icon();">바탕화면
								추가</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

</div>