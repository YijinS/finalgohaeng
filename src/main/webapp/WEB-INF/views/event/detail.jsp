<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="article" class="contentsArticle">

	<div>
		<div class="content_wrap content_event_detail">
			<!-- -------------------------------------------------------------------------------------- -->


			<div class="container">
				<a href="list.do">글 목록보기</a>

				<c:if test="${not empty keyword }">
					<p>
						<strong>${keyword }</strong> 검색어로 검색된 결과 자세히 보기 입니다.
					</p>
				</c:if>

				<h3>카페 글 상세 보기</h3>

				<c:if test="${dto.prevNum ne 0 }">
					<a
						href="detail.do?num=${dto.prevNum }&condition=${condition}&keyword=${encodedKeyword}">이전글</a>
				</c:if>

				<c:if test="${dto.nextNum ne 0 }">
					<a
						href="detail.do?num=${dto.nextNum }&condition=${condition}&keyword=${encodedKeyword}">다음글</a>
				</c:if>

				<table class="table table-bordered table-condensed">
				<fmt:formatDate value="${dto.startDate }" var="start" pattern="yyyy-MM-dd HH:mm"/>
				<fmt:formatDate value="${dto.endDate }" var="end" pattern="yyyy-MM-dd HH:mm"/>
					
					<tr>
						<th>글번호</th>
						<td>${dto.index }</td>
					</tr>
					<tr>
						<th>제목</th>
						<td>${dto.title }</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>관리자</td>
					</tr>
					<tr>
						<th>시작일</th>
						<td>${start }</td>
					</tr>
					<tr>
						<th>종료일</th>
						<td>${end }</td>
					</tr>
				</table>
				<div class="content">${dto.content }</div>
				<a href="updateform.do?num=${dto.index }">수정</a>
				<a href="javascript:deleteConfirm()">삭제</a>
				<%-- 로그인된 아이디와 글 작성자가 같은 경우 수정,삭제 --%>
				<%-- <c:if test="${id eq dto.writer }">
					<a href="updateform.do?num=${dto.num }">수정</a>
					<a href="javascript:deleteConfirm()">삭제</a>
				</c:if> --%>
			</div>
		</div>
	</div>
</div>

<script>
function deleteConfirm(){
	var isDelete=confirm("글을 삭제 하시겠습니까?");
	if(isDelete){
		location.href="${pageContext.request.contextPath }/cafe/delete.do?index=${dto.index}";
	}
}
</script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">