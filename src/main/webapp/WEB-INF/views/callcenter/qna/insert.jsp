<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="body">
	<div class="containerWrap"><!-- pc일 경우 컨텐츠 영역 감싸는 마크업 추가  -->
	



<!--내용-->
<section class="contentSection">
	<!--왼쪽-->
	<nav class="lnbNav">
		<!-- left menu include -------------->
		<div id="snb" class="lnb">
	<h2 id="08" class="lnb_title">고객센터</h2>
	<ul id="lnb" class="lnb_dep1">
		<li id="08-01"><a href="/counsel.do?method=callCenter" class="menuLnb"><span>고객센터 안내</span></a>
		</li>
		<li id="08-02"><a href="/counsel.do?method=faq" class="menuLnb"><span>자주 묻는 질문</span></a>
		</li>
		<li id="08-03" class="active"><a href="/counsel.do?method=myCounselList" class="menuLnb"><span>1:1상담</span></a>
		</li>
		<li id="08-06"><a href="/counsel.do?method=mobileLotto" class="menuLnb"><span>모바일 동행복권 </span></a></li>
		<li id="08-04"><a href="/counsel.do?method=winnerGuide" class="menuLnb"><span>사용자 가이드</span></a>
			<ul class="lnb_dep2" style="display: none;">
				<li id="08-04-01"><a href="/counsel.do?method=winnerGuide"><span>당첨자 가이드 </span></a></li>
				<li id="08-04-02"><a href="/counsel.do?method=playerGuide"><span>이용자 가이드 </span></a></li>
				<!-- <li id="08-04-03"><a href="/counsel.do?method=movieGuide"><span>이용안내 동영상 </span></a></li> -->
			</ul>
		</li>
<!-- 		<li id="08-05"><a href="/counsel.do?method=knowledge" class="menuLnb"><span>자료실</span></a> -->
<!-- 			<ul class="lnb_dep2"> -->
<!-- 				<li id="08-05-01"><a href="/counsel.do?method=knowledge"><span>복권바로알기 </span></a></li> -->
<!-- 			</ul> -->
<!-- 		</li> -->
	</ul>
</div>

		<!-- ----------------------------- -->
	</nav>
	<!-- 컨텐츠 영역 -->
	<div id="article" class="contentsArticle">
		<div class="header_article">
			<h3 class="sub_title">1:1 상담</h3>
			<p class="location"> <a class="home" href="/"> Home </a><span class="gt">&gt;</span><a href="/counsel.do?method=callCenter">고객센터</a><span class="gt">&gt;</span><a href="/counsel.do?method=myCounselList">1:1상담</a> </p>
		</div>
		<div>
			<div class="content_wrap content_1on1_counsel">
			<!-- -------------------------------------------------------------------------------------- -->
				
				<div class="box_complete">
					<p class="comp">1:1 상담내역이 정상적으로 접수되었습니다.</p>
					<p>회원님께서 신청하신 내용은 검토 후 빠른 시일안에 답변드리겠습니다.</p>
				</div>
				<div class="btns_submit search">
					<a class="btn_common mid" href="${pageContext.request.contextPath}/callcenter/info">고객센터 메인으로 이동</a>
					<a class="btn_common mid" href="${pageContext.request.contextPath}/callcenter/qna/list">내 상담목록</a>
				</div>
				
				 
			<!-- -------------------------------------------------------------------------------------- -->
			</div>
		</div>
	</div>
</div>
</div>