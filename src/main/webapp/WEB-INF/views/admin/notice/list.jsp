<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<aside>
   <div id="sidebar">
      <!-- LNB Start -->
      <div class="snbArea">
         <ul id="snb">
            <li class="depth1 ">
                  <a id="QA_Lnb_Menu2486" href="${pageContext.request.contextPath}/admin/notice/list" menuno="2486" treeno="2703" class="product" style="color: black;font-weight: bold;"> 공지사항</a>
            </li>
            
            <li class="depth1">
               <a id="QA_Lnb_Menu2487" href="${pageContext.request.contextPath}/admin/callcenter/qna/list" menuno="2487" treeno="2707" class="member"> 고객센터 </a>
            </li>
            <li class="depth1">
                  <a id="QA_Lnb_Menu2488" href="${pageContext.request.contextPath}/admin/winner_interview/1" menuno="2488" treeno="2711" class="member"> 당첨자인터뷰 </a>
            </li>
               
            <li class="depth1">
               <a id="QA_Lnb_Menu2489" href="${pageContext.request.contextPath}/admin/store/1" menuno="2489" treeno="2712" class="board"> 판매점 </a>
            </li>
            <li class="depth1">
                <a id="QA_Lnb_Menu2488" href="${pageContext.request.contextPath}/admin/event/list" menuno="2488" treeno="2711" class="member"> 이벤트 </a>
            </li>
               
                <li class="depth1">
                   <a id="QA_Lnb_Menu2488" href="${pageContext.request.contextPath}/admin/drawshow/lotto/list" menuno="2488" treeno="2711" class="member"> 참관신청 </a>
               </li>
         </ul>
  
         <div class="ftp ">
            <a href="#">
               <img src="${pageContext.request.contextPath }/resources/images/index/logo-header.png" alt="고행복권" style="margin-left: -6px;" >
            </a>
         </div>
      </div>
      <!-- LNB End -->

   </div>
</aside>

<main>
<div id="article" class="contentsArticle">
	<div class="header_article">
		<h3 class="sub_title">공지사항</h3>
	</div>
	<div>
		<div class="content_wrap content_notice_list">
			<!-- -------------------------------------------------------------------------------------- -->
			<div class="group_content group_data_search">
				<div class="group_title">
					<div class="action">
						<div class="search">
							<form name="searchList" id="searchList" method="get"
								action="list.do">
								<input type="hidden" name="noticeSerial" id="noticeSerial">
								<select id="kind" name="condition" title="조회옵션 선택">
									<option value="total"
										<c:if test="${condition eq 'total' }">selected</c:if>>전체</option>
									<option value="title"
										<c:if test="${condition eq 'title' }">selected</c:if>>제목</option>
									<option value="content"
										<c:if test="${condition eq 'content' }">selected</c:if>>내용</option>
								</select> <input type="text" name="keyword" value="${keyword}"
									title="검색어 입력">
								<button id="goSearch" class="btn_common form blu" type="submit">조회</button>
							</form>
						</div>
					</div>
				</div>
				<c:if test="${not empty keyword }">
					<p>
						<strong>${keyword }</strong> 라는 검색어로 <strong>${totalRow }</strong>
						개의 글이 검색 되었습니다.
					</p>
				</c:if>
				<table class="tbl_data tbl_data_col">
					<caption>번호, 제목, 첨부파일, 등록일등 공지사항 목록</caption>
					<colgroup>
						<col style="width: 100px">
						<col style="width: 600px">
						<col style="width: 100px">
						<col style="width: 180px">
						<col style="width: 100px">
					</colgroup>
					<thead>
						<tr>
							<th scope="col" style="text-align: center;">번호</th>
							<th scope="col" style="text-align: center;">제목</th>
							<th scope="col" style="text-align: center;">첨부파일</th>
							<th scope="col" style="text-align: center;">등록일</th>
							<th scope="col" style="text-align: center;">조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="list" items="${list}">
						<fmt:formatDate value="${list.regDate }" var="regDate" pattern="yyyy-MM-dd"/>
							<tr>
								<td>${list.index}</td>
								<td style="text-align: left; padding-left: 30px;"><a href="detail.do?index=${list.index}">${list.title}</a></td>
								<td><a class="btn_attach" href="#none" onclick="fileDownload(24)"></a></td>
								<td>${regDate}</td>
								<td>${list.hit}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="action right">
					<a href="${pageContext.request.contextPath }/admin/notice/insertform" id="review_order_btn" class="btn_common form"
						title="새창 열림">등록</a>
				</div>
				<div class="page-display">
					<div class="paginate_common" id="page_box">
						<ul class="pagination">
							<c:choose>
								<c:when test="${startPageNum ne 1 }">
									<li><a
										href="list?pageNum=${startPageNum-1 }&condition=${condition }&keyword=${Keyword }">
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
											href="list?pageNum=${i }&condition=${condition }&keyword=${Keyword }">${i }</a></li>
									</c:when>
									<c:otherwise>
										<li><a
											href="list?pageNum=${i }&condition=${condition }&keyword=${Keyword }">${i }</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>

							<c:choose>
								<c:when test="${endPageNum lt totalPageCount }">
									<li><a
										href="list?pageNum=${endPageNum+1 }&condition=${condition }&keyword=${Keyword }">
											&raquo; </a></li>
								</c:when>
								<c:otherwise>
									<li class="disabled"><a href="javascript:">&raquo;</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</main>
<style>
	a {color:#222;}
</style>