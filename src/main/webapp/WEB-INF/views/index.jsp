<%@page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- <section class="head-text">
   <div class="container text-center text-secondary">
      <p>고통을 함께하는 고행복권 :)</p>
   </div>
</section> -->

<!-- ------------------- 헤더메뉴 영역 시작 ------------------- -->
<nav
   class="navbar navbar-expand-lg navbar-light bg-white sticky-top flex-column border-bottom border-secondary">
   <div class="container" id="header-top">
      <a class="navbar-brand" href="${pageContext.request.contextPath }/"> 
         <img src="${pageContext.request.contextPath }/resources/images/index/logo-header.png" width="190px" alt="">
      </a>
      <button class="navbar-toggler" type="button" data-toggle="collapse"
         data-target="#navbarSupportedContent"
         aria-controls="navbarSupportedContent" aria-expanded="false"
         aria-label="Toggle navigation">
         <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
         <ul class="navbar-nav mr-auto w-100 justify-content-end">
            <c:choose>
               <c:when test="${empty sessionScope.member }">
                  <li class="nav-item"><a class="nav-link"
                     href="${pageContext.request.contextPath }/guest/login">로그인</a></li>
                  <li class="nav-item"><a class="nav-link"
                     href="${pageContext.request.contextPath }/guest/signup">회원가입</a></li>
                  <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/mypage/home">마이페이지</a></li>
                  <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/callcenter/info">고객센터</a></li>
               </c:when>

               <c:otherwise>
                  <c:choose>
                        <c:when test="${sessionScope.member.id eq 'ADMIN' }">
                         <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath }/admin/">관리자 페이지</a></li>
                        </c:when>
                        <c:otherwise>
                           <li class="nav-item"><a class="nav-link"
                           href="${pageContext.request.contextPath }/mypage/deposit/1">예치금
                              : ${member.deposit }원 </a></li>
                        </c:otherwise>
                  </c:choose>
                  <li class="nav-item"><a class="nav-link" href="#">${sessionScope.member.name }님</a></li>
                  <li class="nav-item"><a class="nav-link"
                     href="${pageContext.request.contextPath }/guest/logout">로그아웃</a></li>
                  <li class="nav-item"><a class="nav-link"
                     href="${pageContext.request.contextPath }/mypage/home">마이페이지</a></li>
                  <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/callcenter/info">고객센터</a></li>
               </c:otherwise>
            </c:choose>
         </ul>
      </div>
   </div>
   <div class="container" id="header-bot">
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
         <ul class="navbar-nav w-100 justify-content-around">
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/purchase/lotto645">복권구매</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/gameinfo/lotto645/1">복권정보</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/gameresult/lotto645/1">당첨결과</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/user/store/1">판매점</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/event/list">이벤트</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/happy/healthy/1">행복공감</a></li>
         </ul>
      </div>
   </div>
</nav>

<!-- -------------------------- 헤더메뉴 영역 끝 -------------------------- -->
<!-- -------------------------- 메인컨텐츠 영역 시작 -------------------------- -->

<!-- ------------------- 메인 당첨번호 시작 ------------------- -->
<div class="img-portrait">
   <div class="container py-5">
      <div>
         <h5 class="mb-2 text-white text-left">로또 6/45</h5>
         <div class="col-lg-7">

            <div class="win_result">
               <h4 class="text-white">
                  <strong id="games">${lottoGame.games }</strong><strong>회</strong>
                  당첨결과
               </h4>
               <fmt:formatDate var="drawDate" value="${lottoGame.drawDate }"
                  pattern="(yyyy년 MM월 dd일 추첨)" />
               <p id="draw_date" class="desc text-white">${drawDate }</p>
               <div class="nums">
                  <div class="num win">
                     <div id="wns">
                        <c:forEach begin="0" end="5" varStatus="vs" step="1">

                           <fmt:parseNumber var="num"
                              value="${fn:substring(lottoGame.winningNum,vs.index*2,vs.count*2) }" />
                           <c:choose>

                              <c:when test="${num lt 11 }">
                                 <span class="ball_645 lrg ball1">${num }</span>
                              </c:when>
                              <c:when test="${num lt 21 }">
                                 <span class="ball_645 lrg ball2">${num }</span>
                              </c:when>
                              <c:when test="${num lt 31 }">
                                 <span class="ball_645 lrg ball3">${num }</span>
                              </c:when>
                              <c:when test="${num lt 41 }">
                                 <span class="ball_645 lrg ball4">${num }</span>
                              </c:when>
                              <c:otherwise>
                                 <span class="ball_645 lrg ball5">${num }</span>
                              </c:otherwise>
                           </c:choose>
                        </c:forEach>
                     </div>
                  </div>
                  <span class="plus-num">보너스 번호</span>
                  <div class="num bonus">

                     <div id="bns">
                        <c:choose>
                           <c:when test="${lottoGame.bonusNum lt 11 }">
                              <span class="ball_645 lrg ball1">${lottoGame.bonusNum }</span>
                           </c:when>
                           <c:when test="${lottoGame.bonusNum lt 21 }">
                              <span class="ball_645 lrg ball2">${lottoGame.bonusNum }</span>
                           </c:when>
                           <c:when test="${lottoGame.bonusNum lt 31 }">
                              <span class="ball_645 lrg ball3">${lottoGame.bonusNum }</span>
                           </c:when>
                           <c:when test="${lottoGame.bonusNum lt 41 }">
                              <span class="ball_645 lrg ball4">${lottoGame.bonusNum }</span>
                           </c:when>
                           <c:otherwise>
                              <span class="ball_645 lrg ball5">${lottoGame.bonusNum }</span>
                           </c:otherwise>
                        </c:choose>
                     </div>
                  </div>
               </div>
            </div>
            <a href="javascript:void(0)" id="prev_btn"><img
               src="${pageContext.request.contextPath }/resources/images/index/btn_roll_arrow.png"></a>
            <a href="javascript:void(0)" id="next_btn"><img
               src="${pageContext.request.contextPath }/resources/images/index/btn_roll_arrow.png"></a>

         </div>
         <script>
            $(function(){
               var prev = $("#prev_btn");
               var next = $("#next_btn");
               var resultForm = $(".win_result");
               //var test = resultForm.find("#games").text();
               
               var resultNums = resultForm.find("#wns");
               var resultBonus = resultForm.find("#bns");
               
               prev.click(function(){
                  
                  var prevGame = (resultForm.find("#games").text()) - 1;
                 
                  //alert(prevGame);
                  $.getJSON('${pageContext.request.contextPath}/ajax?games='+prevGame,function(data){
                     if(data==null){
                        alert("이전 회차가 없습니다.");
                        return;
                     }
                     // Date() 써서 잘라서 붙인거임
                     var convert = new Date(data.drawDate);
                     var convertedDate = "(" + convert.getFullYear()+"년 "+ ("0"+(convert.getMonth()+1)).slice(-2) + "월 " + ("0"+convert.getDate()).slice(-2)+"일 추첨)";
                     console.log(convertedDate);
                     resultForm.find("#games").html(prevGame);
                     resultForm.find("#draw_date").html(convertedDate);
                     resultNums.html("");

                     var wnums = data.winningNum;

                     for(var i=0; i<6; i++){
                        var num = wnums.substring(i*2,(i+1)*2);
                               if(num < 11){
                                    var tag = "<span class='ball_645 lrg ball1'>"+num+"</span>";
                        }else if(num < 21){
                           var tag = "<span class='ball_645 lrg ball2'>"+num+"</span>";
                        }else if(num < 31){
                           var tag = "<span class='ball_645 lrg ball3'>"+num+"</span>";
                        }else if(num < 41){
                           var tag = "<span class='ball_645 lrg ball4'>"+num+"</span>";
                        }else{
                           var tag = "<span class='ball_645 lrg ball5'>"+num+"</span>";
                        }

                        resultNums.append(tag);
                     }
                     
                     var bnum = data.bonusNum;
                     if(bnum < 11){
                        var tag = "<span class='ball_645 lrg ball1'>"+bnum+"</span>";
                     }else if(bnum < 21){
                        var tag = "<span class='ball_645 lrg ball2'>"+bnum+"</span>";
                     }else if(bnum < 31){
                        var tag = "<span class='ball_645 lrg ball3'>"+bnum+"</span>";
                     }else if(bnum < 41){
                        var tag = "<span class='ball_645 lrg ball4'>"+bnum+"</span>";
                     }else{
                        var tag = "<span class='ball_645 lrg ball5'>"+bnum+"</span>";
                     }
                     resultForm.find("#bns").html(tag);
                     
                     
                  });
               });
               next.click(function(){
                  
                  var nextGame = parseInt(resultForm.find("#games").text()) + 1;
                  
                  //alert(nextGame);
                  $.getJSON('${pageContext.request.contextPath}/ajax?games='+nextGame,function(data){
                     if(data==null){
                        alert("다음 회차가 없습니다.");
                        return;
                     }
                     
                     // Date() 써서 잘라서 붙인거임
                     var convert = new Date(data.drawDate);
                     var convertedDate = "(" + convert.getFullYear()+"년 "+ ("0"+(convert.getMonth()+1)).slice(-2) + "월 " + ("0"+convert.getDate()).slice(-2)+"일 추첨)";
                     console.log(convertedDate);
                     resultForm.find("#games").html(nextGame);
                     resultForm.find("#draw_date").html(convertedDate);
                     resultNums.html("");

                     var wnums = data.winningNum;

                     for(var i=0; i<6; i++){
                        var num = wnums.substring(i*2,(i+1)*2);
                               if(num < 11){
                                    var tag = "<span class='ball_645 lrg ball1'>"+num+"</span>";
                        }else if(num < 21){
                           var tag = "<span class='ball_645 lrg ball2'>"+num+"</span>";
                        }else if(num < 31){
                           var tag = "<span class='ball_645 lrg ball3'>"+num+"</span>";
                        }else if(num < 41){
                           var tag = "<span class='ball_645 lrg ball4'>"+num+"</span>";
                        }else{
                           var tag = "<span class='ball_645 lrg ball5'>"+num+"</span>";
                        }

                        resultNums.append(tag);
                     }
                     
                     var bnum = data.bonusNum;
                     if(bnum < 11){
                        var tag = "<span class='ball_645 lrg ball1'>"+bnum+"</span>";
                     }else if(bnum < 21){
                        var tag = "<span class='ball_645 lrg ball2'>"+bnum+"</span>";
                     }else if(bnum < 31){
                        var tag = "<span class='ball_645 lrg ball3'>"+bnum+"</span>";
                     }else if(bnum < 41){
                        var tag = "<span class='ball_645 lrg ball4'>"+bnum+"</span>";
                     }else{
                        var tag = "<span class='ball_645 lrg ball5'>"+bnum+"</span>";
                     }
                     resultForm.find("#bns").html(tag);
                     
                     
                  });
               });
               
               
                
            });
         </script>
      </div>
   </div>
</div>
<!-- ------------------- 메인 당첨번호 끝 ------------------- -->
<!-- ------------------- 오늘의 운세 시작 ------------------- -->
<div id="fortune-today">
   <div class="container">
      <div class="row mb-3 text-center">
         <div class="col">
            <h2 class="display-4 mb-2">오늘의 운세</h2>
            <p class="lead text-secondary mb-2 pb-2">Fortune of today</p>
         </div>
      </div>
      <div class="row py-3 text-center">
         <div class="col mx-auto">
            <span class="badge badge-pill badge-warning mr-1 font-weight-normal">8월
               8일</span> <span class="text-secondary">당신의 하루를 응원합니다<span
               class="font-italic">!</span></span>
         </div>
      </div>
   </div>
</div>
<div class="container">
   <hr class="m-0">
</div>
<div class="py-2" id="fortune-content">
   <div class="container py-5 my-3">
      <div class="row">
         <c:forEach var="a" items="${fortune }" varStatus="v">
            <fmt:formatNumber minIntegerDigits="2" var="num" value="${v.count}" />
            <div class="col-lg-3 col-md-6 col-sm-12 mb-5">
               <img
                  src="${pageContext.request.contextPath }/resources/images/fortune/ani_${num }.png">
               <h3 class="h5 mt-3 mb-3 text-left">${a.sign }띠</h3>
               <p class="text-secondary lead mb-3 mr-3 text-left">${a.fortune }</p>
            </div>
         </c:forEach>
      </div>
   </div>
</div>
<!-- ------------------- 오늘의 운세 끝 ------------------- -->
<!-- ------------------- 당첨자 인터뷰 시작 ------------------- -->
<div class="py-5 bg-light" id="winterview">
   <div class="container py-4 mt-5">
      <div class="row mb-3 text-center">
         <div class="col">
            <h2 class="display-4 mb-2">당첨자 인터뷰</h2>
            <p class="lead text-secondary mb-5 pb-2">Winner's interview</p>
         </div>
      </div>
      <div class="row pb-3">
         <div class="col-lg-12 mx-auto text-center">
            <div class="card-group mb-4">
               <div class="card pt-5 mb-3 border-white mx-1">
                  <div class="card-body text-center">
                     <img class="rounded-circle mb-4" id="img-cover"
                        src="${pageContext.request.contextPath }/resources/images/index/winner_01.jpg">
                     <h4 class="mb-3">서울 영등포구 양평동</h4>
                     <p class="mb-2 text-secondary lead mx-3">스피또 1등 당첨이라니! 너무 떨려서
                        소감 쓰기도 힘들어요!</p>
                  </div>
                  <div class="card-footer bg-transparent border-0 text-center py-4">
                     <a class="btn-link h4 text-secondary p-2" href="#"> <img
                        src="${pageContext.request.contextPath }/resources/images/index/ico_seller_speetto.png" />
                     </a>
                  </div>
               </div>
               <div class="card pt-5 mb-3 border-white mx-1">
                  <div class="card-body text-center">
                     <img class="rounded-circle mb-4" id="img-cover"
                        src="${pageContext.request.contextPath }/resources/images/index/winner_02.jpg"
                        height="100">
                     <h4 class="mb-3">경기 하남시 하남대로</h4>
                     <p class="mb-2 text-secondary lead mx-3">아버지가 주신 큰 선물,
                        연금복권520 1, 2등 동시 당첨!</p>
                  </div>
                  <div class="card-footer bg-transparent border-0 text-center py-4">
                     <a class="btn-link h4 text-secondary p-2" href="#"> <img
                        src="${pageContext.request.contextPath }/resources/images/index/ico_seller_520.png" />
                     </a>
                  </div>
               </div>
               <div class="card pt-5 mb-3 border-white mx-1">
                  <div class="card-body text-center">
                     <img class="rounded-circle mb-4" id="img-cover"
                        src="${pageContext.request.contextPath }/resources/images/index/default_profile.jpg"
                        height="100">
                     <h4 class="mb-3">인터넷(동행복권 홈페이지)</h4>
                     <p class="mb-2 text-secondary lead mx-3">행복한 부부가 더 행복해지는 길,
                        연금복권 1등 당첨!</p>
                  </div>
                  <div class="card-footer bg-transparent border-0 text-center py-4">
                     <a class="btn-link h4 text-secondary p-2" href="#"> <img
                        src="${pageContext.request.contextPath }/resources/images/index/ico_seller_520.png" />
                     </a>
                  </div>
               </div>
            </div>
            <!-- <a class="btn-link text-secondary" href="#">+ 인터뷰 더보러가기</a> -->
            <div class="row">
               <div class="col text-center">
                  <a class="btn-link text-secondary p-4" href="${pageContext.request.contextPath }/gameresult/winningnews/1"> <i
                     class="material-icons align-middle">arrow_right</i> <span
                     class="align-middle text-decoration-none">인터뷰 더보러가기</span>
                  </a>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>
<!-- ------------------- 당첨자 인터뷰 끝 ------------------- -->
<!-- ------------------- 공지사항&언론보도 시작 ------------------- -->
<div class="py-2" id="noti-and-news">
   <div class="container py-5 my-3">
      <div class="row mb-3 text-center">
         <div class="col">
            <h2 class="display-4 mb-2">공지사항 & 언론보도</h2>
            <p class="lead text-secondary mb-5 pb-2">Notice and Press list</p>
         </div>
      </div>
      <div class="row">
         <div class="col-lg-6 col-md-6 col-sm-12 mb-3" id="main-notice">
            <h3 class="h5 mb-3">공지사항</h3>
            <ul class="text-secondary lead mb-3 mr-3">
            	<c:forEach var="notice" items="${noticeList }">
            	<fmt:formatDate var="regDate" value="${notice.regDate }" pattern="yyyy.MM.dd"/>
            	<li><a class="text-secondary" href="${pageContext.request.contextPath }/happy/promotion/3_detail?index=${notice.index}">
            			<p class="text-truncate">${notice.title }</p>
            		</a>
            		<span class="date">${regDate }</span>	
            	</li>
            	</c:forEach>
            </ul>
         </div>
         <div class="col-lg-6 col-md-6 col-sm-12 mb-3" id="main-notice">
            <h3 class="h5 mb-3">언론보도</h3>
            <ul class="text-secondary lead mb-3 mr-3">
               <li><a class="text-secondary"
                  href="/service.do?method=noticeView&amp;wiselog=C_C_1_3&amp;noticeSerial=27">
                     <p class="text-truncate" title="가상계좌 입금수수료 보상 이벤트">가상계좌 입금수수료
                        보상 이벤트</p>
               </a><span class="date">2019.07.31</span></li>
               <li><a class="text-secondary"
                  href="/service.do?method=noticeView&amp;wiselog=C_C_1_3&amp;noticeSerial=26">
                     <p title="2019년 온라인(로또)복권 신규판매인 모집 당첨자 안내">2019년 온라인(로또)복권
                        신규판매인 모집 당첨자 안내</p>
               </a><span class="date">2019.07.30</span></li>
               <li><a class="text-secondary"
                  href="/service.do?method=noticeView&amp;wiselog=C_C_1_3&amp;noticeSerial=25">
                     <p title="예치금충전 서비스 변경 안내">예치금충전 서비스 변경 안내</p>
               </a><span class="date">2019.07.22</span></li>
            </ul>
         </div>
      </div>
      <div class="row">
         <div class="col text-center">
            <a class="btn-link text-secondary p-4" href="${pageContext.request.contextPath }/happy/promotion/3"> <i
               class="material-icons align-middle">arrow_right</i> <span
               class="align-middle text-decoration-none">공지사항 더보러가기</span>
            </a>
         </div>
      </div>
   </div>
</div>
<!-- ------------------- 공지사항&언론보도 끝 ------------------- -->
<!-- ------------------- 사이트맵 시작 ------------------- -->
<div class="py-5 bg-light" id="sitemap">
   <div class="container py-3">
      <div class="row mb-3 text-center">
         <div class="col">
            <h2 class="display-4 mb-2">주요 메뉴</h2>
            <p class="lead text-secondary mb-5 pb-2">Primary menu</p>
         </div>
      </div>
      <div class="row mb-5">
         <div class="col-lg-12 m-auto">
            <div class="card-group">
               <div class="card border rounded">
                  <div class="card-img-top plain-bg text-center">
                     <h5 class="card-title font-weight-normal text-secondary pt-2">게임구매</h5>
                  </div>
                  <ul class="card-body pt-3">
                     <li class="card-text text-secondary mb-4"><a
                        class="card-link" href="#">로또6/45</a></li>
                     <li class="card-text text-secondary mb-4"><a
                        class="card-link" href="#">연금복권520</a></li>
                  </ul>
               </div>
               <div class="card border rounded">
                  <div class="card-img-top plain-bg text-center">
                     <h5 class="card-title font-weight-normal text-secondary pt-2">게임정보</h5>
                  </div>
                  <ul class="card-body pt-3">
                     <li class="card-text text-secondary mb-4"><a
                        class="card-link" href="#">로또6/45</a></li>
                     <li class="card-text text-secondary mb-4"><a
                        class="card-link" href="#">연금복권520</a></li>
                  </ul>
               </div>
               <div class="card border rounded">
                  <div class="card-img-top plain-bg text-center">
                     <h5 class="card-title font-weight-normal text-secondary pt-2">게임결과</h5>
                  </div>
                  <ul class="card-body pt-3">
                     <li class="card-text text-secondary mb-4"><a
                        class="card-link" href="#">로또6/45</a></li>
                     <li class="card-text text-secondary mb-4"><a
                        class="card-link" href="#">연금복권520</a></li>
                     <li class="card-text text-secondary mb-4"><a
                        class="card-link" href="#">로또6/45 당첨통계</a></li>
                     <li class="card-text text-secondary mb-4"><a
                        class="card-link" href="#">연금복권520 당첨통계</a></li>
                     <li class="card-text text-secondary mb-4"><a
                        class="card-link" href="#">당첨소식</a></li>
                     <li class="card-text text-secondary mb-4"><a
                        class="card-link" href="#">미수령당첨금</a></li>
                  </ul>
               </div>
               <div class="card border rounded">
                  <div class="card-img-top plain-bg text-center">
                     <h5 class="card-title font-weight-normal text-secondary pt-2">판매점</h5>
                  </div>
                  <ul class="card-body pt-3">
                     <li class="card-text text-secondary mb-4"><a
                        class="card-link" href="#">로또6/45판매점 조회</a></li>
                     <li class="card-text text-secondary mb-4"><a
                        class="card-link" href="#">즉석 및 연금복권 판매점 조회</a></li>
                  </ul>
               </div>
               <div class="card border rounded">
                  <div class="card-img-top plain-bg text-center">
                     <h5 class="card-title font-weight-normal text-secondary pt-2">이벤트</h5>
                  </div>
                  <ul class="card-body pt-3">
                     <li class="card-text text-secondary mb-4"><a
                        class="card-link" href="#">이벤트</a></li>
                  </ul>
               </div>
               <div class="card border rounded">
                  <div class="card-img-top plain-bg text-center">
                     <h5 class="card-title font-weight-normal text-secondary pt-2">행복공감</h5>
                  </div>
                  <ul class="card-body pt-3">
                     <li class="card-text text-secondary mb-4"><a
                        class="card-link" href="#">건전한 복권문화</a></li>
                     <li class="card-text text-secondary mb-4"><a
                        class="card-link" href="#">복권기금</a></li>
                     <li class="card-text text-secondary mb-4"><a
                        class="card-link" href="#">행복공감봉사단</a></li>
                     <li class="card-text text-secondary mb-4"><a
                        class="card-link" href="#">홍보센터</a></li>
                  </ul>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>

<!-- ------------------- 사이트맵 끝 ------------------- -->
<!-- -------------------------- 푸터 영역 시작 -------------------------- -->
<footer class="bg-dark pt-3 pb-3">
   <div class="container">
      <div class="row">
         <a class="navbar-brand" href="#"> <img
            src="${pageContext.request.contextPath }/resources/images/index/logo-footer-w.png"
            width="120px" alt="">
         </a>
         <dl>
            <dt class="text-white">Copyright (c)</dt>
            <dd class="text-white ">2019 JSCB gohaenglotto. All rights
               reserved</dd>
         </dl>
      </div>
   </div>
</footer>








