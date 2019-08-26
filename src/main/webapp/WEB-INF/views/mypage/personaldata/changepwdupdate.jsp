<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${exist eq 'ok'}">
			<script>
				alert("비밀번호가 수정되었습니다.");
				location.href = "${pageContext.request.contextPath}/mypage/home";
			</script>
		</c:when>
		<c:otherwise>
			<script>
				alert("비밀번호가 존재하지않습니다.");
				location.href = "${pageContext.request.contextPath}/mypage/personaldata/modifylogin";
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>