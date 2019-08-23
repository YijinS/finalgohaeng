<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="article" class="contentsArticle">

	<div>
		<div class="content_wrap content_event_detail">
			<!-- -------------------------------------------------------------------------------------- -->


			<div class="container">
				<a href="list">글 목록보기</a>

				<c:if test="${not empty keyword }">
					<p>
						<strong>${keyword }</strong> 검색어로 검색된 결과 자세히 보기 입니다.
					</p>
				</c:if>

				<h3>카페 글 상세 보기</h3>

				<c:if test="${eventDto.prevNum ne 0 }">
					<a
						href="detail?index=${eventDto.prevNum }&condition=${condition}&keyword=${encodedKeyword}">이전글</a>
				</c:if>

				<c:if test="${eventDto.nextNum ne 0 }">
					<a
						href="detail?index=${eventDto.nextNum }&condition=${condition}&keyword=${encodedKeyword}">다음글</a>
				</c:if>

				<table class="table table-bordered table-condensed">
				<fmt:formatDate value="${eventDto.startDate }" var="start" pattern="yyyy-MM-dd"/>
				<fmt:formatDate value="${eventDto.endDate }" var="end" pattern="yyyy-MM-dd"/>
				<fmt:formatDate value="${eventDto.drawDate }" var="draw" pattern="yyyy-MM-dd"/>
				<fmt:formatDate value="${eventDto.regDate }" var="reg" pattern="yyyy-MM-dd HH:mm"/>
				  <tr>
				    <th style="width: 10%;">이벤트명</th>
				    <td colspan="3">${eventDto.title }</td>
				  </tr>
				  <tr>
				    <th style="width: 10%;">설명</th>
				    <td colspan="3">${eventDto.subTitle }</td>
				  </tr>
				  <tr>
				    <th style="width: 10%;">시작일</th>
				    <td>${start }</td>
				    <th style="width: 10%;">종료일</th>
				    <td>${end }</td>
				  </tr>
				  <tr>
				    <th style="width: 10%;">추첨일</th>
				    <td>${draw }</td>
				    <th style="width: 10%;">등록일</th>
				    <td>${reg }</td>
				  </tr>
				  <tr>
				    <th style="width: 10%;">내용</th>
				    <td colspan="3">${eventDto.content }</td>
				  </tr>
				  <tr>
				    <th style="width: 10%;">분류</th>
				    <td>${eventDto.enable }</td>
				    <th style="width: 10%;">공개</th>
				    <td>${eventDto.display }</td>
				  </tr>
				</table>
				<a href="updateform?index=${eventDto.index }">수정</a>
				<a href="javascript:deleteConfirm()">삭제</a>
				<%-- 로그인된 아이디와 글 작성자가 같은 경우 수정,삭제 --%>
				<%-- <c:if test="${sessionScope.member eq 'ADMIN' }">
					<a href="updateform?index=${eventDto.index }">수정</a>
					<a href="javascript:deleteConfirm()">삭제</a>
				</c:if> --%>
				<!-- 댓글 목록 -->
				<div class="comments">
					<ul>
						<c:forEach items="${commentList }" var="tmp">
							<fmt:formatDate var="regDate" value="${tmp.regDate }" pattern="yyyy-MM-dd HH:mm:ss"/>
							<c:choose>
								<c:when test="${tmp.deleted ne 'yes' }">
									<li class="comment" id="comment${tmp.index }"
										<c:if test="${tmp.index ne tmp.commentGroup }">style="padding-left:50px;"</c:if>>
										<c:if test="${tmp.index ne tmp.commentGroup }">
											<img class="reply_icon"
												src="${pageContext.request.contextPath}/resources/images/re.gif" />
										</c:if>
										<dl>
											<dt>
												<span>${tmp.writerId }</span>
												<c:if test="${tmp.index ne tmp.commentGroup }">
												to <strong>${tmp.targetId }</strong>
												</c:if>
												<span>${regDate}</span> <a href="javascript:"
													class="reply_link">답글</a> |
												<c:choose>
													<%-- 로그인된 아이디와 댓글의 작성자가 같으면 --%>
													<c:when test="${sessionScope.member.id eq tmp.writerId }">
														<a href="javascript:" class="comment-update-link">수정</a>&nbsp;&nbsp;
													<a href="javascript:deleteComment(${tmp.index })">삭제</a>
													</c:when>
													<c:otherwise>
														<a href="javascript:">신고</a>
													</c:otherwise>
												</c:choose>
											</dt>
											<dd>
												<pre>${tmp.content }</pre>
											</dd>
										</dl>
										<form class="comment-insert-form" action="commentinsert"
											method="post">
											<!-- 덧글 그룹 -->
											<input type="hidden" name="eventIndex"
												value="${eventDto.index }" />
											<!-- 덧글 대상 -->
											<input type="hidden" name="targetId" value="${tmp.writerId }" />
											<input type="hidden" name="commentGroup"
												value="${tmp.commentGroup }" />
											<textarea name="commentContent"><c:if
													test="${empty sessionScope.member }">로그인이 필요합니다.</c:if></textarea>
											<button type="submit">등록</button>
										</form> <!-- 로그인한 아이디와 댓글의 작성자와 같으면 수정폼 출력 --> <c:if
											test="${sessionScope.member.id eq tmp.writerId }">
											<form class="comment-update-form" action="commentupdate">
												<input type="hidden" name="index" value="${tmp.index }" />
												<textarea name="content">${tmp.content }</textarea>
												<button type="submit">수정</button>
											</form>
										</c:if>
									</li>
								</c:when>
								<c:otherwise>
									<li
										<c:if test="${tmp.index ne tmp.commentGroup }">style="padding-left:50px;"</c:if>>삭제된
										댓글 입니다.</li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</ul>
					<div class="clearfix"></div>
					<!-- 원글에 댓글을 작성할수 있는 폼 -->
					<div class="comment_form">
						<form action="commentinsert" method="post">
							<!-- 댓글의 그룹번호는 원글의 글번호 -->
							<input type="hidden" name="eventIndex" value="${eventDto.index }" />
							<!-- 댓글의 대상자는 원글의 작성자 -->
							<%-- <input type="hidden" name="target_id" value="${dto.writer }"/> --%>
							<input type="hidden" name="targetId" value="ADMIN" />
							<textarea name="commentContent"><c:if
									test="${empty sessionScope.member.id }">로그인이 필요합니다.</c:if></textarea>
							<button type="submit">등록</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js"></script>
<script>
function deleteConfirm(){
	var isDelete=confirm("글을 삭제 하시겠습니까?");
	if(isDelete){
		location.href="${pageContext.request.contextPath }/admin/event/delete?index=${eventDto.index}";
	}
}
</script>

<script>
	//댓글 수정 링크를 눌렀을때 호출되는 함수 등록
	$(".comment-update-link").click(function(){
		$(this)
		.parent().parent().parent()
		.find(".comment-update-form")
		.slideToggle(200);
	});
	
	//댓글 수정 폼에 submit 이벤트가 일어났을때 호출되는 함수 등록
	$(".comment-update-form").on("submit", function(){
		// "private/comment_update.do"
		var url=$(this).attr("action");
		//폼에 작성된 내용을 query 문자열로 읽어온다.
		// num=댓글번호&content=댓글내용
		var data=$(this).serialize();
		//이벤트가 일어난 폼을 선택해서 변수에 담아 놓는다.
		var $this=$(this);
		$.ajax({
			url:url,
			method:"post",
			data:data,
			success:function(responseData){
				// responseData : {isSuccess:true}
				if(responseData.isSuccess){
					//폼을 안보이게 한다 
					$this.slideUp(200);
					//폼에 입력한 내용 읽어오기
					var content=$this.find("textarea").val();
					//pre 요소에 수정 반영하기 
					$this.parent().find("pre").text(content);
				}
			}
		});
		//폼 제출 막기 
		return false;
	});
	
	//댓글 삭제를 눌렀을때 호출되는 함수
	function deleteComment(index){
		var isDelete=confirm("확인을 누르면 댓글이 삭제 됩니다.");
		if(isDelete){
			$.ajax({
				url:"commentdelete",
				method:"post",
				data:{"index":index},
				success:function(responseData){
					if(responseData.isSuccess){
						var sel="#comment"+index;
						$(sel).text("삭제된 댓글 입니다.");
					}
				}
			});
		}
	}
	
	//폼에 submit 이벤트가 일어 났을때 실행할 함수 등록 
	$(".comments form").on("submit", function(){
		//로그인 여부
		var isLogin=${not empty sessionScope.member};
		if(isLogin==false){
			alert("로그인 페이지로 이동 합니다.");
			location.href="${pageContext.request.contextPath}/guest/login?url=/admin/event/detail?index=${eventDto.index}";
			return false;//폼 전송 막기 
		}
	});

	//답글 달기 링크를 클릭했을때 실행할 함수 등록
	$(".comment .reply_link").click(function(){
		$(this)
		.parent().parent().parent()
		.find(".comment-insert-form")
		.slideToggle(200);
		
		// 답글 <=> 취소가 서로 토글 되도록 한다. 
		if($(this).text()=="답글"){
			$(this).text("취소");
		}else{
			$(this).text("답글");
		}
	});

	function deleteConfirm(){
		var isDelete=confirm("글을 삭제 하시겠습니까?");
		if(isDelete){
			location.href="${pageContext.request.contextPath }/admin/event/delete?index=${eventDto.index}";
		}
	}
</script>
<style>
/* 글 내용의 경계선 표시 */
.content {
	border: 1px dotted #cecece;
}
/* 글 내용안에 있는 이미지의 크기 제한 */
.content img {
	max-width: 100%;
}
/* 댓글에 관련된 css */
.comments ul {
	padding: 0;
	margin: 0;
	list-style-type: none;
}

.comments ul li {
	border-top: 1px solid #888; /* li 의 윗쪽 경계선 */
}

.comments dt {
	margin-top: 5px;
}

.comments dd {
	margin-left: 26px;
}

.comments form textarea, .comments form button {
	float: left;
}

.comments li {
	clear: left;
}

.comments form textarea {
	width: 85%;
	height: 100px;
}

.comments form button {
	width: 15%;
	height: 100px;
}
/* 댓글에 댓글을 다는 폼과 수정폼을 일단 숨긴다. */
.comment form {
	display: none;
}

.comment {
	position: relative;
}

.comment .reply_icon {
	width: 8px;
	height: 8px;
	position: absolute;
	top: 10px;
	left: 30px;
}

.comments .user-img {
	width: 20px;
	height: 20px;
	border-radius: 50%;
}
</style>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">