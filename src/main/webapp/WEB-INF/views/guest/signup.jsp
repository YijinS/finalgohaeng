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
						<li id="09-01" class="active"><a href="#" class="menuLnb"><span>로그인</span></a></li>
						<li id="09-02"><a href="#" class="menuLnb"><span>아이디/비밀번호
									찾기</span></a></li>
						<li id="09-03"><a href="#" class="menuLnb"><span>회원가입</span></a></li>
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
				<form method="post" id="test">
					<input type="text" name="id"/>
					<a href="#">click</a>	
				</form>
				<style>
					.dn{display: none;}
					.yes{color: greenyellow}
					.no{color: red}
				</style>
			<div id="pwd">
				<input type="password" name="pwd">
				<input type="password" name="pwd2"><span class="dn"></span>
			</div>

				<script>
					window.addEventListener("load",function(){
						var section = document.querySelector("#pwd");
						var pwd = section.querySelector("input[name=pwd]");
						var pwd2 = section.querySelector("input[name=pwd2]");

						var span = section.querySelector("span");
						pwd2.oninput = function(){
							span.classList.remove("dn"); 
							if(pwd.val == pwd2.val){
								span.classList.remove("no"); 
								span.innerText = "일치합니다";
								span.classList.add("yes");
							}
							else{
								span.classList.remove("yes"); 
								span.innerText = "불일치합니다";
								span.classList.add("no");
							}

						}
					});

					$(function(){
						var btn = $("#test a");
						var input = $("#test input")
						btn.click(function(){
							var id = input.val();
							$.getJSON("${pageContext.request.contextPath}/guest/ajax?id="+id,function(data){
								var isExist = data.usedId;
								if(isExist)
									alert(id+"아이디가 존재합니다");
								else
									alert("사용가능합니다");
							});
							

							//alert(id);
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