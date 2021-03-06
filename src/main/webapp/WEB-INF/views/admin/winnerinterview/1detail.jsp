<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<aside>
   <div id="sidebar">

      <!-- LNB Start -->
      <div class="snbArea">
         <ul id="snb">
            <li class="depth1 ">
                  <a id="QA_Lnb_Menu2486" href="${pageContext.request.contextPath}/admin/notice/list" menuno="2486" treeno="2703" class="product"> 공지사항</a>
            </li>
            
            <li class="depth1">
               <a id="QA_Lnb_Menu2487" href="${pageContext.request.contextPath}/admin/callcenter/qna/list" menuno="2487" treeno="2707" class="member"> 고객센터 </a>
            </li>
            <li class="depth1">
                  <a id="QA_Lnb_Menu2488" href="${pageContext.request.contextPath}/admin/winner_interview/1" menuno="2488" treeno="2711" class="member" style="color: black;font-weight: bold;"> 당첨자인터뷰 </a>
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
<table class="tbl_data tbl_board_view">
	<caption>당첨자 당첨소감 인터뷰 내용 보기</caption>
	<colgroup>
		<col style="width: 105px">
		<col style="width: 350px">
		<col style="width: 105px">
		<col>
	</colgroup>
	<thead>
		<tr>
			<th scope="row">제목</th>
			<td colspan="3" class="subject">${dto.wiTitle}</td>
		</tr>
		<tr>
			<th scope="row">당첨일</th>
			<fmt:formatDate var="date" value="${dto.wiDrawDate}" pattern="yyyy-MM-dd" />
			<td>${date}</td>
			<th scope="row">조회수</th>
			<td>${dto.wiHit}</td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td colspan="4" class="content">${dto.wiContent}</td>
		</tr>
		<tr class="prev_next">
			<th scope="row"><span class="prev">이전글</span></th>
			<c:if test="${dto.prevNum ne 0 }">
				<td><a href="1detail?wiIndex=${dto.prevNum}">${dto.prevTitle}</a></td>
			</c:if>
			<c:if test="${dto.prevNum eq 0 }">
				<td>이전글이 없습니다.</td>
			</c:if>
		</tr>
		<tr class="prev_next">
			<th scope="row"><span class="next">다음글</span></th>
			<c:if test="${dto.nextNum ne 0 }">
				<td><a href="1detail?wiIndex=${dto.nextNum}">${dto.nextTitle}</a></td>
			</c:if>
			<c:if test="${dto.nextNum eq 0 }">
				<td>다음글이 없습니다.</td>
			</c:if>
		</tr>
	</tbody>
</table>
<div class="btn_common form write">
	<a href="1editform?wiIndex=${dto.wiIndex}">수정</a>
</div>
<div class="btn_common form delete">
	<a href="1delete?wiIndex=${dto.wiIndex}">삭제</a>
</div>
<div class="btn_common form list">
	<a href="1">목록</a>
</div>
</main>