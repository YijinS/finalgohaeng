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
<h5>인증번호를 입력하세요</h5>
<div class="container">
	<form name="authform" onsubmit="return Check()">
		인증번호: <input type="text" id="key" name="key"/>
		<input type="submit" value="인증확인"/>
	</form>
</div>

<script>
	function Check(){
		//var authkey = opener.document.querySelector("#pInput").value;
		var authkey = ${authkey}
		var key = document.querySelector("#key").value;
		
		if(key==""){
			alert("인증번호를 입력하세요");
			return false;
		}
		if(authkey != key){
			alert("틀린 인증번호입니다. 다시입력해주세요");
			key="";
			return false;
		}
		if(authkey == key){
			alert("인증완료");
			opener.document.querySelector("#prcheck").value="인증완료";
			self.close();
		}
			
	}
</script>
</body>
</html>