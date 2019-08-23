<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="body">
	<div class="containerWrap">
		<section class="contentSection">
			<!-- ----------왼쪽메뉴---------- 영역 -->
			<nav class="lnbNav">
				<div id="snb" class="lnb">
					<h2 id="03" class="lnb_title">당첨결과</h2>
					<ul id="lnb" class="lnb_dep1">
						<li id="03-01" class="active"><a
							href="${pageContext.request.contextPath }/gameresult/lotto645/1.do"
							class="menuLnb"><span>로또6/45</span></a>
							<ul class="lnb_dep2">
								<li id="03-01-01" class="active"><a
									href="${pageContext.request.contextPath }/gameresult/lotto645/1.do"><span>
											회차별 당첨번호</span></a></li>
								<li id="03-01-02"><a
									href="${pageContext.request.contextPath }/gameresult/lotto645/2.do"><span>
											내번호 당첨확인</span></a></li>
								<li id="03-01-03"><a
									href="${pageContext.request.contextPath }/gameresult/lotto645/3.do"><span>
											당첨내역</span></a></li>
								<li id="03-01-04"><a
									href="${pageContext.request.contextPath }/gameresult/lotto645/4.do"><span>
											당첨금 지급안내</span></a></li>
								<li id="03-01-05"><a
									href="${pageContext.request.contextPath }/gameresult/lotto645/5.do"><span>
											추첨방송 다시보기</span></a></li>
								<li id="03-01-06"><a
									href="${pageContext.request.contextPath }/gameresult/lotto645/6.do"><span>
											추첨방송 참관신청</span></a></li>
							</ul></li>
						<li id="03-02"><a
							href="${pageContext.request.contextPath }/gameresult/pension520/1"
							class="menuLnb"><span>연금복권520</span></a></li>

						<li id="03-05"><a href="#" class="menuLnb"><span>로또6/45
									당첨통계</span></a></li>
						<li id="03-06"><a href="#" class="menuLnb"><span
								style="letter-spacing: -1px;">연금복권520 당첨통계</span></a></li>
						<li id="03-07"><a href="#" class="menuLnb"><span>당첨소식</span></a></li>
						<li id="03-08"><a href="#" class="menuLnb"><span>미수령
									당첨금</span></a></li>
					</ul>
				</div>
			</nav>
			<!-- -------------------------------------- -->
			<!-- ----------메인컨텐츠---------- 영역 -->
			<main id="article" class="contentsArticle">
			<div class="header_article">
				<h3 class="sub_title">회차별 당첨번호</h3>
				<p class="location">
					<a class="home" href="/"> Home </a><span class="gt">&gt;</span><a
						href="#">당첨결과</a><span class="gt">&gt;</span><a href="#"><span>로또6/45</span></a><span
						class="gt">&gt;</span><a href="#"> 회차별 당첨번호</a>
				</p>
			</div>
			<div>
				<div class="content_wrap content_winnum_645">
				
					<!-- excel file 읽어오기 -->
					
				    <form id="massiveForm" name="massiveForm" enctype="multipart/form-data" 
				    	method="post" action="<c:url value="/board/massiveWrite"/>" >
				        <input type="file" name="excelFile"/>
				        <input type="submit" value="업로드"/> 
				    </form>
				    
				     <a href="<c:url value="/board/excel/list"/>">Excel Export</a>

    
					<a class="btn_common form" id="printBtn" href="javascript:void(0)"
						title="새창 열림">인쇄하기</a> <a class="btn_common form" id="exelBtn"
						href="javascript:void(0)">엑셀다운로드</a>
				</div>
			</div>
			</main>
			<!-- -------------------------------------- -->
		</section>
	</div>
</div>


<script>
	function checkFileType(filePath) {
	    var fileFormat = filePath.split(".");
	    if (fileFormat.indexOf("xlsx") > -1) {
	        return true;
	    } else {
	        return false;
	    }
	
	}
	
	function check() {
	    var file = $("#excelFile").val();
	    if (file == "" || file == null) {
	        alert("파일을 선택해주세요.");
	        return false;
	    } else if (!checkFileType(file)) {
	        alert("엑셀 파일만 업로드 가능합니다.");
	        return false;
	    }
	
	    if (confirm("업로드 하시겠습니까?")) {
	        var options = {
	            success : function(data) {
	                alert("모든 데이터가 업로드 되었습니다.");
	
	            },
	            type : "POST"
	        };
	        $("#excelUploadForm").ajaxSubmit(options);
	
	    }
	}
</script>