<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div id="article" class="contentsArticle">
		<div class="header_article">
			<h3 class="sub_title">당첨자 인터뷰</h3>
			<p class="location"><a class="home" href="/"> Home </a><span class="gt">&gt;</span>
			<a href="/gameResult.do?method=byWin">당첨결과</a><span class="gt">&gt;</span>
			<a href="/gameResult.do?method=highWin"><span>당첨소식</span></a><span class="gt">&gt;</span>
			<a href="/gameResult.do?method=highWin"> 당첨자 인터뷰</a></p>
		</div>
		<div>
		
<div class="article">
	<div class="container">
		<h3>당첨자 인터뷰 등록하기</h3>
		<form action="1insert" method="post">
			<label for="title">당첨 카테고리</label>
			<input type="text" class="form-control" name="wiCategory" id="category" />
			<div class="form-group">
			<label for="title">제목</label>
			<input type="text" class="form-control" name="wiTitle" id="title" />
			<label for="title">당첨일</label>
			<input type="date" class="form-control" name="wiDrawDate" id="wiDrawDate" /> 
			</div>
			<label for="content">내용</label>
			<textarea name="wiContent" id="content" style=" width: 100%; height: 400px;"></textarea>
			<div class="text-right">
				<a href="${pageContext.request.contextPath }/admin/winner_interview/1" class="btn btn-secondary btn-lg">취소</a>
				<input type="button" class="btn btn-primary btn-lg" onclick="submitContents(this);" value="등록" />
			</div>
		</form>
	</div>
</div>


			<div class="content_wrap content_interview_winner">
			<!-- -------------------------------------------------------------------------------------- -->
			
				<table class="tbl_data tbl_board_view">
					<caption>당첨자 당첨소감 인터뷰 내용 보기</caption>
					<tbody>											
						<tr class="prev_next">								
							<th scope="row"><span class="prev">이전글</span></th>							
							<td colspan="3">
										다음글이 없습니다.
							</td>
						</tr>
						<tr class="prev_next">								
							<th scope="row"><span class="next">다음글</span></th>							
							<td colspan="3">
										<a href="javascript:void(0)" onclick="showBoardDetail('/gameResult.do?method=highWinView&amp;txtNo=13834');">스피또 1등 당첨이라니! 너무 떨려서 소감 쓰기도 힘들어요!</a>
							</td>
						</tr>
					</tbody>													
				</table>
				<div class="btns_submit board"><a class="btn_common mid" href="/gameResult.do?method=highWin">목록</a></div>
				
			<!-- -------------------------------------------------------------------------------------- -->
			</div>
		</div>
	</div>
	
	
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/SmartEditor/js/HuskyEZCreator.js" charset="utf-8"></script>
 
<script>
	var oEditors = [];
	
	//추가 글꼴 목록
	//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];
	
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "content",
		sSkinURI: "${pageContext.request.contextPath }/resources/SmartEditor/SmartEditor2Skin.html",	
		htParams : {
			bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
			fOnBeforeUnload : function(){
				//alert("완료!");
			}
		}, //boolean
		fOnAppLoad : function(){
			//예제 코드
			//oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
		},
		fCreator: "createSEditor2"
	});
	
	function pasteHTML() {
		var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
		oEditors.getById["content"].exec("PASTE_HTML", [sHTML]);
	}
	
	function showHTML() {
		var sHTML = oEditors.getById["content"].getIR();
		alert(sHTML);
	}
		
	function submitContents(elClickedObj) {
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
		
		// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.
		
		try {
			elClickedObj.form.submit();
		} catch(e) {}
	}
	
	function setDefaultFont() {
		var sDefaultFont = '궁서';
		var nFontSize = 24;
		oEditors.getById["content"].setDefaultFont(sDefaultFont, nFontSize);
	}
</script>