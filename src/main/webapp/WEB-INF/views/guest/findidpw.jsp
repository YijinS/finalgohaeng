<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="body">
	<div class="containerWrap">
		<!-- pc일 경우 컨텐츠 영역 감싸는 마크업 추가  -->
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
						<form action="findid" method="post">
							<div class="find_what">
								<div class="set id">
									<h4>아이디 찾기</h4>
									<p class="desc">
										아이디는 회원가입시 입력한 이름과 이메일을 <br>통해 확인하실 수 있습니다.
									</p>
									<div class="mid">
										<label for="idenUserId">이름</label><input type="text" size="10"
											name="name" id="name"><br /> <label for="idenUserId">이메일</label><input
											type="text" size="10" name="email" id="email"> <input
											class="btn_common lrg blu" type="submit" value="확인" />
									</div>
								</div>
						</form>
						<form action="findpw"  method="post">
							<div class="set pass">
								<h4>비밀번호 찾기</h4>
								<p class="desc">
									회원가입시 입력한 정보와 일치하면 <br>임시 비밀번호를 이메일로 보내드립니다.
								</p>
								<div class="mid">
									<label for="idenUserId">아이디</label><input type="text" size="10"
										name="id" id="id"> <label for="idenUserId">이메일</label><input
										type="text" size="10" name="email" id="email"> <input
										class="btn_common lrg blu" type="submit" value="확인" />
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
	</div>
	</section>
</div>
</div>