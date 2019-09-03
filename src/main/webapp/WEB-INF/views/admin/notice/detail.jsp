<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		<div class="content_wrap content_notice_view">
			<!-- -------------------------------------------------------------------------------------- -->
			<form id="searchList" method="post">
				<input type="hidden" id="noticeSerial" name="noticeSerial">
				<table class="tbl_data tbl_board_view">
				<fmt:formatDate value="${dto.regDate }" var="regDate" pattern="yyyy-MM-dd HH:mm:ss"/>
					<caption>제목, 등록일, 첨부파일 등 공지사항 상세</caption>
					<colgroup>
						<col style="width: 105px">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">제목</th>
							<td class="subject">${dto.title }</td>
						</tr>
						<tr>
							<th scope="row">등록일</th>
							<td>${regDate}</td>
						</tr>
						<tr>
							<th scope="row">조회수</th>
							<td>${dto.hit}</td>
						</tr>
						<tr>
							<td colspan="2" class="content">
								<div>${dto.content }</div>
								<div>
									<br>
								</div>
							</td>
						</tr>

						<tr class="prev_next">
							<th scope="row"><span class="prev">이전글</span></th>
							<c:if test="${dto.prevNum ne 0 }">
								<td><a href="detail.do?index=${dto.prevNum}">${dto.prevTitle}</a></td>
							</c:if>
							<c:if test="${dto.prevNum eq 0 }">
								<td>이전글이 없습니다.</td>
							</c:if>
						</tr>
						<tr class="prev_next">
							<th scope="row"><span class="next">다음글</span></th>
							<c:if test="${dto.nextNum ne 0 }">
								<td><a href="detail.do?index=${dto.nextNum}">${dto.nextTitle}</a></td>
							</c:if>
							<c:if test="${dto.nextNum eq 0 }">
								<td>다음글이 없습니다.</td>
							</c:if>
						</tr>
					</tbody>
				</table>
				<a href="list" id="" class="btn_common form list">목록</a> 
				<a href="updateform?index=${dto.index}" id="" class="btn_common form edit">수정</a> 
				<a href="delete?index=${dto.index}" id="" class="btn_common form remove">삭제</a>
			</form>
		</div>
	</div>
</div>
</main>