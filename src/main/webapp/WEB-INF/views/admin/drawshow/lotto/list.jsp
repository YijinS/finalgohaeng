<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                  <a id="QA_Lnb_Menu2488" href="${pageContext.request.contextPath}/admin/winner_interview/1" menuno="2488" treeno="2711" class="member"> 당첨자인터뷰 </a>
            </li>
               
            <li class="depth1">
               <a id="QA_Lnb_Menu2489" href="${pageContext.request.contextPath}/admin/store/1" menuno="2489" treeno="2712" class="board"> 판매점 </a>
            </li>
            <li class="depth1">
                <a id="QA_Lnb_Menu2488" href="${pageContext.request.contextPath}/admin/event/list" menuno="2488" treeno="2711" class="member"> 이벤트 </a>
            </li>
               
                <li class="depth1 collapsable">
                   <a id="QA_Lnb_Menu2488" href="${pageContext.request.contextPath}/admin/drawshow/lotto/list" menuno="2488" treeno="2711" class="member" style="color: black;font-weight: bold;"> 참관신청 </a>
                   <ul>
                      <li class="">
                        <a id="QA_Lnb_Menu74" href="${pageContext.request.contextPath}/admin/drawshow/lotto/list" menuno="74" treeno="2708" class=""> 로또 6/45 </a>
                      </li>
                      <li class="">
                        <a id="QA_Lnb_Menu71" href="${pageContext.request.contextPath}/admin/drawshow/pension/list" menuno="71"treeno="2709" class=""> 연금 520 </a>
                      </li>
                  </ul>
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
<div class="body">
	<div class="containerWrap">
		<section class="contentSection">

			<!-- ----------메인컨텐츠---------- 영역 -->
			<main id="article" class="contentsArticle">
			<div class="header_article">
				<h3 class="sub_title">로또 6/45 참관신청</h3>
			</div>
			<div>
				<div class="content_wrap content_result_visitlist">
					<div class="group_content">
						<div class="group_title">
							<h4 class="title">당첨자 선택</h4>
						</div>
						<table class="tbl_data tbl_data_col">
							<caption>번호, 제목, 모집기간, 추첨일자 등 참관신청 당첨자 안내</caption>
							<colgroup>						
								<col style="width: 40px">
								<col style="width: 40px">
								<col style="width: 110px">
								<col style="width: 170px">
								<col style="width: 110px">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" style="text-align: center;"><input type="checkbox" name="selected_all"></th>
									<th scope="col" style="text-align: center;">번호</th>
									<th scope="col" style="text-align: center;">작성자</th>
									<th scope="col" style="text-align: center;">모집기간</th>
									<th scope="col" style="text-align: center;">참관일자</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty list }">
										<tr>
											<td colspan="5" class="nodata">조회된 결과가 없습니다.</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="list" items="${list}">
											<tr>
												<th style="text-align: center;"><input type="checkbox" name="ckBox"
													id="cBox${list.index}" value="${list.index}"></th>
												<td>${list.index}</td>
												<td>${list.name}</td>
												<td>2019-09-21~2019-10-12</td>
												<fmt:formatDate var="date" value="${list.drawDate}"
													pattern="yyyy-MM-dd" />
												<td>${date}</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
						<form id="questionlistfrm" method="post">
							<input type="hidden" name="hiddenValue" id="hiddenValue" value="" />
						</form>
						<input type="button" name="btn" id="btn" value="확인"
							onclick="fnGetdata();" />


						<script>
							function fnGetdata() {
								var obj = $("[name=ckBox]");
								var chkArray = new Array(); // 배열 선언

								$('input:checkbox[name=ckBox]:checked').each(
										function() { // 체크된 체크박스의 value 값을 가지고 온다.
											chkArray.push(this.value);
										});
								$('#hiddenValue').val(chkArray);
								$('#questionlistfrm').attr('action',
										'list');
								$('#questionlistfrm').submit();
								/* alert($('#hiddenValue').val()); */ // 아래 체크박스가 모두 체크되어 있다면 1,2,3,4 가 출력 된다.
								alert("선택하신 회원이 당첨되었습니다.");

							}
						</script>

						<!-- cBox 전체 선택 -->
						<script>
							$('input[name=selected_all]').on(
									'change',
									function() {
										$('input[name=ckBox]').prop('checked',
												this.checked);
									});
						</script>

						<div class="wrap_paginate">
							<div class="page-display">
								<div class="paginate_common" id="page_box">
									<ul class="pagination">
										<c:choose>
											<c:when test="${startPageNum ne 1 }">
												<li><a href="list?pageNum=${startPageNum-1 }">&laquo;
												</a></li>
											</c:when>
											<c:otherwise>
												<li class="disabled"><a href="javascript:">&laquo;</a></li>
											</c:otherwise>
										</c:choose>
										<c:forEach var="i" begin="${startPageNum }"
											end="${endPageNum }" step="1">
											<c:choose>
												<c:when test="${i eq pageNum }">
													<li class="active"><a href="list?pageNum=${i }">${i }</a></li>
												</c:when>
												<c:otherwise>
													<li><a href="list?pageNum=${i }">${i }</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>

										<c:choose>
											<c:when test="${endPageNum lt totalPageCount }">
												<li><a href="list?pageNum=${endPageNum+1 }">&raquo;
												</a></li>
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
			<!-- -------------------------------------- -->
		</section>
	</div>
</div>