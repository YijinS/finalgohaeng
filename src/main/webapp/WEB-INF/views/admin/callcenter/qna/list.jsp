<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<main>
<div id="article" class="contentsArticle">
	<div class="header_article">
		<h3 class="sub_title">1:1 상담</h3>
	</div>
	<div>
		<div class="content_wrap content_1on1_counsel">
			<form id="questionlistfrm">
				<input type="hidden" id="searchType" name="searchType"
					value="${searchType }" />
				<div class="col-sm-9">
					<label><input type="radio" id="searchRadioOptions"
						name="searchRadioOptions" value="total"
						${searchType eq 'total' ? "checked" : ""}><span>전체</span></label>
					<label><input type="radio" id="searchRadioOptions"
						name="searchRadioOptions" value="reply"
						${searchType eq 'reply' ? "checked" : ""}><span>답변만</span></label>
					<label><input type="radio" id="searchRadioOptions"
						name="searchRadioOptions" value="unreply"
						${searchType eq 'unreply' ? "checked" : ""}><span>미답변만</span></label>
						<input type="hidden" name="searchRadioOptions" value="${searchRadioOptions}"
									title="검색어 입력">
				</div>
			</form>
			<script>
				$(document).ready(
						function() {
							$("input[name='searchRadioOptions']:radio").change(
									function() {
										var searchType = $(this).val();
										console.log(searchType);
										$('#searchType').val(searchType);
										$('#questionlistfrm').attr('action',
												'list.do');
										$('#questionlistfrm').submit();
									});
						});
			</script>
			<table class="tbl_data tbl_data_col">
				<caption>번호,분류,제목,등록일 및 처리현황 등 나의 1:1 상담 내역</caption>
				<colgroup>
					<col style="width: 80px">
					<col style="width: 120px">
					<col>
					<col style="width: 120px">
					<col style="width: 120px">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">분류</th>
						<th scope="col">제목</th>
						<th scope="col">작성자</th>
						<th scope="col">등록일</th>
						<th scope="col">처리현황</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="list" items="${list}">
						<tr>
							<td>${list.index}</td>
							<td>${list.category}</td>
							<td><a href="detail?index=${list.index}">${list.title}</a></td>
							<td>${list.memberId}</td>
							<fmt:formatDate var="date" value="${list.regdate}" pattern="yyyy-MM-dd" />
							<td>${date}</td>
							<c:choose>
								<c:when test="${not empty list.reply}">
									<td>답변완료</td>
								</c:when>
								<c:when test="${empty list.reply}">
									<td>미답변</td>
								</c:when>
							</c:choose>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="page-display">
				<div class="paginate_common" id="page_box">
					<ul class="pagination">
						<c:choose>
							<c:when test="${startPageNum ne 1 }">
								<li><a
									href="list?pageNum=${startPageNum-1 }&searchType=${searchType }&searchRadioOptions=${searchRadioOptions}">
										&laquo; </a></li>
							</c:when>
							<c:otherwise>
								<li class="disabled"><a href="javascript:">&laquo;</a></li>
							</c:otherwise>
						</c:choose>
						<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }"
							step="1">
							<c:choose>
								<c:when test="${i eq pageNum }">
									<li class="active"><a
										href="list?pageNum=${i }&searchType=${searchType }&searchRadioOptions=${searchRadioOptions}">${i }</a></li>
								</c:when>
								<c:otherwise>
									<li><a
										href="list?pageNum=${i }&searchType=${searchType }&searchRadioOptions=${searchRadioOptions}">${i }</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>

						<c:choose>
							<c:when test="${endPageNum lt totalPageCount }">
								<li><a
									href="list?pageNum=${endPageNum+1 }&searchType=${searchType }&searchRadioOptions=${searchRadioOptions}">
										&raquo; </a></li>
							</c:when>
							<c:otherwise>
								<li class="disabled"><a href="javascript:">&raquo;</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>

			<!-- -------------------------------------------------------------------------------------- -->
		</div>
	</div>
</div>
</main>