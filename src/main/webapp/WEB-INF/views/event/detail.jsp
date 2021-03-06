<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="body">
	<div class="containerWrap">
		<!--내용-->
		<section class="contentSection">
			<!-- ----------왼쪽메뉴---------- 영역 -->
			<nav class="lnbNav">
				<div id="snb" class="lnb">
					<h2 id="05" class="lnb_title">이벤트</h2>
					<ul id="lnb" class="lnb_dep1">
						<li id="05-01" class="active"><a
							href="/event.do?method=Eventend" class="menuLnb text-white"><span>이벤트</span></a>
						</li>
					</ul>
				</div>
			</nav>
			<!-- -------------------------------------- -->
			<!-- 컨텐츠 영역 -->
			<div id="article" class="contentsArticle">
				<div class="header_article">
					<h3 class="sub_title">이벤트</h3>
					<p class="location">
						<a class="home" href="/"> Home </a><span class="gt">&gt;</span><a
							href="/event/list">이벤트</a><span class="gt">&gt;</span><a
							href="/event/detail?index=${eventDto.index }">이벤트</a>
					</p>
				</div>
				<div>
					<div class="content_wrap content_event_detail">
						<!-- -------------------------------------------------------------------------------------- -->
	
						<table class="tbl_data tbl_board_view tbl_board_event">
							<caption>제목, 이벤트 기간, 당첨자 발표일, 설명, 상세내용 및 당첨자 안내 등 진행중인
								이벤트 상세 내용입니다.</caption>
							<colgroup>
								<col style="width: 105px">
								<col style="width: 345px">
								<col style="width: 105px">
								<col>
							</colgroup>
							<fmt:formatDate value="${eventDto.startDate }" var="start"
							pattern="yyyy-MM-dd" />
							<fmt:formatDate value="${eventDto.endDate }" var="end"
								pattern="yyyy-MM-dd" />
							<fmt:formatDate value="${eventDto.drawDate }" var="draw"
								pattern="yyyy-MM-dd" />
							<fmt:formatDate value="${eventDto.regDate }" var="reg"
								pattern="yyyy-MM-dd HH:mm" />
							<tbody>
								<tr class="prev_next">
									<th scope="row">이전글</th>
									<c:if test="${eventDto.prevNum ne 0 }">
										<td colspan="3" class="subj"><a href="detail?index=${eventDto.prevNum}">${eventDto.prevTitle}</a></td>
									</c:if>
									<c:if test="${eventDto.prevNum eq 0 }">
										<td colspan="3">이전글이 없습니다</td>
									</c:if>
								</tr>
								<tr class="prev_next">
									<th scope="row">다음글</th>
									<c:if test="${eventDto.nextNum ne 0 }">
										<td colspan="3" class="subj"><a href="detail?index=${eventDto.prevNum}">${eventDto.prevTitle}</a></td>
									</c:if>
									<c:if test="${eventDto.nextNum eq 0 }">
										<td colspan="3">다음글이 없습니다</td>
									</c:if>
								</tr>
								<tr>
									<th scope="row">제목</th>
									<td colspan="3" class="subj">
										<span class="label ing">진행중</span>
										<strong>${eventDto.title}</strong>
									</td>
								</tr>
								<tr>
									<th scope="row">이벤트기간</th>
									<td>${start } ~ ${end }</td>
									<th scope="row">당첨자 발표</th>
									<td>${draw }</td>
								</tr>
								<tr>
									<th scope="row">설명</th>
									<td colspan="3">${eventDto.subTitle }</td>
								</tr>
								<tr>
									<td colspan="4" class="content">
										${eventDto.content}
									</td>
								</tr>
							</tbody>
						</table>
						<!-- 버튼 영역  리스트가기 / 이벤트 참가신청 -->
						<div class="btns_submit board">
							<a class="btn_common mid" href="list" style="margin-right: 10px;">목록</a>
							<c:choose>
								<c:when test="${isExist != 'null' and isExist == true }">
									<a class="btn_common mid blu" id="aeBtn"
										style="cursor: default; color: #fff;">이벤트 신청완료</a>
								</c:when>
								<c:otherwise>
									<a class="btn_common mid blu" id="aeBtn" href="#"
										style="color: #fff;">이벤트 신청하기</a>
								</c:otherwise>
							</c:choose>
							<form name="aeForm" id="aeForm" action="applyevent" method="post">
								<input type="hidden" name="eventIndex" id="nowPage"
									value="${eventDto.index }"> <input type="hidden"
									name="memberId" id="nowPage" value="${sessionScope.member.id }">
							</form>
							<script>
							$(function(){
								var aeBtn = $("#aeBtn");
								var aeForm = $("#aeForm");
								var sessionId = "<%=session.getAttribute("member")%>";
								var eventIndex = aeForm.find("input[name=eventIndex]");
								var memberId = aeForm.find("input[name=memberId]");
								aeBtn.click(function(){
									if(sessionId == 'null'){
										var cururl = '/event/detail?index=${eventDto.index }';
										alert("로그인이 필요합니다.");
										$(location).attr('href','${pageContext.request.contextPath }/guest/login?url='+cururl);
										return;
									}
									$.ajax({
				                           url:'${pageContext.request.contextPath }/event/applyevent',
				                           type:'post',
				                           data:{
				                              "eventIndex":eventIndex.val(),
				                              "memberId":memberId.val()
				                           },
				                           success:function(data){
				                              if(data.isSuccess == true)
				                                 alert("이벤트 신청이 되셨습니다.");
				                              $(location).attr('href','${pageContext.request.contextPath }/event/detail?index='+eventIndex.val());	
				                           }
				                        
				                        });
									
								});
							});
						</script>
						</div>
						<!-- ------------버튼 영역  리스트가기 / 이벤트 참가신청 끝------------------------- -->
						<!-- 댓글 목록 -->
						<div class="comments mt-5">
							<ul>
								<c:forEach items="${commentList }" var="tmp">
									<fmt:formatDate var="regDate" value="${tmp.regDate }"
										pattern="yyyy-MM-dd HH:mm:ss" />
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
													<input type="hidden" name="targetId"
														value="${tmp.writerId }" /> <input type="hidden"
														name="commentGroup" value="${tmp.commentGroup }" />
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
									<input type="hidden" name="eventIndex"
										value="${eventDto.index }" />
									<!-- 댓글의 대상자는 원글의 작성자 -->
									<%-- <input type="hidden" name="target_id" value="${dto.writer }"/> --%>
									<input type="hidden" name="targetId" value="ADMIN" />
									<textarea name="commentContent"><c:if
											test="${empty sessionScope.member.id }">로그인이 필요합니다.</c:if></textarea>
									<button type="submit">등록</button>
								</form>
							</div>
						</div>
						<!--  댓글목록 끝  -->
	
	
	
						<!-- -------------------------------------------------------------------------------------- -->
					</div>
				</div>
			</div>
			<!-- ---------컨텐츠영역 끝---------------------------------- -->
		</section>
	</div>
</div>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js"></script>
<script>
function deleteConfirm(){
	var isDelete=confirm("글을 삭제 하시겠습니까?");
	if(isDelete){
		location.href="${pageContext.request.contextPath }/event/delete?index=${eventDto.index}";
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
			location.href="${pageContext.request.contextPath}/guest/login?url=/event/detail?index=${eventDto.index}";
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
			location.href="${pageContext.request.contextPath }/event/delete?index=${eventDto.index}";
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