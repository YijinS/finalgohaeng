<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>엑셀 다운로드</title>
<link rel="stylesheet" href="<c:url value='/js/jquery-ui-1.12.0/jquery-ui.min.css'/>"/>
<script src="<c:url value="/js/jquery-3.1.0.min.js"/>"></script>
<script src="<c:url value="/js/jquery-ui-1.12.0/jquery-ui.min.js"/>"></script>
<script src="<c:url value="/js/jquery.fileDownload.js"/>"></script>
<script type="text/javascript">
//<![CDATA[
$(function() {
    $("#btn-excel").on("click", function () {
        var $preparingFileModal = $("#preparing-file-modal");
        $preparingFileModal.dialog({ modal: true });
        $("#progressbar").progressbar({value: false});
        $.fileDownload("/pentode/excel.do", {
            successCallback: function (url) {
                $preparingFileModal.dialog('close');
            },
            failCallback: function (responseHtml, url) {
                $preparingFileModal.dialog('close');
                $("#error-modal").dialog({ modal: true });
            }
        });
        // 버튼의 원래 클릭 이벤트를 중지 시키기 위해 필요합니다.
        return false;
    });

});
//]]>
</script>
</head>
<body>

<button id="btn-excel">엑셀 다운로드</button>

<!-- 파일 생성중 보여질 진행막대를 포함하고 있는 다이얼로그 입니다. -->
<div title="Data Download" id="preparing-file-modal" style="display: none;">
    <div id="progressbar" style="width: 100%; height: 22px; margin-top: 20px;"></div>
</div>

<!-- 에러발생시 보여질 메세지 다이얼로그 입니다. -->
<div title="Error" id="error-modal" style="display: none;">
    <p>생성실패.</p>
</div>

</body>
</html>