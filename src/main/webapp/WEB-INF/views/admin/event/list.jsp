<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="article">
	<div class="content_wrap content_interview_winner">
		<!-- --------------------------------------- 컨텐트 시작 ----------------------------------------------- -->

		<h4 class="mb-5">게시물 관리</h4>
		<%-- 글 검색 기능 폼 --%>
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
					<option value="titlecontent"
						<c:if test="${condition eq 'titlecontent' }">selected</c:if>>제목+내용</option>
					<option value="title"
						<c:if test="${condition eq 'title' }">selected</c:if>>제목</option>
					<option value="subTitle"
						<c:if test="${condition eq 'subTitle' }">selected</c:if>>설명</option>
				</select> <input type="text" name="keyword" placeholder="검색어 입력..."
					value="${keyword }" />
				<button type="submit" class="btn btn-primary btn-sm">검색</button>
			</form>
		</div>
		<div class="mt-3">
		<table class="table table-hover">
			<thead>
				<tr>
					<th style="width: 5%;"><input class="form-check-input mt-0 ml-0" type="checkbox" name="selected_all"></th>
					<th style="width: 6%;">번호</th>
					<th style="width: 10%;">분류</th>
					<th style="width: 34%;">제목</th>
					<th style="width: 15%;">시작일</th>
					<th style="width: 15%;">종료일</th>
					<th style="width: 15%;">추첨일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${eventList}">
					<fmt:formatDate value="${list.startDate }" var="start"
						pattern="yyyy-MM-dd" />
					<fmt:formatDate value="${list.endDate }" var="end"
						pattern="yyyy-MM-dd" />
					<fmt:formatDate value="${list.drawDate }" var="draw"
						pattern="yyyy-MM-dd" />
					<tr>
						<td><input class="form-check-input mt-0 ml-0" name="ckBox" type="checkbox" value="${list.index}" id="inlineCheckbox1"></td>
						<td>${list.index}</td>
						<td>진행중</td>
						<td><a href="detail?index=${list.index}&condition=${condition}&keyword=${encodedKeyword}">${list.title}</a></td>
						<td>${start}</td>
						<td>${end}</td>
						<td>${draw}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<a class="btn btn-primary" href="${pageContext.request.contextPath }/admin/event/insertform" role="button">등록</a>
		<a class="btn btn-secondary" id="delete" href="javasjavascript:" role="button">삭제</a>
		<a class="btn btn-secondary" href="${pageContext.request.contextPath }/admin/event/drop" role="button">마감</a>
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
		<!-- --------------------------------------------컨텐트 끝 ------------------------------------------ -->
	</div>
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
        
        $("#delete").click(function() {
            //배열 선언
            var indexArray = [];
            
            $('input[name="ckBox"]:checked').each(function(i){//체크된 리스트 저장
            	indexArray.push($(this).val());
            });
            
            var objParams = {
                    "indexList" : indexArray        //인덱스배열 저장
                };
            
            //ajax 호출
            $.ajax({
                url         :   "${pageContext.request.contextPath }/admin/event/deletelist",
                dataType    :   "json",
                contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
                type        :   "post",
                data        :   objParams,
                success     :   function(retVal){

                    if(retVal.code == "OK") {
                        alert(retVal.message);
                        window.location.href = "${pageContext.request.contextPath }/admin/event/list";
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























