<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<aside>
   <div id="sidebar">

      <!-- LNB Start -->
      <div class="snbArea">
         <ul id="snb">
            <li class="depth1 ">
                  <a id="QA_Lnb_Menu2486" href="${pageContext.request.contextPath}/admin/notice/list" menuno="2486" treeno="2703" class="product"> 공지사항</a>
            </li>
           
            <li class="depth1 collapsable">
               <a id="QA_Lnb_Menu2487" href="${pageContext.request.contextPath}/admin/callcenter/qna/list" menuno="2487" treeno="2707" class="member" style="color: black;font-weight: bold;"> 고객센터 </a>
                  <ul>
                     <li class=""><a id="QA_Lnb_Menu74"  href="${pageContext.request.contextPath}/admin/callcenter/qna/list" menuno="74"  treeno="2708" class=""> 1:1상담 </a>
                     </li>
                     <li class=""><a id="QA_Lnb_Menu71"  href="#" menuno="71" treeno="2709" class=""> 자주묻는질문 </a>
                     </li>
                  </ul>
            </li>
            <li class="depth1">
                  <a id="QA_Lnb_Menu2488" href="${pageContext.request.contextPath}/admin/winner_interview/1" menuno="2488" treeno="2711" class="member"> 당첨자인터뷰 </a>
            </li>
               
            <li class="depth1">
               <a id="QA_Lnb_Menu2489" href="${pageContext.request.contextPath}/admin/store/1" menuno="2489" treeno="2712" class="board"> 판매점 </a>
            </li>
            <li class="depth1 collapsable">
                <a id="QA_Lnb_Menu2488" href="${pageContext.request.contextPath}/admin/event/list" menuno="2488" treeno="2711" class="member"> 이벤트 </a>
            </li>
               
                <li class="depth1 collapsable">
                   <a id="QA_Lnb_Menu2488" href="${pageContext.request.contextPath}/admin/drawshow/lotto/list" menuno="2488" treeno="2711" class="member"> 참관신청 </a>
               </li>
         </ul>
  
         <div class="ftp ">
            <a href="#">
               <img src="${pageContext.request.contextPath }/resources/images/index/logo-header.png" alt="고행복권" style="margin-left: -6px;" >
            </a>
           <!-- 
            <strong class="title">파일 업로드 사용 용량</strong> &nbsp;<a href="#none"
               class="btnUploader" id="ec-smartmode-lnb-file-uploader">업로더</a>
            <div class="info">
               <div class="gauge">
                  <span class="value" style="width: 8%"></span>
               </div>
               <div class="data">
                  <strong class="value">8%</strong> <span class="capacity"><strong
                     class="value">15MB</strong> / 200MB</span>
               </div>
            </div> -->
         </div>
      </div>
      <!-- LNB End -->

   </div>
</aside>
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