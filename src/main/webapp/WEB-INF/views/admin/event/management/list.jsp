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
		<a class="btn btn-primary" id="draw" href="#" role="button">추첨</a>
		<a class="btn btn-secondary" id="drop" href="#" role="button">낙첨</a>
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
			
			// 상단 선택버튼 클릭시 체크된 Row의 값을 가져온다.
	        $("#draw").click(function(){ 
	            
	            var rowData = new Array();
	            var tdArr = new Array();
	 
	            var checkbox = $("input[name=ckBox]:checked");
	            var list = [];
	            // 체크된 체크박스 값을 가져온다
	            checkbox.each(function(i) {
	    
	                // checkbox.parent() : checkbox의 부모는 <td>이다.
	                // checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
	                var tr = checkbox.parent().parent().eq(i);
	                var td = tr.children();
	                
	                // td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
	                var index = td.eq(1).text();
	                var id = td.eq(2).text();
	                
	                var row = {'index':index, 'id':id};
	                list.push(row);
	                console.log(row);
	            });
	            
	            console.log(list);
	            var jsonData = JSON.stringify(list);
	            jQuery.ajaxSettings.traditional=true;
	            
	          //ajax 호출
	          
	              $.ajax({
	                url         :   "${pageContext.request.contextPath }/admin/event/management/draw",
	                dataType    :   "json",
	                contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
	                type        :   "post",
	                data        :   {"jsonData":jsonData},
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
	        });
			
			$("#drop").click(function(){ 
	            
	            var rowData = new Array();
	            var tdArr = new Array();
	 
	            var checkbox = $("input[name=ckBox]:checked");
	            var list = [];
	            // 체크된 체크박스 값을 가져온다
	            checkbox.each(function(i) {
	    
	                // checkbox.parent() : checkbox의 부모는 <td>이다.
	                // checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
	                var tr = checkbox.parent().parent().eq(i);
	                var td = tr.children();
	                
	                // td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
	                var index = td.eq(1).text();
	                var id = td.eq(2).text();
	                
	                var row = {'index':index, 'id':id};
	                list.push(row);
	                console.log(row);
	            });
	            
	            console.log(list);
	            var jsonData = JSON.stringify(list);
	            jQuery.ajaxSettings.traditional=true;
	            
	          //ajax 호출
	          
	              $.ajax({
	                url         :   "${pageContext.request.contextPath }/admin/event/management/drop",
	                dataType    :   "json",
	                contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
	                type        :   "post",
	                data        :   {"jsonData":jsonData},
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
	        });

		</script>
		
			</main>
			<!-- -------------------------------------- -->
		</section>
	</div>
</div>