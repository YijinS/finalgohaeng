<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="EUC-KR">
<title>회차별 당첨번호 출력 &lt; 회차별 당첨번호 &lt; 로또 6/45 &lt; 당첨결과 | 동행복권</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="format-detection" content="telephone=no">
<title>고행복권</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/images/goheang_ico.ico" type="image/x-icon">
<link rel="icon" href="${pageContext.request.contextPath }/resources/images/goheang_ico.ico" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/styles.css?ver=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/page.css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-1.9.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/page.css" />
<style type="text/css">
html,body {height:auto; background:none; overflow:hidden; overflow-y:auto}
body {overflow:auto}
</style>
<script>
var pageCode = "03-01-03";
var pageName = "당첨내역";
</script>
</head>
<body>
<div class="popup_wrap_common popup_print_winnum_645">
	<h1>로또 회차별 당첨번호</h1>
	<p class="range">${save.start }회 ~ ${save.end }회차</p>
	<table class="tbl_data tbl_data_col">
		<caption>회차별 당첨번호, 보너스번호, 1위 당첨자수 및 1위 당첨자 1인당 당첨금액 안내</caption>
		<colgroup>
			<col style="width:100px">
			<col style="width:220px">
			<col style="width:90px">
			<col style="width:130px">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">회차</th>
				<th scope="col">로또 당첨번호</th>
				<th scope="col">보너스</th>
				<th scope="col">추첨일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="tmp" items="${games }">
			<fmt:formatDate var="drawDate" value="${tmp.drawDate }" pattern="yyyy-MM-dd"/>
				<tr>
					<td>${tmp.games }</td>
					<td>
						<c:forEach begin="0" end="5" varStatus="vs" step="1">

						<fmt:parseNumber var="num"
							value="${fn:substring(tmp.winningNum,vs.index*2,vs.count*2) }" />
						<c:choose>
							<c:when test="${num lt 11 }">
								<span class="ball_645 sml ball1">${num }</span>
							</c:when>
							<c:when test="${num lt 21 }">
								<span class="ball_645 sml ball2">${num }</span>
							</c:when>
							<c:when test="${num lt 31 }">
								<span class="ball_645 sml ball3">${num }</span>
							</c:when>
							<c:when test="${num lt 41 }">
								<span class="ball_645 sml ball4">${num }</span>
							</c:when>
							<c:otherwise>
								<span class="ball_645 sml ball5">${num }</span>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					</td>
					<td>
						<c:choose>
							<c:when test="${tmp.bonusNum lt 11 }">
								<span class="ball_645 sml ball1">${tmp.bonusNum }</span>
							</c:when>
							<c:when test="${tmp.bonusNum lt 21 }">
								<span class="ball_645 sml ball2">${tmp.bonusNum }</span>
							</c:when>
							<c:when test="${tmp.bonusNum lt 31 }">
								<span class="ball_645 sml ball3">${tmp.bonusNum }</span>
							</c:when>
							<c:when test="${tmp.bonusNum lt 41 }">
								<span class="ball_645 sml ball4">${tmp.bonusNum }</span>
							</c:when>
							<c:otherwise>
								<span class="ball_645 sml ball5">${tmp.bonusNum }</span>
							</c:otherwise>
						</c:choose>
					</td>
					<td>${drawDate }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<ul class="note_result_search bottom">
		<li>복권은 소액으로 건전하게 즐기세요.</li>
		<li><span class="color_key1">*</span> 1인당 1회 10만원까지 구입할 수 있습니다. </li>
		<li><span class="color_key1">*</span> 만 19세 이상만 복권을 구입할 수 있고 당첨금을 받을 수 있습니다. </li>
	</ul>
</div>
<script>
window.print();
</script>
</body>
</html>
