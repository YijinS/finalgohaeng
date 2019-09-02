<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<aside>
   <div id="sidebar">

      <!-- LNB Start -->
      <div class="snbArea">
         <ul id="snb">
            <li class="depth1 ">
                  <a id="QA_Lnb_Menu2486" href="${pageContext.request.contextPath}/admin/notice/list" menuno="2486" treeno="2703" class="product"> 공지사항</a>
            </li>
            
            <li class="depth1 collapsable">
               <a id="QA_Lnb_Menu2487" href="${pageContext.request.contextPath}/admin/callcenter/qna/list" menuno="2487" treeno="2707" class="member"> 고객센터 </a>
            </li>
            <li class="depth1">
                  <a id="QA_Lnb_Menu2488" href="${pageContext.request.contextPath}/admin/winner_interview/1" menuno="2488" treeno="2711" class="member"> 당첨자인터뷰 </a>
            </li>
               
            <li class="depth1">
               <a id="QA_Lnb_Menu2489" href="${pageContext.request.contextPath}/admin/store/1" menuno="2489" treeno="2712" class="board" style="color: black;font-weight: bold;"> 판매점 </a>
            </li>
            <li class="depth1 collapsable">
                <a id="QA_Lnb_Menu2488" href="${pageContext.request.contextPath}/admin/event/list" menuno="2488" treeno="2711" class="member"> 이벤트 </a>
            </li>
               
                <li class="depth1 collapsable">
                   <a id="QA_Lnb_Menu2488" href="${pageContext.request.contextPath}/admin/drawshow/lotto/list" menuno="2488" treeno="2711" class="member"> 참관신청 </a>
               </li>
         </ul>
  
         <div class="ftp ">
            <a href="#">
               <img src="${pageContext.request.contextPath }/resources/images/index/logo-header.png" alt="고행복권" style="margin-left: -6px;" >
            </a>
           <!-- 
            <strong class="title">파일 업로드 사용 용량</strong> &nbsp;<a href="#none"
               class="btnUploader" id="ec-smartmode-lnb-file-uploader">업로더</a>
            <div class="info">
               <div class="gauge">
                  <span class="value" style="width: 8%"></span>
               </div>
               <div class="data">
                  <strong class="value">8%</strong> <span class="capacity"><strong
                     class="value">15MB</strong> / 200MB</span>
               </div>
            </div> -->
         </div>
      </div>
      <!-- LNB End -->

   </div>
</aside>
<style>
	#wrapper {width: 700px; height: 800px; }
	.tbl_data {width: 600px; }
	.popup_win_content { width: 600px; margin: 0;}
	#map {width: 700px; height: 400px;}
	#btn-list {width: 600px;}
	#btn-list div { display: inline-block;}
	#btn-list .btns_bottom.close { float: right;}
	#btn-list a { margin: 0;}
</style>
<div id="wrapper">
<div id="map"></div>
<script>

		
		var mapContainer  = document.getElementById('map');
		var mapOption  = { //지도를 생성할 때 필요한 기본 옵션
			center : new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.(가운데에 위치하도록)
			level : 3//지도의 레벨(확대, 축소 정도)
		//생성인자는 위도(latitude), 경도(longitude) 순
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); /* //지도 생성, 객체 리턴 */
		
		
		/* 스카이뷰, 지도 확대 & 축소  */
		// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
		var mapTypeControl = new kakao.maps.MapTypeControl();
		
		// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
		
		
		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	
		/* 주소 가져오기  */
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch('${dto.storeAddr}', function(result, status) {

		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {

		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });

		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">${dto.storeName}</div>'
		        });
		        infowindow.open(map, marker);

		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});  
		
		
		
		</script>

<section class="popup_win_common popup_find_location">
	<header class="popup_win_header">
		<h1>만물</h1>
	</header>
	<div class="popup_win_content">

		<table class="tbl_data">
			<caption>판매점 상세정보</caption>
			<colgroup>
				<col style="width: 120px">
				<col>
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">판매점</th>
					<td>${dto.storeName}</td>
				</tr>
				<tr>
					<th scope="row">전화번호</th>
					<td>${dto.storeTel}</td>
				</tr>
				<tr>
					<th scope="row">소재지</th>
					<td>${dto.storeAddr}</td>
				</tr>
				<tr>
					<th scope="row">취급복권</th>
					<c:choose>
						<c:when test="${dto.storeAbleGames == 1}">
							<td class="ta_left">
							<img src='${pageContext.request.contextPath}/resources/images/store/ico_seller_645.png' alt='lotto645'></td>
						</c:when>

						<c:when test="${dto.storeAbleGames == 2}">
							<td class="ta_left">
							<img src="${pageContext.request.contextPath}/resources/images/store/ico_seller_520.png" alt="연금복권520"></td>
						</c:when>

						<c:when test="${dto.storeAbleGames == 3}">
							<td class="ta_left">
							<img src="${pageContext.request.contextPath}/resources/images/store/ico_seller_645.png" alt="lotto645"> 
							<img src="${pageContext.request.contextPath}/resources/images/store/ico_seller_520.png" alt="연금복권520"></td>
						</c:when>

						<c:otherwise>
							<td class="ta_left"></td>
						</c:otherwise>

					</c:choose>
				</tr>
			</tbody>
		</table>
		<div id="btn-list">
			<div class="btns_bottom">
				<a class="btn_common mid" href="1editform.do?storeIndex=${dto.storeIndex}">수정</a>
			</div>
			<div class="btns_bottom">
				<a class="btn_common mid" href="1delete.do?storeIndex=${dto.storeIndex}">삭제</a>
			</div>
			<div class="btns_bottom close">
				<a href="#" class="btn_common mid"
					onclick="self.close(); return false;">닫기</a>
			</div>
		</div>
	</div>


</section>
</div>
