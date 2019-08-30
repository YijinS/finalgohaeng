<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="body">
	<div class="containerWrap">
		<section class="contentSection">
			<!-- ----------왼쪽메뉴---------- 영역 -->
			<nav class="lnbNav">
					<div id="snb" class="lnb">
						<h2 id="03" class="lnb_title">당첨결과</h2>
						<ul id="lnb" class="lnb_dep1">
							<li id="03-01"><a href="${pageContext.request.contextPath }/gameresult/lotto645/1" class="menuLnb"><span>로또6/45</span></a></li>
							<li id="03-02" class="active"><a href="#" class="menuLnb"><span>연금복권520</span></a>
								<ul class="lnb_dep2">
									<li id="03-02-01"><a href="${pageContext.request.contextPath }/gameresult/pension520/1"><span>회차별 당첨번호</span></a></li>
									<li id="03-02-02"><a href="${pageContext.request.contextPath }/gameresult/pension520/2"><span> 내번호 당첨확인</span></a></li>
									<li id="03-02-03"><a href="${pageContext.request.contextPath }/gameresult/pension520/3"><span> 당첨내역</span></a></li>
									<li id="03-02-04"><a href="${pageContext.request.contextPath }/gameresult/pension520/4"><span> 당첨금 지급안내</span></a></li>
									<li id="03-02-05" class="active"><a href="${pageContext.request.contextPath }/gameresult/pension520/5"><span> 추첨방송 다시보기</span></a></li>
									<li id="03-02-06"><a href="${pageContext.request.contextPath }/gameresult/pension520/6"><span> 추첨방송 참관신청</span></a></li>
								</ul></li>
							<li id="03-05"><a href="${pageContext.request.contextPath }/gameresult/lottostat/1" class="menuLnb">
							<span>로또6/45 당첨통계</span></a>
							</li>
							<li id="03-06"><a href="${pageContext.request.contextPath }/gameresult/pensionstat/1" class="menuLnb">
								<span style="letter-spacing: -1px;">연금복권520 당첨통계</span></a>
							</li>
							<li id="03-07"><a href="${pageContext.request.contextPath }/gameresult/winningnews/1" class="menuLnb">
								<span>당첨소식</span></a></li>
							<li id="03-08"><a href="${pageContext.request.contextPath }/gameresult/unreceived/1" class="menuLnb">
								<span>미수령 당첨금</span></a>
							</li>
						</ul>
					</div>
	
	
					<a href="#" target="_blank"><img
						src="${pageContext.request.contextPath }/resources/images/common/leftm_banner05.png"
						alt="당첨확인서비스"></a>
				</nav>
				<!-- -------------------------------------- -->
			<!-- ----------메인컨텐츠---------- 영역 -->
			<main id="article" class="contentsArticle">
			<div class="header_article">
				<h3 class="sub_title">추첨방송 다시보기</h3>
				<p class="location">
					<a class="home" href="/"> Home </a><span class="gt">&gt;</span><a
						href="#">당첨결과</a><span class="gt">&gt;</span><a href="#"><span>연금복권520</span></a><span
						class="gt">&gt;</span><a href="#"> 추첨방송 다시보기</a>
				</p>
			</div>
			<div>
				<div class="content_wrap content_cast_520">
					<div class="box_visual_top">
						<div class="copy">
							<div class="inner">
								<p>연금복권520 추첨방송</p>
								<p>
									연금복권520 의 당첨 결과는 <strong>매주 수요일 오후 7시 30분경</strong> MBC Drama
									추첨방송 <br>전용 스튜디오에서 생방송으로 진행되는 추첨방송을 통해 결정됩니다.
								</p>
							</div>
						</div>
					</div>

					<div id="videoMovie" style="width: 100%; height: 350px;">
						<div class="box_vod">
							<div class="inner">
								<a class="b"
									href="https://www.mbcplus.com/web/program/contentList.do?searchCondition=001003&amp;programMenuSeq=306&amp;programInfoSeq=108"
									target="_new"><span>MBC 연금복권520 추첨방송 다시보기(388회차 이후)</span></a>
								<a class="gb"
									href="http://program.sbs.co.kr/builder/programReplayVideo.do?pgm_id=22000009100&amp;pgm_build_id=14609&amp;pgm_mnu_id=41775"
									target="_new"><span>SBS 지난 추첨방송 다시보기(387회차 이전)</span></a>
							</div>
						</div>
					</div>
				</div>
			</div>
			</main>
		</section>
	</div>
</div>
