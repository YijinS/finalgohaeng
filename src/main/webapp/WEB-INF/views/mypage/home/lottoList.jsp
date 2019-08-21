<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html style="overflow:hidden;">
<head>
<meta charset="UTF-8">
<title>로또구매내역</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/styles.css?ver=1">
</head>
<body>
	<!-- 팝업 사이즈 가로 360 세로 560 스크롤 no -->
	<div id="popup645paper" class="popup-645paper">
		<h2>인터넷 로또 6/45 구매번호</h2>
		<div class="date-info">
			<h3>
				<span>복권 로또 645</span><strong>제 ${lottoGames.games }회</strong>
			</h3>
			<fmt:formatDate var="drawDate" value="${lottoGames.drawDate }" pattern="yyyy/MM/dd (E)"/>
			<fmt:formatDate var="paymentDate" value="${lottoGames.paymentDate }" pattern="yyyy/MM/dd (E)"/>
			<fmt:formatDate var="issue" value="${issueDate }" pattern="yyyy/MM/dd (E) HH:mm:ss"/>
			
			<ul>
				<li><span>발 행 일</span> : ${issue }</li>
				<li><span>추 첨 일</span> : ${drawDate }</li>
				<li><span>지급 기한</span> : ${paymentDate }</li>
			</ul>
			<p class="barcode">
				<span>50055</span> <span>60451</span> <span>20826</span> <span>98652</span>
				<span>13168</span> <span>33021</span>
			</p>
		</div>
		<div class="selected">
			<ul>
				<li>
					<c:forTokens var="test" items="A,B,C,D,E" delims="," varStatus="vs">
						<c:if test="${not empty lottoList[vs.index] }">
							<c:set var="lotto" value="${lottoList[vs.index] }" />
							<strong>
							<span>${test }</span>
								<c:choose>
									<c:when test="${lotto.method eq 1 }">
										<span>자동</span>
									</c:when>
									<c:when test="${lotto.method eq 2 }">
										<span>수동</span>
									</c:when>
									<c:otherwise>
										<span>반자동</span>								
									</c:otherwise>				
								</c:choose>
							</strong>
							<div class="nums">
								<c:forEach begin="0" end="5" varStatus="i">
									<fmt:parseNumber var="num" value="${fn:substring(lotto.num,i.index*2,i.count*2) }" />
									<span><span>${num }</span></span>
								</c:forEach>
							</div>
						</c:if>
					</c:forTokens>
				</li>
			</ul>
			<div class="total">
				<strong>당첨금액 합계</strong><strong><span class="won">\</span>0</strong>
			</div>
		</div>
		<div class="btns">
			<!-- <a class="btn_common mid" href="#" onclick="print(); return false;" title="새창 열림">인쇄</a> -->
			<a class="btn_common mid" href="#" onclick="self.close()">닫기</a>
		</div>
	</div>

	<div id="divGetScrollbarWidth"
		style="position: absolute; left: -100px; top: -500px; width: 300px; height: 350px; overflow: auto">
		<div style="height: 400px"></div>
	</div>
</body>
</html>