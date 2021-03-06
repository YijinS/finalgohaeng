<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="body">
	<div class="containerWrap">
		<section class="contentSection">

			<!-- ----------메인컨텐츠---------- 영역 -->
			<main id="article" class="contentsArticle">
			<div class="d-flex justify-content-end">
			<c:if test="${not empty keyword }">
				<p class="mr-3 align-middle">
					<strong>${keyword }</strong> 라는 검색어로 <strong>${totalRow }</strong>
					개의 글이 검색 되었습니다.
				</p>
			</c:if>
			<form action="list" method="get">
				<select name="condition"
					id="condition">
					<option value="index"
						<c:if test="${condition eq 'index' }">selected</c:if>>번호</option>
					<option value="id"
						<c:if test="${condition eq 'id' }">selected</c:if>>아이디</option>
					<option value="result"
						<c:if test="${condition eq 'result' }">selected</c:if>>결과</option>
				</select> <input type="text" name="keyword" placeholder="검색어 입력..."
					value="${keyword }" />
				<button type="submit" class="btn btn-primary btn-sm">검색</button>
			</form>
		</div>
		<div class="mt-3">
		<table class="table table-hover">
			<thead>
				<tr>
					<th style="width: 10%;"><input class="form-check-input mt-0 ml-0" type="checkbox" name="selected_all"></th>
					<th style="width: 20%;">번호</th>
					<th style="width: 50%;">아이디</th>
					<th style="width: 20%;">결과</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="applyEvent" items="${applyEventList}">
					<tr>
						<td><input class="form-check-input mt-0 ml-0" name="ckBox" type="checkbox" value="${applyEvent.index}" id="inlineCheckbox1"></td>
						<td>${applyEvent.index}</td>
						<td>${applyEvent.id}</td>
						<td>${applyEvent.result}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<a class="btn btn-primary" id="draw" href="${pageContext.request.contextPath }/admin/event/management/draw" role="button">추첨</a>
		<a class="btn btn-secondary" id="drop" href="${pageContext.request.contextPath }/admin/event/management/drop" role="button">낙첨</a>
		<div class="page-display">
			<ul class="pagination">
				<c:choose>
					<c:when test="${startPageNum ne 1 }">
						<li><a
							href="list?pageNum=${startPageNum-1 }&condition=${condition }&keyword=${encodedKeyword }">
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
								href="list?pageNum=${i }&condition=${condition }&keyword=${encodedKeyword }">${i }</a></li>
						</c:when>
						<c:otherwise>
							<li><a
								href="list?pageNum=${i }&condition=${condition }&keyword=${encodedKeyword }">${i }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<c:choose>
					<c:when test="${endPageNum lt totalPageCount }">
						<li><a
							href="list?pageNum=${endPageNum+1 }&condition=${condition }&keyword=${encodedKeyword }">
								&raquo; </a></li>
					</c:when>
					<c:otherwise>
						<li class="disabled"><a href="javascript:">&raquo;</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		</div>
		<!-- checkBox 전체 선택 -->
		<script>
			$('input[name=selected_all]').on(
					'change',
					function() {
						$('input[name=ckBox]').prop('checked',
								this.checked);
					});
			
			
			$(document).ready(function(){
		        
		        $("#draw").click(function() {
		            //배열 선언
		            var indexArray = [];
		            
		            $('input[name="ckBox"]:checked').each(function(i){//체크된 리스트 저장
		            	indexArray.push($(this).val());
		            });
		            
		            var objParams = {
		                    "indexList" : indexArray       //인덱스배열 저장
		                };
		            
		            //ajax 호출
		            $.ajax({
		                url         :   "${pageContext.request.contextPath }/admin/event/management/draw",
		                dataType    :   "json",
		                contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
		                type        :   "post",
		                data        :   objParams,
		                success     :   function(retVal){
		
		                    if(retVal.code == "OK") {
		                        alert(retVal.message);
		                        window.location.href = "${pageContext.request.contextPath }/admin/event/management/list";
		                    } else {
		                        alert(retVal.message);
		                    }
		                     
		                },
		                error       :   function(request, status, error){
		                    console.log("AJAX_ERROR");
		                }
		            });
		            
		        })
		        
		    });
		
		</script>
		
			</main>
			<!-- -------------------------------------- -->
		</section>
	</div>
</div>