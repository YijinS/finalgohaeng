<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
var userEmail = '${email}';
alert(userEmail + '로 이메일이 발송되었습니다. 인증확인을 해주세요.');
</script>
<div class="body">
	<div class="containerWrap">
		<section class="contentSection">

			<div id="article" class="contentsArticle">
				<div class="header_article">
					<h3 class="sub_title">회원가입완료</h3>
					<p class="location">
						<a class="home" href="/"> Home </a><span class="gt">&gt;</span><a
							href="/user.do?method=login">회원서비스</a><span class="gt">&gt;</span><a
							href="/loginJoin.do?method=joinFormAgree">회원가입</a>
					</p>
				</div>

				<div>
					<div class="content_wrap content_join_complete">
						<!-- -------------------------------------------------------------------------------------- -->

						<div class="box_complete">
							<p>회원가입이 완료되었습니다.</p>
							<p>
								희망은 나눔이 되고, 나눔은 행복이 됩니다.<br>건전한 복권 즐기기를 생활화 하세요.
							</p>
							<div class="btns_submit">
								<a class="btn_common lrg" href="/payment.do?method=payment">충전하기</a>
								<a class="btn_common lrg blu" href="/common.do?method=main">메인으로
									이동</a>
							</div>
						</div>

						<!-- -------------------------------------------------------------------------------------- -->
					</div>
				</div>
			</div>
		</section>
	</div>
</div>
