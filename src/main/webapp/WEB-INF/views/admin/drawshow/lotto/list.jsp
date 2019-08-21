<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


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
								<col style="width: 100px">
								<col style="width: 195px">
								<col style="width: 195px">
								<col style="width: 110px">


							</colgroup>
							<thead>
								<tr>
									<th scope="col"><input type="checkbox" name="selected_all"></th>
									<th scope="col">번호</th>
									<th scope="col">작성자</th>
									<th scope="col">모집기간</th>
									<th scope="col">참관일자</th>
								</tr>
							</thead>
							<tbody>

								<c:forEach var="list" items="${list}">
									<c:if test="${list.category eq 0}">
										<tr>
										<th><input type="checkbox" name="ckBox" id="cBox${list.index}" value="${list.index}"></th>
										<td>${list.index}</td>
										<td>${list.memberId}</td>
										<td>모집기간안정함</td>
										<fmt:formatDate var="date" value="${list.drawDate}"
											pattern="yyyy-MM-dd" />
										<td>${date}</td>										
									</tr>	
									</c:if>								
								</c:forEach>
							</tbody>
						</table>
						<form id="questionlistfrm" method="post">
						<input type="hidden" name="hiddenValue" id="hiddenValue" value=""/>			
						</form>
						<input type="button" name="btn" id="btn" value="확인" onclick="fnGetdata();" />


						<script>
							function fnGetdata() {
								var obj = $("[name=ckBox]");
								var chkArray = new Array(); // 배열 선언

								$('input:checkbox[name=ckBox]:checked').each(
										function() { // 체크된 체크박스의 value 값을 가지고 온다.
											chkArray.push(this.value);
										});
								$('#hiddenValue').val(chkArray);
								$('#questionlistfrm').attr('action','/admin/drawshow/lotto/list.do');
								$('#questionlistfrm').submit();
								alert($('#hiddenValue').val()); // 아래 체크박스가 모두 체크되어 있다면 1,2,3,4 가 출력 된다.

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
							<div class="paginate_common" id="page_box">

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