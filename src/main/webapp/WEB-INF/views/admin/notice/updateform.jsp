<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<aside>
   <div id="sidebar">
      <!-- LNB Start -->
      <div class="snbArea">
         <ul id="snb">
            <li class="depth1 ">
                  <a id="QA_Lnb_Menu2486" href="${pageContext.request.contextPath}/admin/notice/list" menuno="2486" treeno="2703" class="product" style="color: black;font-weight: bold;"> 공지사항</a>
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
               
                <li class="depth1">
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

<div class="article">
	<div class="container">
		<h3>공지사항 수정하기</h3>
		<form action="update" method="post">
			<fmt:formatDate value="${dto.regDate }" var="regDate" pattern="yyyy-MM-dd HH:mm:ss"/>
			<input type="hidden" name="index" value="${dto.index }" />
			<fieldset disabled>
				<div class="form-group">
					<label for="index">글번호</label>
					<input type="text" id="index" class="form-control" placeholder="${dto.index }"/>	
				</div>
				<div class="form-group">
					<label for="regDate">작성일</label>
					<input type="text" id="regDate" class="form-control" placeholder="${regDate }"/>	
				</div>
			</fieldset>
			<div class="form-group">
			<label for="title">제목</label>
			<input type="text" class="form-control" name="title" id="title" value="${dto.title }"/>
			</div>
			<label for="content">내용</label>
			<textarea name="content" id="content" style=" width: 100%; height: 400px;">${dto.content }</textarea>
			<div class="text-right">
				<a href="${pageContext.request.contextPath }/admin/notice/list" class="btn btn-secondary btn-lg">취소</a>
				<input type="button" class="btn btn-primary btn-lg" onclick="submitContents(this);" value="등록" />
			</div>
		</form>
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
