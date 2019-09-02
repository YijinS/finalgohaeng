<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%

	System.out.print("상호 화면 이동 완료 ");
%>
<table class="tbl_data tbl_data_col" id="resultTable">
					<caption>상호명 조회 결과</caption>
					<colgroup>
						<col style="width: 210px;">
						<col style="width: 120px;">
						<col>
						<col style="width: 80px;">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">상호명</th>
							<th scope="col">전화번호</th>
							<th scope="col">소재지</th>
							<th scope="col">위치보기</th>
							<th scope="col">취급복권</th>
						</tr>
					</thead>
					<tbody id="tbody">
						<c:forEach var="list" items="${list}">
							<tr>
								<c:choose>
									<c:when test="${list.storeEnable == 0}">
										<!-- 0이면 폐점 -->
										<td class="ta_left">${list.storeName}
										<img src="${pageContext.request.contextPath}/resources/images/common/ico_closed_store.png" alt="폐점" />
										</td>
									</c:when>
									<c:otherwise>
										<td class="ta_left">${list.storeName}</td>
									</c:otherwise>
								</c:choose>
					
								<td>${list.storeTel}</td>
								<td class="ta_left">${list.storeAddr}</td>
								<td><a class="btn_search" id="location_map"
									onclick="window.open('1detail?storeIndex=${list.storeIndex}','a','resizable=no width=700 height=800');return false"
									href="1detail?storeIndex=${list.storeIndex}" title="새창">위치보기</a></td>
					
					
								<c:choose>
									<c:when test="${list.storeAbleGames == 1}">
										<!-- 1이면 lotto -->
										<td class="ta_left">
										<img src='${pageContext.request.contextPath}/resources/images/store/ico_seller_645.png' alt='lotto645'></td>
									</c:when>
					
									<c:when test="${list.storeAbleGames == 2}">
										<!-- 2이면 pension -->
										<td class="ta_left">
										<img src="${pageContext.request.contextPath}/resources/images/store/ico_seller_520.png" alt="연금복권520"></td>
									</c:when>
					
									<c:when test="${list.storeAbleGames == 3}">
										<!-- 3이면 all -->
										<td class="ta_left">
										<img src="${pageContext.request.contextPath}/resources/images/store/ico_seller_645.png" alt="lotto645"> 
										<img src="${pageContext.request.contextPath}/resources/images/store/ico_seller_520.png" alt="연금복권520"></td>
									</c:when>
					
									<c:otherwise>
										<td class="ta_left"></td>
									</c:otherwise>
					
								</c:choose> 
					
								<!-- 로또, 연금 판매 알림 -->
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
						href="/admin/ajax/selectStoreName?storeName=${storeName }&pageNum=${startPageNum-1 }&searchType=${searchType }">
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
						<li class="active">
							<a onclick="clickSanhoPage('${storeName }', '${i }','${open_close}' );">${i }</a>
							
						</li>
					</c:when>
					<c:otherwise>
						<li><a onclick="clickSanhoPage('${storeName }','${i }','${open_close}' );">${i }</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<c:choose>  
				<c:when test="${endPageNum lt totalPageCount }">
					<li><a href="/admin/ajax/selectStoreName?storeName=${storeName }&pageNum=${endPageNum+1 }&open_close=${open_close}">
							&raquo; </a></li>
				</c:when>
				<c:otherwise>
					<li class="disabled"><a href="javascript:">&raquo;</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
</div> 