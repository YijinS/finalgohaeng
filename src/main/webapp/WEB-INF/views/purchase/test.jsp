<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="body">
	<div class="containerWrap">
		<section class="contentSection">
			<!-- ----------왼쪽메뉴---------- 영역 -->
			<nav class="lnbNav">

				<div id="snb" class="lnb">
					<h2 id="01" class="lnb_title">복권구매</h2>
					<ul id="lnb" class="lnb_dep1">
						<li id="01-01" class="active">
							<a href="#" class="menuLnb"><span>로또 6/45 구매</span></a>
						</li>
						<li id="01-02">
							<a href="#" class="menuLnb"><span>연금복권 520 구매</span></a>
						</li>
					</ul>
				</div>

			</nav>
			<!-- -------------------------------------- -->
			<!-- ----------메인컨텐츠---------- 영역 -->
			<main id="article" class="contentsArticle">
				<form method="post">
					<input type="text" name="num1" value="010408091517" />
					<input type="text" name="method1" value="1" />
					<input type="text" name="num2" value="020408091517" />
					<input type="text" name="method2" value="1" />
					<input type="text" name="num3" value="030408091517" />
					<input type="text" name="method3" value="1" />
					
					<input type="submit" value="클릭"/>
				</form>
			</main>
			<!-- -------------------------------------- -->

		</section>
	</div>
</div>
