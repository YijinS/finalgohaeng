<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
            <li class="depth1 collapsable">
                <a id="QA_Lnb_Menu2488" href="${pageContext.request.contextPath}/admin/event/list" menuno="2488" treeno="2711" class="member" style="color: black;font-weight: bold;"> 이벤트 </a>
            	 <ul>
                      <li class="">
                        <a id="QA_Lnb_Menu74" href="${pageContext.request.contextPath}/admin/event/list" menuno="74" treeno="2708" class=""> 이벤트관리 </a>
                      </li>
                      <li class="">
                        <a id="QA_Lnb_Menu71" href="#" menuno="71"treeno="2709" class=""> 이벤트 신청관리 </a>
                      </li>
                  </ul>
            </li>
               
                <li class="depth1 collapsable">
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
						<c:if test="${condition eq 'title' }">selected</c:if>>이벤트명</option>
					<option value="id"
						<c:if test="${condition eq 'id' }">selected</c:if>>아이디</option>
					<option value="result"
						<c:if test="${condition eq 'regDate' }">selected</c:if>>추첨일</option>
				</select> <input type="text" name="keyword" placeholder="검색어 입력..."
					value="${keyword }" />
				<button type="submit" class="btn btn-primary btn-sm">검색</button>
			</form>
		</div>
		<div class="mt-3">
		<table class="table table-hover">
			<thead>
				<tr>
					<th style="width: 10%; text-align: center;"><input class="form-check-input mt-0 ml-0" type="checkbox" name="selected_all"></th>
					<th style="width: 15%; text-align: center;">추첨일</th>
					<th style="width: 15%; text-align: center;">아이디</th>
					<th style="width: ; text-align: center;">이벤트명</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="applyEvent" items="${data.list}">
					<fmt:formatDate value="${applyEvent.drawDate }" var="drawDate" pattern="yyyy-MM-dd" />
					<tr>
						<td style="text-align: center;"><input class="form-check-input mt-0 ml-0" name="ckBox" type="checkbox" value="${applyEvent.index}" id="inlineCheckbox1"></td>
						<td style="text-align: center;">${drawDate}</td>
						<td style="text-align: center;">${applyEvent.id}</td>
						<td>${applyEvent.title}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="mt-5">
			<a class="btn btn-primary" id="draw" href="#" role="button">추첨</a>
			<a class="btn btn-secondary" id="drop" href="#" role="button">낙첨</a>
		</div>
		<div class="page-display row justify-content-md-center mt-4">
			<ul class="pagination">
				<c:choose>
					<c:when test="${data.startPageNum ne 1 }">
						<li><a
							href="list?pageNum=${data.startPageNum-1 }&condition=${data.condition }&keyword=${encodedKeyword }">
								&laquo; </a></li>
					</c:when>
					<c:otherwise>
						<li class="disabled"><a href="javascript:">&laquo;</a></li>
					</c:otherwise>
				</c:choose>
				<c:forEach var="i" begin="${data.startPageNum }" end="${data.endPageNum }"
					step="1">
					<c:choose>
						<c:when test="${i eq data.pageNum }">
							<li class="active"><a
								href="list?pageNum=${i }&condition=${data.condition }&keyword=${data.encodedKeyword }">${i }</a></li>
						</c:when>
						<c:otherwise>
							<li><a
								href="list?pageNum=${i }&condition=${data.condition }&keyword=${data.encodedKeyword }">${i }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<c:choose>
					<c:when test="${data.endPageNum lt data.totalPageCount }">
						<li><a
							href="list?pageNum=${data.endPageNum+1 }&condition=${data.condition }&keyword=${data.encodedKeyword }">
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