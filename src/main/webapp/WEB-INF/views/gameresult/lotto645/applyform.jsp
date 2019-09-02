<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="body">
	<div class="containerWrap">
		<section class="contentSection">
			<nav class="lnbNav">
				<div id="snb" class="lnb">
					<h2 id="03" class="lnb_title">당첨결과</h2>
					<ul id="lnb" class="lnb_dep1">
						<li id="03-01" class="active"><a
							href="${pageContext.request.contextPath }/gameresult/lotto645/1"
							class="menuLnb"><span>로또6/45</span></a>
							<ul class="lnb_dep2">
								<li id="03-01-01"><a
									href="${pageContext.request.contextPath }/gameresult/lotto645/1"><span>
											회차별 당첨번호</span></a></li>
								<li id="03-01-02"><a
									href="${pageContext.request.contextPath }/gameresult/lotto645/2"><span>
											내번호 당첨확인</span></a></li>
								<li id="03-01-03"><a
									href="${pageContext.request.contextPath }/gameresult/lotto645/3"><span>
											당첨내역</span></a></li>
								<li id="03-01-04"><a
									href="${pageContext.request.contextPath }/gameresult/lotto645/4"><span>
											당첨금 지급안내</span></a></li>
								<li id="03-01-05"><a
									href="${pageContext.request.contextPath }/gameresult/lotto645/5"><span>
											추첨방송 다시보기</span></a></li>
								<li id="03-01-06" class="active"><a
									href="${pageContext.request.contextPath }/gameresult/lotto645/drawshowlist"><span>
											추첨방송 참관신청</span></a></li>
							</ul></li>
						<li id="03-02"><a
							href="${pageContext.request.contextPath }/gameresult/pension520/1"
							class="menuLnb"> <span>연금복권520</span></a></li>
						<li id="03-05"><a
							href="${pageContext.request.contextPath }/gameresult/lottostat/1"
							class="menuLnb"> <span>로또6/45 당첨통계</span></a></li>
						<li id="03-06"><a
							href="${pageContext.request.contextPath }/gameresult/pensionstat/1"
							class="menuLnb"> <span style="letter-spacing: -1px;">연금복권520
									당첨통계</span></a></li>
						<li id="03-07"><a
							href="${pageContext.request.contextPath }/gameresult/winningnews/1"
							class="menuLnb"> <span>당첨소식</span></a></li>
						<li id="03-08"><a
							href="${pageContext.request.contextPath }/gameresult/unreceived/1"
							class="menuLnb"> <span>미수령 당첨금</span></a></li>
					</ul>
				</div>
			</nav>
			<div id="article" class="contentsArticle">
				<div class="header_article">
					<h3 class="sub_title">추첨방송 참관신청</h3>
					<p class="location">
						<a class="home" href="/"> Home </a><span class="gt">&gt;</span><a
							href="/gameResult.do?method=byWin">당첨결과</a><span class="gt">&gt;</span><a
							href="/gameResult.do?method=byWin"><span>로또6/45</span></a><span
							class="gt">&gt;</span><a
							href="/gameResult.do?method=visitWinList"> 추첨방송 참관신청</a>
					</p>
				</div>
				<div>
					<div class="content_wrap content_result_visitwrite">
						<div class="top_info">
							<ul class="list_text_common">
								<li>참관을 신청한 경우 별도로 담당자가 메일을 보낼 계획이며, <strong>참관신청은
										1회로 제한</strong> 됩니다.
								</li>
								<li>참관 신청 후 개인정보(이름, 이메일)가 본인 확인 및 참관여부 확인을 위해 방송국(MBC, MBC
									Drama)으로 전달되며, 참관신청일 2~6일 전에 확인 이메일을<br>드리오니 참고하시기 바랍니다.
								</li>
							</ul>
						</div>

						<form id="frm" name="frm" action="apply" method="post">
							<input type="hidden" id="txtNo" name="txtNo">
							<table class="tbl_form_write">
								<caption>신청구분, 추첨희망일, 이름, 이메일 등 참관신청을 위한 정보를 입력합니다.</caption>

								<colgroup>
									<col width="105px">
									<col width="645px">
								</colgroup>


								<tbody>
									<tr>
										<th scope="row">신청구분<span class="req">*</span></th>
										<td><input type="radio" id="appType1" name="category"
											value="0" checked=""> <label for="appType1">로또6/45</label>
											<input type="radio" id="appType2" name="category" value="1">
											<label for="appType2">연금복권520</label></td>
									</tr>
									<tr class="date">
										<th scope="row">추첨희망일<span class="req">*</span></th>
										<td><select name="drawDate" id="appHope" title="추첨희망일 선택">
												<option value="" selected="">선택해주세요</option>
												<option value="20190914">2019년09월14일(토)</option>
												<option value="20190921">2019년09월21일(토)</option>
												<option value="20190928">2019년09월28일(토)</option>
												<option value="20191005">2019년10월05일(토)</option>
										</select></td>
									</tr>
									<tr class="name">
										<th scope="row">이름<span class="req">*</span></th>
										<td><input type="text" id="appName" class="readonly"
											name="name" value="${name}" title="이름 입력" readonly=""></td>
									</tr>
									<tr class="cellp">
										<th scope="row">이메일<span class="req">*</span></th>
										<td><input type="email" id="email" name="email">
										</td>
									</tr>
								</tbody>
							</table>
							<div class="group_content">
								<div class="group_title">
									<h4 class="title">개인정보 제 3자 제공 동의 안내</h4>
								</div>
								<table class="tbl_data">
									<caption>개인정보수집목적,개인정보수집항목,보유 및 이용기간,개인정보를 받는자,거부권 및
										불이익 등 개인정보처리방침고지 내용</caption>
									<colgroup>
										<col style="width: 220px">
										<col>
									</colgroup>
									<thead>
										<tr>
											<th scope="col">항목</th>
											<th scope="col">내용</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th class="nobg ta_left" scope="row">개인정보를 제공 받는 자</th>
											<td class="ta_left">(주)고행복권</td>
										</tr>
										<tr>
											<th class="nobg ta_left" scope="row">보유 및 이용기간</th>
											<td class="ta_left">방청 이후 즉시 파기</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="agreement">
								<div class="inner">
									<p class="prgrp_common">
										회원님은 위의 개인정보 제 3자 제공에 동의하지 않으실 권리가 있으며, 동의하지 않을 경우<br>
										추첨방송 참관에 대한 불이익이 있을 수 있습니다.<br> 상기의 내용을 확인하였으며, 개인정보의 제
										3자 제공에 대해 동의하십니까?
									</p>
									<a class="link_common" href="javascript:void(0)"
										onclick="popup2()" title="새창 열림">개인정보처리방침 전체보기</a> <span
										class="check"><input name="agreeChk2" id="agreeChk2"
										type="checkbox" value="Y"><label for="agreeChk2">예,
											동의합니다.</label></span>
									<button class="btn_common lrg blu" type="button"
										onclick="agreeCheck()">참관신청</button>
								</div>
							</div>
						</form>
						<script>
                	function agreeCheck(){
                		if($(":input:checkbox[name=agreeChk2]:checked").val() != "Y"){
                			alert("개인정보의 제 3자 제공에 대해 동의해주시기 바랍니다.");
                			return;
                		}
                		else{
                			var Frm = $("#frm");
                			Frm.submit();
                		}
                			
                	}
                </script>
					</div>
				</div>
			</div>
	</div>
</div>