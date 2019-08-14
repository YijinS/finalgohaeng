<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
 
<script type="text/javascript">
    $(function(){
        //전역변수
        var obj = [];              
        //스마트에디터 프레임생성
        nhn.husky.EZCreator.createInIFrame({
            oAppRef: obj,
            elPlaceHolder: "editor",
            sSkinURI: "${pageContext.request.contextPath }/resources/editor/SmartEditor2Skin.html",
            htParams : {
                // 툴바 사용 여부
                bUseToolbar : true,            
                // 입력창 크기 조절바 사용 여부
                bUseVerticalResizer : true,    
                // 모드 탭(Editor | HTML | TEXT) 사용 여부
                bUseModeChanger : true,
            }
        });
        //전송버튼
        $("#insertBoard").click(function(){
            //id가 smarteditor인 textarea에 에디터에서 대입
            obj.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
            //폼 submit
            $("#insertBoardFrm").submit();
        });
    });
</script>

<div class="article">
	<div class="container">
		<h3>이벤트 등록하기</h3>
		<form method="post" id="insertBoardFrm" enctype="multipart/form-data">
			<label for="title">제목</label>
			<input type="text" name="title" id="title" /> <br />
			<label for="content">내용</label>
			<textarea name="editor" id="editor" style="width: 700px; height: 400px;"></textarea>
			<input type="button" id="insertBoard" value="등록" />
		</form>
	</div>
</div>
 
