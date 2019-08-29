<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


 <script>/* 
   session.invalidate(); */
   alert("회원탈퇴 되었습니다.");
   //javascript 를 이용해서 redirect 이동 시키기 /* 
   location.href="${pageContext.request.contextPath }/";
 
</script>