<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="body">
   <div class="containerWrap">
      <section class="contentSection">
         <!-- ----------왼쪽메뉴---------- 영역 -->
         <nav class="lnbNav">

            <div id="snb" class="lnb">
               <h2 id="08" class="lnb_title">고객센터</h2>
               <ul id="lnb" class="lnb_dep1">
                  <li id="08-01" class="active"><a href="#" class="menuLnb"><span>고객센터
                           안내</span></a></li>
                  <li id="08-02"><a href="#" class="menuLnb"><span>자주
                           묻는 질문</span></a></li>
                  <li id="08-03"><a href="#" class="menuLnb"><span>1:1상담</span></a>
                  </li>
                  <li id="08-06"><a href="#" class="menuLnb"><span>모바일
                           동행복권 </span></a></li>
                  <li id="08-04"><a href="#" class="menuLnb"><span>사용자
                           가이드</span></a>
                     <ul class="lnb_dep2" style="display: none;">
                        <li id="08-04-01"><a href="#"><span>당첨자 가이드 </span></a></li>
                        <li id="08-04-02"><a href="#"><span>이용자 가이드 </span></a></li>
                     </ul></li>
               </ul>
            </div>

         </nav>
         <!-- -------------------------------------- -->
         <!-- ----------메인컨텐츠---------- 영역 -->
         <main id="article" class="contentsArticle">
         <div class="header_article">
            <h3 class="sub_title">1:1 상담</h3>
            <p class="location">
               <a class="home" href="/"> Home </a><span class="gt">&gt;</span><a
                  href="#">고객센터</a><span class="gt">&gt;</span><a href="#">1:1상담</a>
            </p>
         </div>
         <div>
            <div class="content_wrap content_1on1_counsel">
               <!-- -------------------------------------------------------------------------------------- -->


               <form id="Frm" name="Frm" method="post" action="insert">
                     <input type="text" id="inq_seq" name="inq_seq" style="display:none;" title="inq_seq">
                     <table class="tbl_data tbl_form">  
                     <caption>분류, 제목, 내용 등 1대1 상담 내용을 입력합니다.</caption>
                     <colgroup>
                        <col style="width:110px">
                        <col>
                     </colgroup>
                     <thead>
                        <tr>
                           <th scope="row"><span>분류</span><span class="req">*<span>필수입력</span></span></th>
                           <td>
                                 <select id="cat" name="category" title="상담 분류 선택">
                                       <option value="">선택</option>
                                       
                                          <option value="복권문의">복권문의</option>
                                       
                                          <option value="예치금">예치금</option>
                                       
                                          <option value="결제">결제</option>
                                       
                                          <option value="기타">기타</option>
                                       
                                          <option value="로또판매점">로또판매점</option>
                                       
                                    </select>
                              </td>
                        </tr>
                         <tr>
                           <th scope="row"><span>제목</span><span class="req">*<span>필수입력</span></span></th>
                           <td>
                                 <input type="text" id="title" name="title" maxlength="100" value="" style="width:100%" title="제목 입력">
                              </td>
                        </tr>
                          <tr>
                           <th scope="row"><span>내용</span><span class="req">*<span>필수입력</span></span></th>
                           <td>
                                 <textarea title="내용 입력" id="content" name="content" maxlength="2000" onkeyup="checkMaxSize(2000,'content');" style="height:200px"></textarea>
                                 <p class="comt_valid color_key1">* 내용은 2000자까지 입력이 가능합니다.</p>
                                 <p class="comt_valid">* 1:1상담 게시판 및 고객센터 이용 시 욕설 및 비방, 혐오표현 등이 포함되어 있는 경우 “이용약관 제7조(서비스의 이용 및 제한) 7조 3항 6”에 따라 사전통지 없이 탈퇴 또는 일정기간 동안 서비스 이용에 제한을 받을 수 있습니다. 
                                 <br> 또한 “정보통신망 이용촉진 및 정보보호 등에 관한 법률 제44조의7(불법정보의 유통금지 등)” 등에 의해  처벌받을 수 있사오니, 이 점 양지하시어 이용 부탁드립니다.</p>
                              </td>
                        </tr>
                     </thead>
                  </table>
                  </form>
                  <p class="note_result_search bottom"><span class="color_key1">*</span>는 필수 입력사항입니다.</p>
                  <div class="btns_submit search">
                     
                      <a id="submit" class="btn_common mid blu">등록하기</a>
                   
                    <a class="btn_common mid" href="list">내 상담목록</a>
                  </div>
                  <div class="group_content">
                       <div class="group_inner">
                          <ul class="list_text_common">
                             <li>인터넷 서비스에 대한 이용에 대한 문의사항을 등록해 주시면 답변해 드리고 있습니다.</li>
                             <li>1:1상담 게시판 및 고객센터 이용 시 욕설 및 비방, 혐오표현 등이 포함되어 있는 경우 "이용약관 제7조(서비스의 이용 및 제한) 7조 3항 6"에 따라 사전통지 없이 탈퇴 또는 일정기간 동안 서비스 이용에 제한을 받을 수 있습니다.</li>
                             <li>또한 “정보통신망 이용촉진 및 정보보호 등에 관한 법률 제44조의7(불법정보의 유통금지 등)” 등에 의해 처벌받을 수 있사오니, 이 점 양지하시어 이용 부탁드립니다.</li>
                          </ul>
                       </div>
                   </div>
				
				<script>
					$(function(){		 			
						$('#submit').click(function(){
							var ans = confirm("해당 내용으로 등록하시겠습니까?");
							if(!ans){
								return;
							}else{
								$('#Frm').submit();
							}						
						});
					});
				</script>
				
				<script>
				function checkMaxSize(sz,id) {
					var form = $('#Frm');
					var obj = document.getElementById(id);
					console.log(obj.value);
					console.log(sz);
					if(obj.value.length >= sz){
						if(event.keyCode != '8'){
							alert('2000자까지 입력가능합니다.');
						}
						obj.value = obj.value.substring(0,sz);
					}
				}
				</script>
               <!-- -------------------------------------------------------------------------------------- -->
            </div>
         </div>
         </main>
         <!-- -------------------------------------- -->
      </section>
   </div>
</div>
<!-- ----------------------------------------------------- -->