<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<main>
<script>
	alert("삭제되었습니다.");
	//javascript 를 이용해서 redirect 이동 시키기 
	location.href="${pageContext.request.contextPath}/admin/notice/list.do";
</script>
</main>