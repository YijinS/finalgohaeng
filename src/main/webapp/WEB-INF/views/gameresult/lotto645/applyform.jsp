<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="body">
	<div class="containerWrap"><!-- pc일 경우 컨텐츠 영역 감싸는 마크업 추가  -->
	


<section class="contentSection">
    <nav class="lnbNav">
        <div id="snb" class="lnb">
	<h2 id="03" class="lnb_title">당첨결과</h2>
	<ul id="lnb" class="lnb_dep1">
		<li id="03-01" class="active"><a href="/gameResult.do?method=byWin" class="menuLnb"><span>로또6/45</span></a>
			<ul class="lnb_dep2" style="">
				<li id="03-01-01"><a href="/gameResult.do?method=byWin"><span> 회차별 당첨번호</span></a></li>
          		<li id="03-01-02"><a href="/gameResult.do?method=myWin"><span> 내번호 당첨확인</span></a></li>
             	<li id="03-01-03"><a href="/gameResult.do?method=allWin"><span> 당첨내역</span></a></li>
				<li id="03-01-04"><a href="/gameResult.do?method=locInfo645"><span> 당첨금 지급안내</span></a></li>
				<li id="03-01-05"><a href="/gameResult.do?method=lotTv"><span> 추첨방송 다시보기</span></a></li>
				<li id="03-01-06" class="active"><a href="/gameResult.do?method=visitWinList"><span> 추첨방송 참관신청</span></a></li>
			</ul>
		</li>
		<li id="03-02"><a href="/gameResult.do?method=win520" class="menuLnb"><span>연금복권520</span></a>
			<ul class="lnb_dep2" style="display:none;">
				<li id="03-02-01"><a href="/gameResult.do?method=win520"><span> 회차별 당첨번호</span></a></li>
             	<li id="03-02-02"><a href="/gameResult.do?method=myWin520"><span> 내번호 당첨확인</span></a></li>
             	<li id="03-02-03"><a href="/gameResult.do?method=winResult"><span> 당첨내역</span></a></li>
				<li id="03-02-04"><a href="/gameResult.do?method=locInfo520"><span> 당첨금 지급안내</span></a></li>
				<li id="03-02-05"><a href="/gameResult.do?method=lotInfo"><span> 추첨방송 다시보기</span></a></li>
				<li id="03-02-06"><a href="/gameResult.do?method=visitWinList&amp;tabGbn=2"><span> 추첨방송 참관신청</span></a></li>
			</ul>
		</li>
		<li id="03-03"><a href="/gameResult.do?method=winList" class="menuLnb"><span>전자복권</span></a>
		</li>
		<li id="03-04"><a href="/gameResult.do?method=speettoWin" class="menuLnb"><span>즉석식인쇄복권</span></a>
			<ul class="lnb_dep2" style="display:none;">
				<li id="03-04-01"><a href="/gameResult.do?method=speettoWin"><span> 당첨내역</span></a></li>
				<li id="03-04-02"><a href="/gameResult.do?method=speettoLotInfo"><span> 당첨금 지급안내</span></a></li>
			</ul>
		</li>
        <li id="03-05"><a href="/gameResult.do?method=statIndex" class="menuLnb"><span>로또6/45 당첨통계</span></a>
			<ul class="lnb_dep2" style="display: none;">
				<li id="03-05-01"><a href="/gameResult.do?method=statIndex"><span> 당첨통계</span></a></li>
                <li id="03-05-02"><a href="/gameResult.do?method=statByNumber"><span> 번호별 통계</span></a></li>
                <li id="03-05-03"><a href="/gameResult.do?method=statByColor"><span> 색상 통계</span></a></li>
                <li id="03-05-04"><a href="/gameResult.do?method=statGroupNum"><span> 구간별 출현횟수</span></a></li>
                <li id="03-05-05"><a href="/gameResult.do?method=noViewNumber"><span> 기간별 미출현 번호</span></a></li>
                <li id="03-05-06"><a href="/gameResult.do?method=statOddEven"><span> 홀짝통계</span></a></li>
                <li id="03-05-07"><a href="/gameResult.do?method=statConsNumber"><span> 연속번호 출현</span></a></li>
                <li id="03-05-08"><a href="/gameResult.do?method=statPattern"><span> 패턴분석표</span></a></li>
			</ul>
		</li>
        <li id="03-06"><a href="/gameResult.do?method=index520" class="menuLnb"><span style="letter-spacing: -1px;">연금복권520 당첨통계</span></a>
		</li>
        <li id="03-07"><a href="/gameResult.do?method=highWin" class="menuLnb"><span>당첨소식</span></a>
			<ul class="lnb_dep2" style="display:none;">
				<li id="03-07-01"><a href="/gameResult.do?method=highWin"><span> 당첨자 인터뷰</span></a></li>
             	<li id="03-07-02"><a href="/gameResult.do?method=winTalkList&amp;boardType=T"><span> 당첨 소감 게시판</span></a></li>
			</ul>
		</li>
		<li id="03-08"><a href="/gameResult.do?method=notReceiveInfo" class="menuLnb"><span>미수령 당첨금</span></a>
			<ul class="lnb_dep2" style="display:none;">
				<li id="03-08-01"><a href="/gameResult.do?method=notReceiveInfo"><span> 로또6/45</span></a></li>
                <li id="03-08-02"><a href="/gameResult.do?method=noRecieveInfo520"><span> 연금복권520</span></a></li>
                <li id="03-08-03"><a href="/gameResult.do?method=notReceiveInfoElec"><span> 전자복권</span></a></li>
                <li id="03-08-04"><a href="/gameResult.do?method=speetoNoGetList"><span> 즉석식 인쇄복권</span></a></li>
			</ul>
		</li>
	</ul>
</div>


    </nav>
    <div id="article" class="contentsArticle">
        <div class="header_article">
            <h3 class="sub_title">추첨방송 참관신청</h3>
            <p class="location"><a class="home" href="/"> Home </a><span class="gt">&gt;</span><a href="/gameResult.do?method=byWin">당첨결과</a><span class="gt">&gt;</span><a href="/gameResult.do?method=byWin"><span>로또6/45</span></a><span class="gt">&gt;</span><a href="/gameResult.do?method=visitWinList"> 추첨방송 참관신청</a></p>
        </div>
        <div>
            <div class="content_wrap content_result_visitwrite">
				<div class="top_info">
					<ul class="list_text_common">
						<li>참관을 신청한 경우 별도로 담당자가 연락을 드릴 계획이며, <strong>참관신청은 1회로 제한</strong> 됩니다.</li>
						<li>참관 신청 후 개인정보(이름, 연락처)가 본인 확인 및 참관여부 확인을 위해 방송국(MBC, MBC Drama)으로 전달되며, 참관신청일 2~6일 전에 확인 전화를<br>드리오니 참고하시기 바랍니다.</li>
					</ul>
				</div>
                
				<form id="frm" name="frm">
					<input type="hidden" id="txtNo" name="txtNo">
                    <table class="tbl_form_write">
                        <caption>신청구분, 추첨희망일, 이름, 휴대폰번호 등 참관신청을 위한 정보를 입력합니다.</caption>
                        
                        <colgroup>
                            <col width="105px">
                            <col width="645px">
                        </colgroup>
                        
                        
                        <tbody>
                            <tr>
                                <th scope="row">신청구분<span class="req">*</span></th>
                                <td>
                                	<input type="radio" id="appType1" name="appType" value="0" checked="">
                                	<label for="appType1">로또6/45</label>
                                	<input type="radio" id="appType2" name="appType" value="1">
                                	<label for="appType2">연금복권520</label>
                                </td>
                            </tr>
							<tr class="date">
                                <th scope="row">추첨희망일<span class="req">*</span></th>
                                <td>
                                    <select name="appHope" id="appHope" title="추첨희망일 선택">
                                        <option value="" selected="">선택해주세요</option>
                                    <option value="2019년09월14일(토)">2019년09월14일(토)</option>
                                    <option value="2019년09월21일(토)">2019년09월21일(토)</option>
                                    <option value="2019년09월28일(토)">2019년09월28일(토)</option>
                                    <option value="2019년10월05일(토)">2019년10월05일(토)</option>
                                    </select>
                                </td>
							</tr>
							<tr class="name">
								<th scope="row">이름<span class="req">*</span></th>
								<td><input type="text" id="appName" class="readonly" name="appName" value="정지혜" title="이름 입력" readonly=""></td>
							</tr>
							<tr class="cellp">
								<th scope="row">휴대폰번호<span class="req">*</span></th>
								<td>
                                    <select id="phone1" name="phone1" title="휴대폰 앞자리 번호 선택">
                                        <option value="010">010</option>
                                        <option value="011">011</option>
                                        <option value="016">016</option>
                                        <option value="018">018</option>
                                        <option value="019">019</option>
                                    </select>
                                    <span class="unit">-</span>
                                    <input type="text" id="phone2" name="phone2" maxlength="4" onkeyup="$.onlyNumber(this);" title="휴대폰 중간자리 번호 입력">
                                    <span class="unit">-</span>
                                    <input type="text" id="phone3" name="phone3" maxlength="4" onkeyup="$.onlyNumber(this);$.enterCheck(event.keyCode)" title="휴대폰 뒷자리 번호 입력">
                            	</td>
							</tr>
                        </tbody>
                    </table>
					<div class="group_content">
						<div class="group_title">
							<h4 class="title">개인정보 제 3자 제공 동의 안내</h4>
						</div>
	                    <table class="tbl_data">
		                    <caption>개인정보수집목적,개인정보수집항목,보유 및 이용기간,개인정보를 받는자,거부권 및 불이익 등 개인정보처리방침고지 내용</caption>
							<colgroup>
							    <col style="width:220px">
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
	                		<p class="prgrp_common">회원님은 위의 개인정보 제 3자 제공에 동의하지 않으실 권리가 있으며, 동의하지 않을 경우<br> 
							추첨방송 참관에 대한 불이익이 있을 수 있습니다.<br>
							상기의 내용을 확인하였으며, 개인정보의 제 3자 제공에 대해 동의하십니까?</p>
	                		<a class="link_common" href="javascript:void(0)" onclick="popup2()" title="새창 열림">개인정보처리방침 전체보기</a>
	                		<span class="check"><input name="agreeChk2" id="agreeChk2" type="checkbox" value="Y"><label for="agreeChk2">예, 동의합니다.</label></span>
	                		<button class="btn_common lrg blu" type="button" onclick="agreeCheck()">참관신청</button>
	                	</div>
	                </div>
                </form>
            </div>
        </div>
    </div>		
</div>
</div>