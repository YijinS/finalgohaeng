<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<aside id="asideQuick" class="quick_aside fold">
	<a href="#" class="toggle">"퀵메뉴열기"</a>
	<div class="inner">
		<c:choose>
			<c:when test="${not empty sessionScope.member.id}">
				<ul>
					<li id="chatting"><a id="chatting" 
						onclick="window.open(this.href, '_blanck', 'width=600, height=700'); return false"
						href="${pageContext.request.contextPath}/chatting" title="새창">
							<img src="https://image.flaticon.com/icons/svg/1256/1256649.svg"
							alt="" style="width: 50px; heigth: 50px" />
					</a></li>
				</ul>
			</c:when>
		</c:choose>
		<ul class="prog">
			<li class="p1"><a href="${pageContext.request.contextPath }/purchase/lotto645">복권<br>구매하기
			</a></li>
			<li class="p2"><a href="${pageContext.request.contextPath }/user/store/1">판매점<br>조회
			</a></li>
			<li class="p3"><a href="${pageContext.request.contextPath }/gameresult/lotto645/1">최근 당첨<br>번호보기
			</a></li>
			<li class="p4"><a href="${pageContext.request.contextPath }/gameresult/lottostat/1">통계 보기
			</a></li>
		</ul>
	</div>
	<div class="top">
		<a class="#">위로가기</a>
	</div>
</aside>
<script>
var chatting = document.getElementById('chatting');
chatting.on("click", function(){
	alert("chatting");
})



</script>
<script type="text/javascript">
	$(document).ready(function() {
		var spread;
		var min4quick = 1420;
		var bodyw = $("body").prop("clientWidth");
		var aside = $("#asideQuick");
		var btn = aside.find(".toggle");
		$(window).resize(function() {
			bodyw = $("body").prop("clientWidth");
			if (bodyw < min4quick) {
				aside.css("right", "-86px");
				aside.addClass("fold");
				spread = false;
			} else {
				aside.css("right", "0");
				aside.removeClass("fold");
				spread = true;
			}
		}).resize();
		btn.click(function(e) {
			e.preventDefault();
			if (spread == true) {
				aside.animate({
					right : -86
				}, 300);
				btn.removeClass("opened");
				spread = false;
			} else {
				aside.animate({
					right : 0
				}, 300);
				btn.addClass("opened");
				spread = true;
			}

		});
	});
</script>