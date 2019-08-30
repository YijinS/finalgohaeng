<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<main>
<div id="article" class="contentsArticle">
	<div class="header_article">
		<h3 class="sub_title">1대1상담 자세히보기</h3>
	</div>
	<div>
		<div class="content_wrap content_notice_view">
			<!-- -------------------------------------------------------------------------------------- -->
			<form id="searchList">
				<input type="hidden" id="noticeSerial" name="noticeSerial">
				<table class="tbl_data tbl_board_view">
					<caption>번호,분류,제목,등록일 및 처리현황 등 나의 1:1 상담 내역</caption>
					<colgroup>
						<col style="width: 105px">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">제목</th>
							<td class="subject" colspan="3">${dto.title}</td>
						</tr>
						<tr>
							<th scope="row">등록일</th>
							<fmt:formatDate var="date" value="${dto.regdate}"
								pattern="yyyy-MM-dd" />
							<td>${date}</td>
							<th scope="row">분류</th>
							<td>${dto.category}</td>
						</tr>
						<tr>
							<th scope="row">처리현황</th>
							<c:choose>
								<c:when test="${not empty dto.reply}">
									<td colspan="3">답변완료</td>
								</c:when>
								<c:when test="${empty dto.reply}">
									<td colspan="3">미답변</td>
								</c:when>
							</c:choose>
						</tr>
						<tr>
							<td colspan="4" class="content">${dto.content}</td>
						</tr>
						<c:if test="${not empty dto.reply}">
							<tr>
								<th scope="row">답변내용</th>
								<td class="subject" colspan="3">${dto.reply}</td>
							</tr>
						</c:if>
					</tbody>
				</table>
				<a href="list" class="btn_common form list">목록</a>
				<c:if test="${not empty dto.reply}">
					<button onclick="Display();" class="btn_common form edit">답변수정</button>
					<a href="delete?index=${dto.index}" class="btn_common form remove">답변삭제</a>
				</c:if>
			</form>
		</div>
		<%-- <c:if test="${empty dto.reply }"> --%>
			<form id="fom" method="post" action="reply">
				<div>
					<textarea id="reply" name="reply" placeholder="답변을 적어주세요.">${dto.reply}</textarea>
					<button type="submit" class="btn_common form edit">답변등록</button>
				</div>
				<input type="hidden" name="index" value="${dto.index}">
			</form>
		<%-- </c:if> --%>
		
		<script>
		window.addEventListener("load", function (e) {
			var fom = document.querySelector('#fom');
			var reply =document.querySelector('#reply').value;
			//alert(reply.value);
			if(reply == null || reply == "" || reply == undefined){
				fom.style.display = 'block';
				e.preventDefault();
				return;
			}
			else{
				fom.style.display = 'none';
			}
		});
		</script>
		<script>
			function Display() {
				var fom = document.querySelector('#fom');
				
				fom.style.display = 'block';
				event.preventDefault();
				return;
			}
		</script>
	</div>
</div>
<style>
* {
	box-sizing: border-box;
}

textarea {
	width: 100%;
	height: 100px;
	padding: 10px 10px;
	font-size: 20px;
}
</style>
</main>