<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<section class="popup_win_common popup_find_location">
	<header class="popup_win_header">
		<h1>판매점</h1>
	</header>


	<div class="popup_win_content">
		<form method="post" action="1edit.do?storeIndex=${dto.storeIndex}">
			<table>
				<thead>
					<!--  num이라는 파라미터를 가져가는 용도 -->
					<input type="hidden" value="${dto.storeIndex}" name="storeIndex" />
					<!-- display용 -->
					<!-- disabled된 것은 form 전송도 안된다.  -->
					<tr>
						인덱스
						<input type="text" value="${dto.storeIndex}" name="storeIndex"
							disabled />
					</tr>
					<tr>
						<th scope="row">판매점</th>
					</tr>
					<tr>
						<td><input type="text" value="${dto.storeName}" id="name"
							name="storeName"></td>
					</tr>

					<tr>
						<th scope="row">전화번호</th>
					</tr>
					<tr>
						<td><input type="text" value="${dto.storeTel}" id="tel"
							name="storeTel"></td>
					</tr>
					<tr>
						<th scope="row">소재지</th>
					</tr>
					<tr>
						<td><input type="text" value="${dto.storeAddr}" id="addr"
							name="storeAddr"></td>
					</tr>
					<tr>
						<th scope="row">취급복권(1.lotto 2.pension 3.all</th>
					</tr>
					<tr>
						<td><input type="text" value="${dto.storeAbleGames}"
							id="addr" name="storeAddr"></td>
					</tr>
					<tr>
						<th scope="row">폐점유무(0.폐점 1.안폐점)</th>
					</tr>
					<tr>
						<td><input type="text" value="${dto.storeEnable}" id="addr"
							name="storeAddr"></td>
					</tr>
				</thead>

				<tbody>

					<tr>
						<td><input value="수정" type="submit"
							class="btn_common form write"></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</section>