<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header>
    <div class="nav_wrap">

        <h1><a href="${pageContext.request.contextPath }/"><img src="${pageContext.request.contextPath }/resources/images/logo-header.png" alt="Gohaeng"></a></h1>
        <h2 class="hide">대메뉴</h2>
        <nav class="gnbNav">
            <div class="util">
            	<c:choose>
                  <c:when test="${empty sessionScope.member }">
                  <ul>
                     <li><a href="${pageContext.request.contextPath }/guest/login">로그인</a></li>
                     <li><a href="${pageContext.request.contextPath }/guest/signup">회원가입</a></li>
                     <li><a href="${pageContext.request.contextPath }/mypage/home">마이페이지</a></li>
                     <li><a href="${pageContext.request.contextPath }/callcenter/info">고객센터</a></li>
                  </ul>                  
                  </c:when>
                  <c:otherwise>
                  <ul>
                     <c:choose>
                        <c:when test="${sessionScope.member.id eq 'ADMIN' }">
                           <li><a href="${pageContext.request.contextPath }/admin/">관리자 페이지</a></li>
                        </c:when>
                        <c:otherwise>
                           <li><a href="${pageContext.request.contextPath }/mypage/deposit/1">예치금 : ${member.deposit }원 </a></li>
                        </c:otherwise>
                     </c:choose>
                     <li>${sessionScope.member.name }님</li>
                     <li><a href="${pageContext.request.contextPath }/guest/logout">로그아웃</a></li>
                     <li><a href="${pageContext.request.contextPath }/mypage/home">마이페이지</a></li>
                     <li><a href="${pageContext.request.contextPath }/callcenter/info">고객센터</a></li>
                  </ul>
               </c:otherwise>
               </c:choose>
                
            </div>
            <div id="gnb" class="gnb">
                <ul>
                    <li class="gnb1"><a href="${pageContext.request.contextPath }/purchase/lotto645">복권구매</a>
                        <div class="group">
                            <ul>
                                <li class="gnb1_1"><a href="${pageContext.request.contextPath }/purchase/lotto645"><strong>로또 6/45</strong><span>매주 토요일 추첨<br>6개 숫자 직접 선택</span></a></li>
                                <li class="gnb1_2"><a href="${pageContext.request.contextPath }/purchase/pension520"><strong>연금복권520</strong><span>매주 수요일  추첨<br>500만원씩 20년 지급</span></a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="basic gnb2"><a href="${pageContext.request.contextPath }/gameinfo/lotto645/1">복권정보</a>
                        <div class="group">
                            <ul>
                                <li><a href="${pageContext.request.contextPath }/gameinfo/lotto645/1">로또6/45</a>
                                    <ul class="snb_dep3">
                                        <li><a href="${pageContext.request.contextPath }/gameinfo/lotto645/1">로또 6/45 소개</a></li>
                                        <li><a href="${pageContext.request.contextPath }/gameinfo/lotto645/2">구매하기</a></li>
                                        <li><a href="${pageContext.request.contextPath }/gameinfo/lotto645/3">구매방법</a></li>
                                        <li><a href="${pageContext.request.contextPath }/gameinfo/lotto645/4">추첨안내</a></li>
                                        <li><a href="${pageContext.request.contextPath }/gameinfo/lotto645/5">로또 히스토리</a></li>
                                    </ul>
                                </li>
                                <li><a href="#">연금복권520</a>
                                    <ul class="snb_dep3">
                                        <li><a href="#">연금복권520 소개</a></li>
                                        <li><a href="#">구매하기</a></li>
                                        <li><a href="#">구매방법</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="basic gnb3"><a href="${pageContext.request.contextPath }/gameresult/lotto645/1">당첨결과</a>
                        <div class="group">
                            <ul>
                                <li><a href="${pageContext.request.contextPath }/gameresult/lotto645/1">로또6/45</a>
                                    <ul class="snb_dep3">
                                        <li><a href="${pageContext.request.contextPath }/gameresult/lotto645/1">회차별 당첨번호</a></li>
                                        <li><a href="${pageContext.request.contextPath }/gameresult/lotto645/2">내번호 당첨확인</a></li>
                                        <li><a href="${pageContext.request.contextPath }/gameresult/lotto645/3">당첨내역</a></li>
                                        <li><a href="${pageContext.request.contextPath }/gameresult/lotto645/4">당첨금 지급안내</a></li>
                                        <li><a href="${pageContext.request.contextPath }/gameresult/lotto645/5">추첨방송 다시보기</a></li>
                                        <li><a href="${pageContext.request.contextPath }/gameresult/lotto645/drawshowlist">추첨방송 참관신청</a></li>
                                    </ul>
                                </li>
                                <li><a href="#">연금복권520</a>
                                    <ul class="snb_dep3">
                                        <li><a href="${pageContext.request.contextPath }/gameresult/pension520/1">회차별 당첨번호</a></li>
                                        <li><a href="${pageContext.request.contextPath }/gameresult/pension520/2">내번호 당첨확인</a></li>
                                        <li><a href="${pageContext.request.contextPath }/gameresult/pension520/3">당첨내역</a></li>
                                        <li><a href="${pageContext.request.contextPath }/gameresult/pension520/4">당첨금 지급안내</a></li>
                                        <li><a href="${pageContext.request.contextPath }/gameresult/pension520/5">추첨방송 다시보기</a></li>
                                        <li><a href="${pageContext.request.contextPath }/gameresult/pension520/drawshowlist">추첨방송 참관신청</a></li>
                                    </ul>
                                </li>
                                <li><a href="${pageContext.request.contextPath }/gameresult/lottostat/1">로또6/45 당첨통계</a>
                                    <ul class="snb_dep3">
                                        <li><a href="${pageContext.request.contextPath }/gameresult/lottostat/1">당첨통계</a></li>
                                        <li><a href="${pageContext.request.contextPath }/gameresult/lottostat/2">번호별 통계</a></li>
                                        <li><a href="${pageContext.request.contextPath }/gameresult/lottostat/3">색상 통계</a></li>
                                    </ul>
                                </li>
                            </ul>
                            <ul>
                                <li><a href="#">연금복권520 당첨통계</a></li>
                                <li><a href="#">당첨소식</a>
                                    <ul class="snb_dep3">
                                        <li><a href="${pageContext.request.contextPath }/gameresult/winnerinterview">당첨자 인터뷰</a></li>
                                    </ul>
                                </li>
                                <li><a href="#">미수령 당첨금</a>
                                    <ul class="snb_dep3">
                                        <li><a href="#">로또6/45</a></li>
                                        <li><a href="#">연금복권520</a></li>
                                        <li><a href="#">전자복권</a></li>
                                        <li><a href="#">즉석식 인쇄복권</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="basic gnb4"><a href="${pageContext.request.contextPath }/user/store/1">판매점</a>
                    </li>
                    <li class="basic gnb5"><a href="${pageContext.request.contextPath }/event/list">이벤트</a>
                    </li>
                    <li class="basic gnb6"><a href="${pageContext.request.contextPath }/happy/healthy/1">행복공감</a>
                        <div class="group">
                            <ul>
                                <li><a href="${pageContext.request.contextPath }/happy/healthy/1">건전한 복권문화</a>
                                    <ul class="snb_dep3">
                                        <li><a href="${pageContext.request.contextPath }/happy/healthy/1">복권바로알기</a></li>
                                        <li><a href="${pageContext.request.contextPath }/happy/healthy/2">건전구매 프로그램</a></li>
                                        <li><a href="${pageContext.request.contextPath }/happy/healthy/3">건전화 캠페인</a></li>
                                        <li><a href="#">건전화 책임규정</a></li>
                                        <li><a href="#">복권 과몰입 예방법</a></li>
                                        <li><a href="#">중독예방 및 상담안내</a></li>
                                    </ul>
                                </li>
                                <li><a href="${pageContext.request.contextPath }/happy/fund/1">복권기금</a>
                                    <ul class="snb_dep3">
                                        <li><a href="${pageContext.request.contextPath }/happy/fund/1">복권기금소개</a></li>
                                        <li><a href="${pageContext.request.contextPath }/happy/fund/2">기금사업 진행현황</a></li>
                                    </ul>
                                </li>
                                <li><a href="${pageContext.request.contextPath }/happy/service">행복공감봉사단</a></li>
                                <li><a href="${pageContext.request.contextPath }/happy/promotion">홍보센터</a>
                                    <ul class="snb_dep3">
                                        <li><a href="${pageContext.request.contextPath }/happy/promotion/1">광고</a></li>
                                        <li><a href="${pageContext.request.contextPath }/happy/promotion/2">보도자료</a></li>
                                        <li><a href="${pageContext.request.contextPath }/happy/promotion/3">공지사항</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</header>