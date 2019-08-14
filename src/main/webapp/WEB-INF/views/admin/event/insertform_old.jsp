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
            elPlaceHolder: "content",
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

        function submitContents(elClickedObj) {
    		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
    		
    		// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.
    		
    		try {
    			elClickedObj.form.submit();
    		} catch(e) {}
    	}
        
    });
</script>

<div class="article">
	<div class="container">
		<h3>이벤트 등록하기</h3>
		<form action="insert.do" method="post">
			<div class="form-group">
			<label for="title">제목</label>
			<input type="text" class="form-control" name="title" id="title" />
			</div>
			<div class="form-group">
			<label for="startDate">이벤트 시작일</label>
			<input type="date" name="startDate" class="form-control">
			</div>
			<div class="form-group">
			<label for="endDate">이벤트 종료일</label>
			<input type="date" name="endDate" class="form-control">
			</div>
			<div class="form-group">
			<label for="subTitle">설명</label>
			<input type="text" class="form-control" name="subTitle" id="title" />
			</div>
			<label for="content">내용</label>
			<textarea name="content" id="content" style=" width: 100%; height: 400px;"></textarea>
			<div class="form-check form-check-inline">
				<input class="form-check-input" type="radio" name="dpOptions" id="dpOptions1" value="0">
				<label class="form-check-label" for="dpOptions">공개</label>
				</div>
				<div class="form-check form-check-inline">
				<input class="form-check-input" type="radio" name="dpOptions" id="dpOptions2" value="1">
				<label class="form-check-label" for="dpOptions">비공개</label>
				</div>
			<div class="text-right">
				<a href="${pageContext.request.contextPath }/admin/event/list.do" class="btn btn-secondary btn-lg">취소</a>
				<a href="#" class="btn btn-primary btn-lg" onclick="submitContents(this);" >등록</a>
			</div>
		</form>
	</div>
</div>
 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">