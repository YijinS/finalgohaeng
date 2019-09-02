<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="body">
	<div class="containerWrap">
		<section class="contentSection">
			<!-- ----------왼쪽메뉴---------- 영역 -->
			<nav class="lnbNav">

				<div id="snb" class="lnb">
					<h2 id="09" class="lnb_title">회원서비스</h2>
					<ul id="lnb" class="lnb_dep1">
						<li id="09-01" class="active"><a href="${pageContext.request.contextPath }/guest/login" class="menuLnb"><span>로그인</span></a></li>
						<li id="09-02"><a href="#" class="menuLnb"><span>아이디/비밀번호
									찾기</span></a></li>
						<li id="09-03"><a href="${pageContext.request.contextPath }/guest/signup" class="menuLnb"><span>회원가입</span></a></li>
					</ul>
				</div>

			</nav>
			<!-- -------------------------------------- -->
			<!-- ----------메인컨텐츠---------- 영역 -->
			<main id="article" class="contentsArticle">
			<div class="header_article">
				<h3 class="sub_title">로그인</h3>
				<p class="location">
					<a class="home" href="#">Home</a> <span class="gt">></span> <a
						href="#">회원서비스 </a> <span class="gt">></span> <a href="#">로그인</a>
				</p>
			</div>

			<div class="content_wrap">
				<form id="login_form" method="POST">
					<input type="hidden" name="returnUrl" value="">
					<div class="box_login">
						<div class="inner">
							<fieldset>
								<legend>
									<strong>LOGIN</strong>
								</legend>
								<div id="input_form" class="form">
									<input type="text" maxlength="15" name="id" id="userId" autocomplete="off" placeholder="아이디"> 
									<input type="password" maxlength="100" name="pwd" placeholder="비밀번호"> 
									<a id="login_button" class="btn_common lrg blu" href="#">로그인</a>
								</div>

								<input id="checkSave" name="checkSave" type="checkbox" checked="">
								<label for="checkSave">ID저장</label>

								<div class="links">
									<a class="btn_common lrg" href="${pageContext.request.contextPath }/guest/signup.do">회원가입</a> 
									<a class="btn_common lrg" href="${pageContext.request.contextPath }/guest/findidpw">아이디/비밀번호찾기</a>
								</div>
							</fieldset>
						</div>
						<div class="inFootTxt">
							<p>본 사이트는 Internet Explorer 11, Edge, Chrome, Safari 브라우저에
								최적화되어 있습니다.</p>
						</div>
					</div>
					<input type="hidden" name="url" value="${url }"/>
				</form>
				<script>
					$(function(){
						var button = $("#login_button");
						var id = $("#input_form").find("input[name=id]");
						var pwd = $("#input_form").find("input[name=pwd]");
							button.click(function(){
								$.ajax({
									url:'${pageContext.request.contextPath }/guest/loginCheck',
									type:'post',
									data:{
										"id":id.val(),
										"pwd":pwd.val()
									},
									success:function(data){
										if(data.check == true){
												$("#login_form").submit();
										}
										else
											alert("아이디 또는 비밀번호가 틀렸습니다.");
									}
								
								});
						});
					});
				</script>
			</div>
			</main>
			<!-- -------------------------------------- -->
		</section>
	</div>
</div>
<!-- ----------------------------------------------------- -->